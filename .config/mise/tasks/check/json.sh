#!/usr/bin/env bash
#MISE description="Check JSON"

set -euo pipefail

fd --extension json --exec-batch prettier --check
