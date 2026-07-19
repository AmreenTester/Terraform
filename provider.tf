provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "south"
  region = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}


