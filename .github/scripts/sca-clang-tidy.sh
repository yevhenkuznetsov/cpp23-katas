#!/usr/bin/env bash
set -euo pipefail

echo "Generating compile commands for clang-tidy analysis..."
bazel run //:refresh_compile_commands

echo "Running clang-tidy on changed source files..."
clang-tidy --version

source "$(dirname "$0")/git-changed-files.sh"

files=$(changed_files '*.cpp' '*.hpp')

analysis_exit_code=0
if [ -z "$files" ]; then
  echo "No relevant files changed. Skipping analysis."
  exit $analysis_exit_code
fi

# Run clang-tidy on changed files
echo "Running clang-tidy on changed files..."
for file in $files; do
  if [ -f "$file" ]; then
    echo "Analyzing $file"
    # The config will be automatically found in the project root
    clang-tidy --warnings-as-errors=* "$file" || analysis_exit_code=1
  fi
done

exit $analysis_exit_code
