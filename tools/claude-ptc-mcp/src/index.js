import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";
import Anthropic from "@anthropic-ai/sdk";
import fs from "fs";
import path from "path";

const server = new McpServer({
  name: "claude-ptc",
  version: "0.1.0",
});

// Critical parameters: server does not guess or substitute defaults (SustainAdj-AC2).
// When a critical param is missing, return an elicitation message; user provides input and re-invokes (SustainAdv-AC1, SustainAdv-AC2).
function needsElicitation(prompt, scope) {
  if (prompt == null || String(prompt).trim() === "") {
    return { param: "prompt", message: "Missing critical parameter: prompt. Please provide your analysis question or task and re-invoke run_heavy_analysis_ptc." };
  }
  return null;
}

// Noun-AC3: Server can read workspace files or receive paths and pass to API as designed.
const MAX_FILES = 20;
const MAX_FILE_BYTES = 100_000;

function resolveScopePaths(scope) {
  if (scope == null) return [];
  const root = process.env.WORKSPACE_ROOT;
  if (!root) return Array.isArray(scope) ? scope : [scope];
  const base = path.resolve(root);
  return (Array.isArray(scope) ? scope : [scope]).map((p) => path.resolve(base, p));
}

function readScopeContent(scope) {
  const paths = resolveScopePaths(scope);
  if (paths.length === 0) return null;
  const parts = [];
  let totalBytes = 0;
  let fileCount = 0;
  for (const p of paths) {
    if (fileCount >= MAX_FILES || totalBytes >= MAX_FILE_BYTES) break;
    try {
      const stat = fs.statSync(p);
      if (stat.isDirectory()) {
        const entries = fs.readdirSync(p, { withFileTypes: true });
        for (const e of entries) {
          if (fileCount >= MAX_FILES || totalBytes >= MAX_FILE_BYTES) break;
          const full = path.join(p, e.name);
          if (e.isFile() && !e.name.startsWith(".")) {
            const buf = fs.readFileSync(full, { encoding: "utf8", flag: "r" });
            const len = Buffer.byteLength(buf, "utf8");
            if (len > MAX_FILE_BYTES) continue;
            totalBytes += len;
            fileCount += 1;
            parts.push(`\n--- ${e.name} ---\n${buf.slice(0, 5000)}${buf.length > 5000 ? "\n...[truncated]" : ""}`);
          }
        }
        continue;
      }
      const buf = fs.readFileSync(p, { encoding: "utf8", flag: "r" });
      const len = Buffer.byteLength(buf, "utf8");
      if (len > MAX_FILE_BYTES) continue;
      totalBytes += len;
      fileCount += 1;
      parts.push(`\n--- ${path.basename(p)} ---\n${buf.slice(0, 5000)}${buf.length > 5000 ? "\n...[truncated]" : ""}`);
    } catch (_) {
      // skip unreadable paths
    }
  }
  return parts.length > 0 ? parts.join("\n") : null;
}

// EffAdv-AC1, EffAdj-AC1: Saved cacheable static block sent with each request so Prompt Caching applies.
const CACHEABLE_SYSTEM_BLOCK = `You are a heavy-analysis assistant. You receive file content or paths and a user prompt.
Your only job is to produce a concise summary or structured answer. Do not dump full file contents into your response.
Use code execution when helpful to process data; return only the final summary or result. Keep the response small and scannable.`;

// Noun-AC2: Server calls Anthropic API with code execution (PTC); only summary returned to IDE.
async function callAnthropic(userMessage) {
  const apiKey = process.env.ANTHROPIC_API_KEY;
  if (!apiKey || String(apiKey).trim() === "") {
    return { error: "ANTHROPIC_API_KEY is not set. Set it in your environment or MCP server config to use heavy analysis." };
  }
  const client = new Anthropic({ apiKey });
  try {
    const response = await client.beta.messages.create({
      model: "claude-sonnet-4-20250514",
      max_tokens: 2048,
      stream: false,
      system: CACHEABLE_SYSTEM_BLOCK,
      cache_control: { type: "ephemeral", ttl: "5m" },
      tools: [{ name: "code_execution", type: "code_execution_20250825" }],
      messages: [{ role: "user", content: userMessage }],
    });
    const textParts = (response.content || [])
      .filter((b) => b.type === "text" && b.text)
      .map((b) => b.text);
    return { summary: textParts.join("\n").trim() || "(No text in response)" };
  } catch (err) {
    const message = err?.message ?? String(err);
    return { error: `Anthropic API error: ${message}` };
  }
}

server.tool(
  "run_heavy_analysis_ptc",
  "Delegate heavy analysis to the Anthropic API with code execution (PTC). Returns a concise summary to the IDE.",
  {
    prompt: z.string().describe("The analysis question or task for Claude to perform."),
    scope: z
      .union([z.string(), z.array(z.string())])
      .optional()
      .describe("Optional directory or list of file paths to include in scope."),
  },
  async ({ prompt, scope }) => {
    const elicitation = needsElicitation(prompt, scope);
    if (elicitation) {
      return {
        content: [{ type: "text", text: `[Elicitation] ${elicitation.message}` }],
      };
    }

    const scopeContent = readScopeContent(scope);
    const scopeDesc = scope !== undefined ? `Scope: ${JSON.stringify(scope)}` : "Scope: (none)";
    const userMessage = scopeContent
      ? `You have the following file content (or paths) in scope. Answer the user's prompt with a concise summary; do not dump full file contents.\n\n${scopeDesc}\n\nFile content:\n${scopeContent}\n\nUser prompt: ${prompt}`
      : `${scopeDesc}\n\nUser prompt: ${prompt}`;

    const result = await callAnthropic(userMessage);
    if (result.error) {
      return { content: [{ type: "text", text: `[Error] ${result.error}` }] };
    }
    return { content: [{ type: "text", text: result.summary }] };
  }
);

async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
}

main();
