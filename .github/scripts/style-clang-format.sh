#!/usr/bin/env bash

set -euo pipefail

echo "Running clang-format on changed source files..."

clang-format -version

format_exit_code=0
unformatted=$(git ls-files '*.[ch]pp' '*.[ch]xx' '*.[ch]' '*.cc' '*.hh' | xargs clang-format -style=file --dry-run --Werror 2>&1) || format_exit_code=$?

if [[ $format_exit_code -ne 0 ]]; then
  echo "clang-format found formatting issues:"
  # Echo the output directly to preserve colors
  git ls-files '*.[ch]pp' '*.[ch]xx' '*.[ch]' '*.cc' '*.hh' | xargs clang-format -style=file --dry-run --Werror
fi
 
echo "clang-format: OK"
exit $format_exit_code
