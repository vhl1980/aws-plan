# vpc
provider "aws" {
    version = "~> 2.0"
    region = var.aws_region
}


resource "aws_vpc" "swarm" {
    cidr_block = var.aws_vpc_block
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags = {
      name = "swarm"
  }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.swarm.id
    cidr_block = var.aws_subnet_block_public
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = var.aws_region_available["a"]

    tags = {
      name = "${aws_vpc.swarm.id}-public"
  }
}

module "igw" {
    source = "./modules/igw"
    vpc_id = aws_vpc.swarm.id
}

module "sg" {
    source = "./modules/security_group"
    vpc_id = aws_vpc.swarm.id
}

module "rt" {
    source = "./modules/route_table"
    vpc_id = aws_vpc.swarm.id

    aws_igw_id = module.igw.igw_swarm
    aws_subnet_id = aws_subnet.public.id
}
