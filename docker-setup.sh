#!/bin/bash

set -euo pipefail
REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

docker buildx build --platform "linux/amd64" -t "rmx3834-kernel" --load "$REPO_DIR"
