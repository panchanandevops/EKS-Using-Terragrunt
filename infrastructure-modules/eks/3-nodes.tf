# EKS Node Groups
resource "aws_eks_node_group" "this" {
  for_each = var.node_groups  # Create EKS node groups based on configurations in var.node_groups

  cluster_name    = aws_eks_cluster.this.name  # Name of the EKS cluster
  node_group_name = each.key  # Name of the EKS node group
  node_role_arn   = aws_iam_role.nodes.arn  # IAM Role ARN for EKS Nodes

  subnet_ids = var.subnet_ids  # Subnet IDs for EKS Node Group

  capacity_type  = each.value.capacity_type  # Capacity type for the node group
  instance_types = each.value.instance_types  # Instance types for the nodes

  scaling_config {
    desired_size = each.value.scaling_config.desired_size  # Desired number of nodes
    max_size     = each.value.scaling_config.max_size      # Maximum number of nodes
    min_size     = each.value.scaling_config.min_size      # Minimum number of nodes
  }

  update_config {
    max_unavailable = 1  # Maximum number of unavailable nodes during updates
  }

  labels = {
    role = each.key  # Label to identify the role of the node group
  }

  depends_on = [aws_iam_role_policy_attachment.nodes]  # Ensure IAM policies are attached before creating node groups
}
