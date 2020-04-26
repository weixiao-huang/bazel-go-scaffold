#!/usr/bin/env bash

# we simply copy files from the first several lines from repo-infra in
# https://github.com/kubernetes/repo-infra/blob/v0.0.3/hack/update-deps.sh
# if you want to change the content, you can copy all and modify it

set -o errexit
set -o nounset
set -o pipefail

if [[ -n "${BUILD_WORKSPACE_DIRECTORY:-}" ]]; then # Running inside bazel
  echo "Updating bazel rules..." >&2
elif ! command -v bazel &>/dev/null; then
  echo "Install bazel at https://bazel.build" >&2
  exit 1
else
  (
    set -o xtrace
    bazel run @io_k8s_repo_infra//hack:update-bazel
  )
  exit 0
fi
