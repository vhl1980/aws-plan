output "aws_region" {
  value       = var.aws_region
  description = "NA"
}

output "aws_subnet_id" {
  value       = aws_subnet.public.id
  description = "NA"
}


output "aws_sg_id" {
  value       = module.sg.sg_swarm_public
  description = "NA"
}

