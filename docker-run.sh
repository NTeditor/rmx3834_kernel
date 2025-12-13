#!/bin/bash

set -euo pipefail
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

docker run --rm -it \
    --name "rmx3834-kernel" \
    --user "$(id -u):$(id -g)" \
    -v "$REPO_DIR:/kernel-source" \
    rmx3834-kernel \
    "$@"
