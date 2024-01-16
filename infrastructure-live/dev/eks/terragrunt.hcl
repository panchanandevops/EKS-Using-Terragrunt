# Main Terraform Configuration

# Source for EKS module
terraform {
  source = "../../../infrastructure-modules/eks"
}

# Include root configuration
include "root" {
  path = find_in_parent_folders()
}

# Include environment-specific configuration
include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

# Inputs for EKS module
inputs = {
  eks_version = "1.26"
  env         = include.env.locals.env
  eks_name    = "demo"
  subnet_ids  = dependency.vpc.outputs.private_subnet_ids

  node_groups = {
    general = {
      capacity_type  = "ON_DEMAND"
      instance_types = ["t3a.xlarge"]
      scaling_config = {
        desired_size = 1
        max_size     = 10
        min_size     = 0
      }
    }
  }
}

# Dependency on VPC module
dependency "vpc" {
  config_path = "../vpc"

  # Mock outputs for testing
  mock_outputs = {
    private_subnet_ids = ["subnet-1234", "subnet-5678"]
  }
}
