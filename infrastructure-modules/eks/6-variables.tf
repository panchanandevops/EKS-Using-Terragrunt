# Terraform Variables

# Environment name
variable "env" {
  description = "Environment name."
  type        = string
}

# Desired Kubernetes master version
variable "eks_version" {
  description = "Desired Kubernetes master version."
  type        = string
}

# Name of the cluster
variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}

# List of subnet IDs. Must be in at least two different availability zones.
variable "subnet_ids" {
  description = "List of subnet IDs. Must be in at least two different availability zones."
  type        = list(string)
}

# List of IAM Policies to attach to EKS-managed nodes.
variable "node_iam_policies" {
  description = "List of IAM Policies to attach to EKS-managed nodes."
  type        = map(any)
  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

# EKS node groups
variable "node_groups" {
  description = "EKS node groups"
  type        = map(any)
}

# Determines whether to create an OpenID Connect Provider for EKS to enable IRSA
variable "enable_irsa" {
  description = "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  type        = bool
  default     = true
}
