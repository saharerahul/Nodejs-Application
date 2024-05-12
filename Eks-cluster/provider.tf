terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuring the AWS Provider

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA6ODU665UCUJJ7LS4"
  secret_key = "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"

}