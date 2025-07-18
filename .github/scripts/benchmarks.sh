#!/usr/bin/env bash
set -eu

for target in $(bazel query 'attr("tags","benchmark", //...:*)'); do
  echo "Running $target"
  bazel run $target
done
