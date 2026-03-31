output "instance_ids" {
  value = [for i in module.ec2 : i.instance_id]
}

output "public_ips" {
  value = [for i in module.ec2 : i.public_ip]
}
