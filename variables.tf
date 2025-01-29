variable "kubernetes_version" {
  default     = "1.27"
  description = "Kubernetes version"
}

variable "aws_region" {
  default     = "us-west-1"
  description = "AWS region"
}

variable "existing_vpc_id" {
  description = "ID of the existing VPC where EKS will be deployed"
  type        = string
}

variable "existing_private_subnets" {
  description = "List of existing private subnet IDs for EKS"
  type        = list(string)
}
