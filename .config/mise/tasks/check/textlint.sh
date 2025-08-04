#!/usr/bin/env bash
#MISE description="機密情報をチェック"

set -euo pipefail

fd --extension md --exec-batch npx textlint -f compact --config .config/.textlint.yaml --rule textlint-rule-preset-ja-technical-writing --rule textlint-rule-preset-jtf-style --rule textlint-rule-no-mix-dearu-desumasu
