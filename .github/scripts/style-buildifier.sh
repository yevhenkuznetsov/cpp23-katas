#!/usr/bin/env bash

set -euo pipefail

echo "Running buildifier on changed Starlark files..."

buildifier --version

format_exit_code=0
unformatted=$(git ls-files '*.bzl' 'BUILD' 'BUILD.*' 'WORKSPACE' 'WORKSPACE.*' | xargs buildifier --lint=warn --mode=check 2>&1) || format_exit_code=$?

if [[ $format_exit_code -ne 0 ]]; then
  echo "buildifier found formatting issues:"
  # Echo the output directly to preserve details
  git ls-files '*.bzl' 'BUILD' 'BUILD.*' 'WORKSPACE' 'WORKSPACE.*' | xargs buildifier --lint=warn --mode=check
fi
 
echo "buildifier: OK"
exit $format_exit_code
