module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = var.existing_private_subnets
  vpc_id          = var.existing_vpc_id

  enable_irsa = true

  tags = {
    Name    = "eks-cluster"
    cluster = "demo"
  }

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {
    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
}
