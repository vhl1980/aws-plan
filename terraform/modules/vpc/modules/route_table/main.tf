# ROUTE TABLE
resource "aws_route_table" "rt-swarm-public" {
    vpc_id = var.vpc_id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = var.aws_rt_cidr_block 
        //CRT uses this IGW to reach internet
        gateway_id = var.aws_igw_id
    }

    tags = {
      Name = var.aws_rt_tag_public
  }
    
}

resource "aws_route_table_association" "swarm-rt-public-subnet-1"{
    subnet_id = var.aws_sg_id
    route_table_id = aws_route_table.rt-swarm-public.id
}
