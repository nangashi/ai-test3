#!/usr/bin/env bash
#MISE description="Check Markdown"

set -euo pipefail

fd --extension md --exec-batch prettier --check
fd --extension md --exec-batch markdownlint-cli2 --config .config/.markdownlint.yaml
