#!/usr/bin/env bash
set -euo pipefail

echo "Running cppcheck on changed source files..."
cppcheck --version

source "$(dirname "$0")/git-changed-files.sh"

files=$(changed_files '*.cpp' '*.hpp')

cppcheck_exit_code=0
if [ -z "$files" ]; then
  echo "No relevant files changed. Skipping cppcheck."
  exit $cppcheck_exit_code
fi
  
for file in $files; do
  if [ -f "$file" ]; then
    cppcheck "$file" \
      --error-exitcode=1 \
      --enable=warning,style,performance,portability || cppcheck_exit_code=1
  fi
done
exit $cppcheck_exit_code
