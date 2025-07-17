#!/usr/bin/env bash
set -euo pipefail

GITHUB_EVENT_NAME=${GITHUB_EVENT_NAME-}
GITHUB_BASE_REF=${GITHUB_BASE_REF-}
GITHUB_REF=${GITHUB_REF-}

DEFAULT_BRANCH="master"

# Echo a list of changed files that match the globs passed in
changed_files() {
  local patterns=("$@")
  local range

  if [[ "$GITHUB_EVENT_NAME" == "pull_request" && -n "${GITHUB_BASE_REF:-}" ]]; then
    range="origin/$GITHUB_BASE_REF...HEAD"
  else
    local head
    head=$(git remote show origin | awk '/HEAD branch/ {print $NF}')
    [[ -z $head ]] && head="$DEFAULT_BRANCH"
    range="origin/$head...HEAD"
  fi

  git diff --name-only $range -- "${patterns[@]}"
}
