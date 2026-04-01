locals {
  # Handle optional resource creation
  instance_count = var.create ? 1 : 0

  # Naming logic
  name = try(var.name, "ec2-instance")

  # Dynamic tagging
  tags = merge(
    {
      "Name" = local.name
    },
    var.tags
  )

  # Using try for optional values
  ami                         = try(var.ami, null)
  key_name                    = try(var.key_name, null)
  associate_public_ip_address = try(var.associate_public_ip_address, false)
  user_data                   = try(var.user_data, null)
  subnet_id                   = try(var.subnet_id, null)
}
