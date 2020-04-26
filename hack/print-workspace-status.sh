#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

git_commit_date="$(git show -s --format=%cd --date=format:%Y%m%d%H%M%S HEAD)"
git_commit_hash="$(git log --format=%H -n 1 | head -c 12)"
pseudo_version="v0.0.0-${git_commit_date}-${git_commit_hash}"

if git_status=$(git status --porcelain 2>/dev/null) && [[ -n ${git_status} ]]; then
  pseudo_version+="-dirty"
fi

cat <<EOF
PSEUDO_VERSION ${pseudo_version}
DOCKER_TAG ${pseudo_version}
DOCKER_REGISTRY ${DOCKER_REGISTRY:-docker.io}
EOF
