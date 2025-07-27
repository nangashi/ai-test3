# コマンド一覧
default:
  @just --list

# チェックツール実行
check: check-secrets

# 機密情報をチェック
check-secrets:
  gitleaks detect

# terraform apply
tf-apply:
  cd terraform/ && terraform apply -auto-approve

# agentcore launch
ac-launch:
  cd apps/agent/ && uv run agentcore launch --codebuild
