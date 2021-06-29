###########################
# Application Load Balancer
resource "aws_lb" "this" {
  name               = "${lower(var.prefix)}-demo-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.security_groups.publicweb_sg]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false
  drop_invalid_header_fields = true

  tags = merge(
    {
      Name = "${var.prefix}-Demo-LB"
    },
    var.common_tags
  )
}

# Redirect http -> https
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Default https
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-2019-08"
  certificate_arn   = aws_acm_certificate.this.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

