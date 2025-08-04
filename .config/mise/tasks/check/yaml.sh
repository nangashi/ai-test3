#!/usr/bin/env bash
#MISE description="Check YAML"

set -euo pipefail

fd --extension yaml --extension yml --exec-batch prettier --check
