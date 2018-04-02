provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "0.11.5"

  backend "s3" {
    key    = "serverless-react-app/terraform.tfstate"
    region = "us-east-1"
  }
}

module "my-app" {
  source  = "chroto/serverless-react/aws"
  version = "1.0.0"
  name    = "devopsgorilla-serverless-react"
}
