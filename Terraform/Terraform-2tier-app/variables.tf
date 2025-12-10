variable "key_name" {
  description = "Ansible-testing-server-key"
  type        = string
}

variable "instance_type" {
  default = "t2.micro"
}
