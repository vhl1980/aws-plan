resource "aws_internet_gateway" "igw-swarm" {
    vpc_id = var.vpc_id

    tags = {
      Name = "igw-swarm"
  }
}
