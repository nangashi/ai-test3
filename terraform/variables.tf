variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "bedrock-agent"
}

variable "environment" {
  description = "Environment name (development, staging, production)"
  type        = string
  default     = "development"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository for Bedrock agent images"
  type        = string
  default     = "bedrock-agent"
}

variable "iam_role_name" {
  description = "Name of the IAM role for Bedrock agent"
  type        = string
  default     = "bedrock-agent-role"
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "bedrock-agent"
    Environment = "development"
    ManagedBy   = "terraform"
  }
}
