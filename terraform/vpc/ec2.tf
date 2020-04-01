resource "aws_instance" "bastion-server" {
    ami = var.AMI["eu-west-3"]
    instance_type = "t2.micro"
    # VPC
    subnet_id = aws_subnet.swarm-subnet-public-1.id
    # Security Group
    vpc_security_group_ids = [aws_security_group.swarm-ssh-allowed.id]
    # the Public SSH key
    key_name = "hoavu_home"
}
