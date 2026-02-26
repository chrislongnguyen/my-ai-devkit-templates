#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR" || exit 1

failures=()

print_section() {
  printf '\n[%s] %s\n' "$1" "$2"
}

mark_pass() {
  printf 'PASS: %s\n' "$1"
}

mark_fail() {
  printf 'FAIL: %s\n' "$1"
  failures+=("$1")
}

check_required_paths() {
  local missing=()
  local path

  local required_paths=(
    "README.md"
    "CHANGELOG.md"
    "engine/SKILL.md"
    "engine/commands/state-a.md"
    "engine/commands/state-b.md"
    ".cursor/commands/state-a.md"
    ".cursor/commands/state-b.md"
    "docs/ai/requirements"
    "docs/ai/design"
    "docs/ai/planning"
    "docs/ai/frameworks"
    "docs/ai/examples"
    ".claude/CLAUDE.md"
    ".antigravity/README.md"
    "openclaw/AGENTS.md"
  )

  for path in "${required_paths[@]}"; do
    if [[ ! -e "$path" ]]; then
      missing+=("$path")
    fi
  done

  if [[ ${#missing[@]} -eq 0 ]]; then
    mark_pass "Canonical files/folders are present."
  else
    mark_fail "Missing canonical files/folders: ${missing[*]}"
  fi
}

check_legacy_paths() {
  local found=()
  local path

  local legacy_paths=(
    ".cursor/skills/dev-lifecycle/references/legacy_codeaholic"
    ".ai-devkit.json"
    "ai-devkit-init-merge.yaml"
    "docs/ai/implementation"
    "docs/ai/deployment"
    "docs/ai/monitoring"
  )

  for path in "${legacy_paths[@]}"; do
    if [[ -e "$path" ]]; then
      found+=("$path")
    fi
  done

  if [[ ${#found[@]} -eq 0 ]]; then
    mark_pass "No legacy artifact paths found."
  else
    mark_fail "Legacy artifact paths still exist: ${found[*]}"
  fi
}

check_cursor_command_see_refs() {
  local issues=()
  local file

  for file in .cursor/commands/*.md; do
    if [[ ! -f "$file" ]]; then
      continue
    fi

    local see_line
    see_line="$(awk '/^See:[[:space:]]*/ {print; exit}' "$file" || true)"

    if [[ -z "$see_line" ]]; then
      issues+=("$file: missing See: pointer")
      continue
    fi

    local target
    target="$(printf '%s\n' "$see_line" | sed -E 's/^See:[[:space:]]*//')"

    if [[ -z "$target" ]]; then
      issues+=("$file: empty See: pointer")
      continue
    fi

    if [[ ! -e "$target" ]]; then
      issues+=("$file: broken See: pointer -> $target")
    fi
  done

  if [[ ${#issues[@]} -eq 0 ]]; then
    mark_pass "All .cursor/commands See: pointers resolve."
  else
    mark_fail "Broken .cursor/commands See: pointers: ${issues[*]}"
  fi
}

check_engine_ide_paths() {
  local matches

  matches="$(grep -R -n -E '\.cursor|CLAUDE\.md|antigravity|\.claude|openclaw/' engine 2>/dev/null || true)"

  if [[ -z "$matches" ]]; then
    mark_pass "engine/ has no IDE-specific path references."
  else
    mark_fail "engine/ contains IDE-specific path references."
    printf 'Details:\n%s\n' "$matches"
  fi
}

print_section "A" "Canonical files/folders present"
check_required_paths

print_section "B" "No legacy artifact paths"
check_legacy_paths

print_section "C" "No broken See: cross-references in .cursor/commands"
check_cursor_command_see_refs

print_section "D" "No IDE-specific paths in engine/"
check_engine_ide_paths

if [[ ${#failures[@]} -gt 0 ]]; then
  printf '\ncheck-engine.sh FAILED\n'
  printf 'Violations (%s):\n' "${#failures[@]}"
  printf ' - %s\n' "${failures[@]}"
  exit 1
fi

printf '\ncheck-engine.sh PASSED\n'
exit 0
