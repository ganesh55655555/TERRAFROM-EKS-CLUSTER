locals {
  cluster_name = "eks-cluster-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
