terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket = var.backend_bucket
    key    = "terraform.tfstate"
    region = var.aws_region
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
