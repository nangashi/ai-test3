#!/usr/bin/env bash
#MISE description="Check EditorConfig"

set -euo pipefail

fd --type file -X ec --format gcc
