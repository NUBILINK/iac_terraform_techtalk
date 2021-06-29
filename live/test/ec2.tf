#########################
# Instancias Web Frontend
module "ec2_web_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.19.0"

  name           = "${var.prefix}-${var.application}-FrontEnd"
  instance_count = var.ec2_count

  ami                     = var.ec2_ami
  instance_type           = var.ec2_type
  key_name                = var.ec2_key
  disable_api_termination = false
  vpc_security_group_ids = [
    module.security_groups.privateweb_sg,
    module.security_groups.admin_access_sg
  ]
  subnet_ids = module.vpc.private_subnets

  user_data = data.template_file.deploy_web_frontend.rendered

  tags = var.common_tags
}

data "template_file" "deploy_web_frontend" {
  template = file("../scripts/deploy_web_frontend.sh")
}

resource "aws_lb_target_group" "this" {
  name     = "${lower(var.prefix)}-${lower(var.application)}-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  tags = merge(
    {
      Name = "${var.prefix}-${var.application}-LB-TG"
    },
    var.common_tags
  )
}

resource "aws_lb_target_group_attachment" "this" {
  count = length(module.ec2_web_cluster.id)

  target_group_arn = aws_lb_target_group.this.arn
  target_id        = module.ec2_web_cluster.id[count.index]
  port             = 80
}