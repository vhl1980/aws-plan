# NETWORK

resource "aws_internet_gateway" "swarm-igw" {
    vpc_id = aws_vpc.swarm-vpc.id

    tags = {
      Name = "swarm-igw"
  }
}

resource "aws_route_table" "swarm-public-crt" {
    vpc_id = aws_vpc.swarm-vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.swarm-igw.id 
    }

    tags = {
      Name = "swarm-public-crt"
  }
    
}

resource "aws_route_table_association" "swarm-crta-public-subnet-1"{
    subnet_id = aws_subnet.swarm-subnet-public-1.id
    route_table_id = aws_route_table.swarm-public-crt.id
}

resource "aws_security_group" "swarm-ssh-allowed" {
    vpc_id = aws_vpc.swarm-vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // Put your office or home address in it!
        cidr_blocks = ["88.122.7.18/32"]
    }

    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "swarm-ssh-allowed"
  }

}
