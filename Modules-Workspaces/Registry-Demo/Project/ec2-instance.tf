#AWS Provider Configuration
provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAIDHLXIC5PHKA4HRA"
  secret_key = "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"
}

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-0a13d44dccf1f5cf6"
  instance_type          = "t2.micro"

  subnet_id              = "subnet-5fbf1013"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}