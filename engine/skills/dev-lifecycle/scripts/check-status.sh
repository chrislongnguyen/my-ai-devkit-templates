#!/usr/bin/env bash
set -euo pipefail

# Infer current lifecycle phase for a feature by checking doc state.
# Usage: check-status.sh <feature-name>

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <feature-name>"
  exit 1
fi

FEATURE="$1"
DOCS="docs/ai"

exists() { [[ -f "$1" ]]; }
nonempty() { [[ -f "$1" ]] && [[ -s "$1" ]]; }

REQ="$DOCS/requirements/feature-${FEATURE}.md"
DES="$DOCS/design/feature-${FEATURE}.md"
PLN="$DOCS/planning/feature-${FEATURE}.md"

echo "=== Status: $FEATURE ==="

# Check which docs exist (requirements, design, planning only — no implementation/testing)
for doc in "$REQ" "$DES" "$PLN"; do
  if exists "$doc"; then
    echo "[EXISTS] $doc"
  else
    echo "[MISS]   $doc"
  fi
done

# Count planning tasks if planning doc exists
if exists "$PLN"; then
  TOTAL=$(grep -c '^\s*- \[' "$PLN" 2>/dev/null || echo 0)
  DONE=$(grep -c '^\s*- \[x\]' "$PLN" 2>/dev/null || echo 0)
  TODO=$((TOTAL - DONE))
  echo ""
  echo "Planning: $DONE/$TOTAL tasks done, $TODO remaining"
fi

echo ""
echo "--- Suggested phase ---"
if ! exists "$REQ"; then
  echo "State A — no requirements doc yet"
elif ! exists "$DES"; then
  echo "State A — requirements exist but no design doc"
elif ! exists "$PLN"; then
  echo "State A — design exists but no planning doc"
elif exists "$PLN" && [[ ${TODO:-0} -gt 0 ]]; then
  echo "State B (Execute) — $TODO tasks remaining"
elif exists "$PLN" && [[ ${TODO:-0} -eq 0 ]] && [[ ${TOTAL:-0} -gt 0 ]]; then
  echo "All tasks done — verify against design"
else
  echo "State A — docs exist, review for completeness"
fi
