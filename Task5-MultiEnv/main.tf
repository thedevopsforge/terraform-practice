# Workspace-based instance types
locals {
  instance_type_map = {
    dev     = "t2.micro"
    staging = "t2.small"
    prod    = "t2.medium"
  }

  instance_type = lookup(local.instance_type_map, terraform.workspace, "t2.micro")
}

resource "aws_instance" "example" {
  ami           = "ami-050fd9796aa387c0d"  # Amazon Linux 2023
  instance_type = local.instance_type

  tags = {
    Name        = "${terraform.workspace}-example"
    Environment = terraform.workspace
  }
}
