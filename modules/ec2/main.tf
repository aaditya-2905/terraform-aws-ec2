resource "aws_instance" "this" {
  count = local.instance_count

  ami                         = local.ami
  instance_type               = local.instance_type
  subnet_id                   = local.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = local.key_name
  associate_public_ip_address = local.associate_public_ip_address
  user_data                   = local.user_data

  dynamic "root_block_device" {
    for_each = var.root_block_device != null ? var.root_block_device : []
    content {
      delete_on_termination = try(root_block_device.value.delete_on_termination, null)
      encrypted             = try(root_block_device.value.encrypted, null)
      iops                  = try(root_block_device.value.iops, null)
      kms_key_id            = try(root_block_device.value.kms_key_id, null)
      throughput            = try(root_block_device.value.throughput, null)
      volume_size           = try(root_block_device.value.volume_size, null)
      volume_type           = try(root_block_device.value.volume_type, null)
      tags                  = try(root_block_device.value.tags, null)
    }
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      private_ip,
      root_block_device
    ]
  }
}
