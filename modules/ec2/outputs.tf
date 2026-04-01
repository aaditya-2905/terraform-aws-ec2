output "id" {
  description = "The ID of the instance"
  value       = try(aws_instance.this[0].id, null)
}

output "arn" {
  description = "The ARN of the instance"
  value       = try(aws_instance.this[0].arn, null)
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached."
  value       = try(aws_instance.this[0].public_ip, null)
}

output "private_ip" {
  description = "The private IP address assigned to the instance"
  value       = try(aws_instance.this[0].private_ip, null)
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = try(aws_instance.this[0].tags_all, {})
}
