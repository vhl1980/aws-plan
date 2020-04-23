# VARS VPC
variable "ami-centos" {
    type = map
    default = {
        "eu-west-3" = "ami-0298b95bd252b95bd"
    }
}
