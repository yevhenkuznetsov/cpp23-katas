#!/usr/bin/env bash
set -euo pipefail

echo "Running clang-tidy on changed source files..."
clang-tidy --version

# Properly check for pull request events
if [[ "${GITHUB_EVENT_NAME:-}" == "pull_request" && -n "${GITHUB_BASE_REF:-}" ]]; then
  echo "Pull request: Using base ref: ${GITHUB_BASE_REF}"
  files=$(git diff --name-only origin/"${GITHUB_BASE_REF}"...HEAD -- '*.c' '*.cpp' '*.h' '*.hpp')
elif [[ -n "${GITHUB_REF:-}" ]]; then
  echo "Push event: Comparing against default branch"
  # Try to get the default branch name
  DEFAULT_BRANCH=$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)
  echo "Default branch identified as: ${DEFAULT_BRANCH}"
  
  if [[ -z "${DEFAULT_BRANCH:-}" ]]; then
    DEFAULT_BRANCH="master"
    echo "Could not detect default branch, falling back to: ${DEFAULT_BRANCH}"
  fi
  
  files=$(git diff --name-only origin/"${DEFAULT_BRANCH}"...HEAD -- '*.c' '*.cpp' '*.h' '*.hpp')
else
  echo "Not running in GitHub CI environment, using local changes"
  files=$( (git diff --name-only -- '*.c' '*.cpp' '*.h' '*.hpp'; 
        git diff --name-only --cached -- '*.c' '*.cpp' '*.h' '*.hpp') | sort -u)
fi

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
