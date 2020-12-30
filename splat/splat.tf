#AWS Provider Configuration
provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAIDHLXIC5PHKA4HRA"
  secret_key = "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"
}

resource "aws_iam_user" "lb" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}