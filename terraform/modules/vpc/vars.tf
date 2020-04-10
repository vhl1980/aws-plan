# vars vpc
variable "aws_region" {    
	default = "eu-west-3"
}

variable "aws_region_available" {
	type = map
	default = {
		"a"  = "eu-west-3a"
		"b" = "eu-west-3b"
		"c" = "eu-west-3c"
    }
}

variable "aws_vpc_block" {
	default = "10.0.0.0/16"
}

variable "aws_subnet_block_public" {
        default = "10.0.0.0/16"
}
