resource "aws_lb" "test" {
  name               = "alb-test"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_grp
  subnets            = [aws_subnet.my_subnet.id,aws_subnet.my_subnet2.id]
}

variable "security_grp" {
    type = list
    default = ["sg-0d4ee816bf2af5eaf"]
}
