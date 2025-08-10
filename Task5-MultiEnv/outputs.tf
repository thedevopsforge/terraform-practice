output "instance_id" {
  value = aws_instance.example.id
}

output "instance_type" {
  value = local.instance_type
}

output "environment" {
  value = terraform.workspace
}
