module "ec2" {
  source = "./modules/ec2"

  for_each = toset(var.instance_names)

  ami                         = local.ami
  instance_type               = local.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true

  tags = merge(local.common_tags, {
    Name = "${var.environment}-${each.value}"
  })
}
