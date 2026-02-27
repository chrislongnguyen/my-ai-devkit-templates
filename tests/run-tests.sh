#!/usr/bin/env bash
# Discover and run the project's test runner. Exit 0 = pass or no tests; non-zero = failure.
# Invoked by /test at each iteration boundary. See tests/README.md for contract.

set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [ -f "package.json" ] && grep -q '"test"' package.json 2>/dev/null; then
  npm test
  exit
fi
if command -v pytest &>/dev/null && { [ -f "pyproject.toml" ] || [ -f "setup.py" ] || [ -n "$(find . -maxdepth 2 -name 'test_*.py' -o -name '*_test.py' 2>/dev/null | head -1)" ]; }; then
  pytest
  exit
fi
if [ -f "Cargo.toml" ]; then
  cargo test
  exit
fi
if [ -f "go.mod" ]; then
  go test ./...
  exit
fi

echo "No tests defined yet — add a test runner or script for your stack"
exit 0
