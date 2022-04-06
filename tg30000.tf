resource "aws_lb_target_group" "tg_test" {
  name    	 = "tf-example-lb-tg"
  port    	 = 30000
  target_type	 = "instance"
  protocol	 = "HTTP"
  vpc_id   	 = aws_vpc.my_vpc.id 
}

resource "aws_lb_target_group_attachment" "tg_attachment_tgtest" {
    target_group_arn = aws_lb_target_group.tg_test.arn
    target_id        = "i-027f8478e29e560de"
    port             = 30000
}

resource "aws_lb_listener" "lb_listener_http" {
   port                 = "30000"
   protocol             = "HTTP"
   load_balancer_arn    = aws_lb.test.arn 
   default_action {
    type              	= "forward"
    target_group_arn	= aws_lb_target_group.tg_test.arn
  }
}
