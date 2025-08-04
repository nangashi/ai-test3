#!/usr/bin/env bash
#MISE description="機密情報をチェック"

set -euo pipefail

gitleaks detect
