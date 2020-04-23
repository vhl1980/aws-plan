# DEPENDANCY
variable "aws_igw_id" {
	description = ""
	type = string
}

variable "aws_subnet_id" {
        description = ""
        type = string
}

variable "vpc_id" {
        description = ""
        type = string
}

# ROUTE TABLE
variable "aws_rt_cidr_block" {
	default = "0.0.0.0/0"
}

variable "aws_rt_tag_public" {
	default = "swarm-public"
}

