variable "environment" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "instance_names" {
  type = list(string)
}
