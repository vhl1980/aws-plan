# VARS VPC

variable "AWS_REGION" {    
    default = "eu-west-3"
}

variable "AWS_REGION_AVAILABLE" {
    type = map
    default = {
        "a"  = "eu-west-3a"
        "b" = "eu-west-3b"
        "c" = "eu-west-3c"
    }
}
