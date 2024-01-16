# Remote State Configuration

remote_state {
  backend = "local"  # Use local backend for storing Terraform state

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    path = "${path_relative_to_include()}/terraform.tfstate"  # Path to the Terraform state file
  }
}

# Provider Configuration Generation

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "aws" {
  region = "us-east-1"  # AWS region for the provider
}
EOF
}
