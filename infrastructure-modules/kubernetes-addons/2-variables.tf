# Environment name
variable "env" {
  description = "Environment name."
  type        = string
}

# Name of the cluster
variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}

# Determines whether to deploy cluster autoscaler
variable "enable_cluster_autoscaler" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}

# Cluster Autoscaler Helm version
variable "cluster_autoscaler_helm_verion" {
  description = "Cluster Autoscaler Helm version"
  type        = string
}

# IAM OpenID Connect Provider ARN
variable "openid_provider_arn" {
  description = "IAM OpenID Connect Provider ARN"
  type        = string
}
