# INTERNET GATEWAY
variable "AWS_IGW_ID" {
    default = "igw-swarm"
}


variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
