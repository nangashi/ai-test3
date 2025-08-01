# コマンド一覧
default:
  @just --list

# チェックツール実行
check:
  #!/usr/bin/env -S parallel --shebang --ungroup --jobs {{ num_cpus() }}
  just check-secrets

# 機密情報をチェック
check-secrets:
  gitleaks detect

# terraform フォーマット修正
fix-tf *args:
  terraform fmt -no-color {{args}}

# terraform apply
deploy-tf:
  cd terraform/ && terraform apply -auto-approve

# agentcore launch
deploy-agent:
  cd apps/agent/ && uv run agentcore launch --codebuild
