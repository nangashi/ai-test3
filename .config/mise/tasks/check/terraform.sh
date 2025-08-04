#!/usr/bin/env bash
#MISE description="Check Terraform"

set -euo pipefail

terraform fmt -check -recursive
cd terraform && terraform validate
