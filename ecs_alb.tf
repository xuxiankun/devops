variable "alb_name" {
  description = "Name of the ALB"
  type        = string
  default     = "example-alb"
}

variable "namespace" {
  type    = string
  default = "sample_app"
}

resource "aws_security_group" "alb_sg" {

  vpc_id = module.vpc.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = var.app_port
    to_port     = var.app_port
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 5000
    to_port     = 5000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "complete-example-sg-alb"
    Terraform = "true"
  }

}
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = var.alb_name


  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [aws_security_group.alb_sg.id]

  //access_logs = {
  //  bucket = "my-alb-logs"
  //}

  target_groups = [
    {
      backend_protocol = "HTTP"
      backend_port     = var.app_port
      target_type      = "ip"
      "health_check" = {
        enabled = true,
        path    = "/"
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}