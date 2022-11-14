# Terraform Block

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

  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "eks-terraform-state-aws"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-ekscluster"
  }
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}








/* terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34.0" 
    }
  }
}


# Provider Block
 provider "aws" {
  region  = var.aws_region
  profile = "default"
} 

provider "aws" {
  region = var.aws_region
}

Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/ 