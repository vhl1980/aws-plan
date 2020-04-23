terraform {
  # Require any 0.12.x version of Terraform
  required_version = ">= 0.12, < 0.13"
}

data "terraform_remote_state" "swarm" {
  backend = "local"

  config = {
    path = "../vpc/terraform.tfstate"
  }
}

provider "aws" {
    version = "~> 2.0"
    region = data.terraform_remote_state.swarm.outputs.aws_region
}

resource "aws_instance" "bastion-server" {
    ami = var.ami-centos["eu-west-3"]
    instance_type = "t2.micro"
    # VPC
    subnet_id = data.terraform_remote_state.swarm.outputs.aws_subnet_id
    # Security Group
    vpc_security_group_ids = [data.terraform_remote_state.swarm.outputs.aws_sg_id]
    # the Public SSH key
    key_name = "hoavu_home"
}
