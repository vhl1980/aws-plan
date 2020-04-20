# DEPENDANCY
variable "vpc_id" {
        description = ""
        type = string
}

## SECURITY GROUP
variable "aws_sg_tag" {
	default = "sg-swarm"
}

# EGRESS
variable "aws_egress_public" {
	default = "0.0.0.0/0"
}

# INGRESS
variable "aws_ingress_public" {
        default = "0.0.0.0/0"
}

variable "aws_ingress_ssh_ip_connect" {
	default = "88.122.7.18/32"
}
