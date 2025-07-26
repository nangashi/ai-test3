terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1" # 東京リージョン

  default_tags {
    tags = {
      Project     = "bedrock-agent"
      Environment = "development"
      ManagedBy   = "terraform"
    }
  }
}
