# Bedrock Agent Terraform設定

このディレクトリには、AWS Bedrockエージェントを利用するためのTerraform設定が含まれています。

## 概要

この設定では以下のAWSリソースを作成します：

- **IAMロール**: Bedrockエージェントが使用する権限
- **IAMポリシー**: Bedrock、Lambda、CloudWatch Logs、S3へのアクセス権限
- **ECRリポジトリ**: エージェントイメージの保存用
- **ECRライフサイクルポリシー**: イメージの自動クリーンアップ
- **ECRリポジトリポリシー**: Bedrockサービスからのアクセス許可

## ファイル構成

- `provider.tf`: AWSプロバイダーの設定
- `variables.tf`: 設定可能な変数の定義
- `agent.tf`: Bedrockエージェント用リソースの定義
- `README.md`: このファイル

## 使用方法

### 1. 初期化

```bash
cd terraform
terraform init
```

### 2. 設定の確認

```bash
terraform plan
```

### 3. リソースの作成

```bash
terraform apply
```

### 4. 出力値の確認

作成後、以下の出力値が利用可能です：

- `bedrock_agent_role_arn`: IAMロールのARN
- `ecr_repository_url`: ECRリポジトリのURL
- `ecr_repository_arn`: ECRリポジトリのARN

### 5. リソースの削除

```bash
terraform destroy
```

## 設定可能な変数

`terraform.tfvars`ファイルを作成して、以下の変数をカスタマイズできます：

```hcl
aws_region = "ap-northeast-1"
project_name = "my-bedrock-project"
environment = "production"
ecr_repository_name = "my-bedrock-agent"
iam_role_name = "my-bedrock-agent-role"
```

## 注意事項

- Bedrockサービスが利用可能なリージョンで実行してください
- IAMロールには最小権限の原則に従って必要な権限のみを付与しています
- ECRリポジトリにはライフサイクルポリシーが設定されており、古いイメージは自動的に削除されます

## 次のステップ

1. Bedrockエージェントの作成
2. エージェントイメージのビルドとECRへのプッシュ
3. エージェントの設定とデプロイ 
