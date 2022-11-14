# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "eks-terraform-state-aws"
    key    = "dev/eks-cluster/"
    region = var.aws_region
  }
}

