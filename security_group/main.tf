variable "name" {}
variable "vpc_id" {}
variable "port" {}

variable "cidr_blocks" {
    type = list(string)
}

resource "aws_security_group" "default" {
  name = var.name
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  type = "ingress"
  from_port = "80"
  to_port = "80"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "rgress" {
  type = "egress"
  from_port = "0"
  to_port = "0"
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

output "security_group_id" {
    value = aws_security_group.default.id
}