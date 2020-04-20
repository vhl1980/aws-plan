resource "aws_security_group" "public-swarm" {
    vpc_id = var.vpc_id

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [var.aws_egress_public]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // Put your office or home address in it!
        cidr_blocks = [var.aws_ingress_ssh_ip_connect]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.aws_ingress_public]
    }

    tags = {
      Name = var.aws_sg_tag
  }

}
