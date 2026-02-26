#!/usr/bin/env bash
# One-command guardrail setup: install pre-commit hook and make check-engine.sh executable.
# Run from repo root: ./setup.sh or bash setup.sh

set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-.}")" && pwd)"
cd "$ROOT" || exit 1

if [[ ! -d .git/hooks ]]; then
  echo "setup.sh: Not a git repo or missing .git/hooks. Run this from the repository root."
  exit 1
fi

if [[ ! -f scripts/pre-commit ]]; then
  echo "setup.sh: scripts/pre-commit not found. Cannot install pre-commit hook."
  exit 1
fi

cp scripts/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
echo "Pre-commit hook installed: .git/hooks/pre-commit (blocks code without Holy Trinity, blocks .env/secrets)."

if [[ ! -f check-engine.sh ]]; then
  echo "setup.sh: check-engine.sh not found."
  exit 1
fi
chmod +x check-engine.sh
echo "check-engine.sh is executable."

echo ""
echo "Running check-engine.sh to confirm engine structure..."
if ./check-engine.sh; then
  echo ""
  echo "Setup complete. Guardrails are active: pre-commit hook and check-engine.sh ready."
else
  echo ""
  echo "Setup installed the hook and made check-engine.sh executable, but check-engine.sh reported issues. Fix the reported violations and run ./check-engine.sh again."
  exit 1
fi
