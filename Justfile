# コマンド一覧
default:
  @just --list

# チェックツール実行
check: check-secrets

# 機密情報をチェック
check-secrets:
  gitleaks detect
