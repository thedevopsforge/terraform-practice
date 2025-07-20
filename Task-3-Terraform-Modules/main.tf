provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

module "sg" {
  source      = "./modules/security_group"
  name        = "modular-sg"
  description = "SG via module"
  vpc_id      = data.aws_vpc.default.id
}

module "user_data" {
  source         = "./modules/user_data"
  docker_image   = "thedevopsforge/math-api" # Replace if your image name is different
  container_port = 80
}

module "ec2" {
  source            = "./modules/ec2"
  ami               = "ami-050fd9796aa387c0d" # Amazon Linux 2023
  instance_type     = "t3.micro"
  key_name          = "terraform-key"
  security_group_id = module.sg.id
  user_data         = module.user_data.user_data
  name              = "modular-ec2"
}
