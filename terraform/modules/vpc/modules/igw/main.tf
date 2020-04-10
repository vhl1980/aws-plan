resource "aws_internet_gateway" "AWS_IGW_ID" {
    vpc_id = var.vpc_id

    tags = {
      Name = "AWS_IGW_ID"
  }
}
