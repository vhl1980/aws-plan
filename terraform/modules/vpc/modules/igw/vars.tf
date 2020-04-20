# DEPENDANCY
variable "vpc_id" {
	description = ""
	type = string
}

# INTERNET GATEWAY
variable "aws_igw_tag" {
    default = "igw-swarm"
}

