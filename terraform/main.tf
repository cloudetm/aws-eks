terraform {
    backend "local" { }

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.59.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"

    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}