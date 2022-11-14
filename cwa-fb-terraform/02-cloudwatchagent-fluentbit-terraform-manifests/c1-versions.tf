# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.36.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.14.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.1.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "eks-terraform-state-aws"
    key    = "dev/eks-cloudwatch-agent/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-eks-cloudwatch-agent"
  }
}

