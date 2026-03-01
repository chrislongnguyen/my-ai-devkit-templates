#!/usr/bin/env bash
# Append one row to the Learning Loop Log (§5) in the feature design doc.
# Used by CI (and optionally by agent) so learning-loop recording is automatic.
# Usage: append-learning-loop.sh <feature-name> <test-exit-code> [outcome-one-line]
# Example: append-learning-loop.sh automated-test-verification 0 "CI: run-tests.sh exit 0."
# See tests/README.md and engine/commands/test.md.

set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FEATURE_NAME="${1:-}"
EXIT_CODE="${2:-0}"
OUTCOME="${3:-}"

if [ -z "$FEATURE_NAME" ]; then
  exit 0
fi

DESIGN_DOC="docs/ai/design/feature-${FEATURE_NAME}.md"
if [ ! -f "$DESIGN_DOC" ] || ! grep -q "# 5. LEARNING LOOP LOG" "$DESIGN_DOC"; then
  exit 0
fi

if [ "$EXIT_CODE" = "0" ]; then
  RESULT="Pass"
else
  RESULT="Fail"
fi
[ -n "$OUTCOME" ] || OUTCOME="CI: run-tests.sh exit code ${EXIT_CODE}."
DATE="$(date +%Y-%m-%d)"
REF="Req Verb-AC1, Noun-AC1; Design §2.2"
NEW_ROW="| ${DATE} | CI | ${RESULT} | ${OUTCOME} | ${REF} |"

# Insert after the last table data row (line starting with | YYYY-MM-DD)
LAST_NUM=""
while IFS= read -r rec; do
  LAST_NUM="${rec%%:*}"
done < <(grep -n '^| [0-9][0-9][0-9][0-9]-' "$DESIGN_DOC" 2>/dev/null || true)
[ -z "$LAST_NUM" ] && exit 0

{
  head -n "$LAST_NUM" "$DESIGN_DOC"
  echo "$NEW_ROW"
  tail -n "+$((LAST_NUM + 1))" "$DESIGN_DOC"
} > "${DESIGN_DOC}.tmp"
mv "${DESIGN_DOC}.tmp" "$DESIGN_DOC"
