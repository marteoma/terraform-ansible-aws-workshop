module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"
  
  name                              = "terraform-ansible-alb"
  load_balancer_type                = "application"
  vpc_id                            = module.vpc.vpc_id
  subnets                           = module.vpc.public_subnets
  security_groups                   = [module.alb_sg.this_security_group_id]
  enable_cross_zone_load_balancing  = "true"
  
#   access_logs = {
#     bucket = "terraform-ansible-alb-logs"
#   }

  target_groups = [
    {
      name_prefix      = "ta-alb"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Terraform               = "true"
    Environment             = "dev"
  }
}

resource "aws_lb_target_group_attachment" "ta-alb-tga" {
    count               = var.number_of_instances
    target_group_arn    = module.alb.target_group_arns[0]
    target_id           = aws_instance.webserver[count.index].id
    port                = 80
}