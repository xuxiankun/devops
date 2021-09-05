resource "aws_ecs_service" "worker" {
  name            = "worker"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.alb_sg.id]
    subnets         = module.vpc.private_subnets
  }

  load_balancer {
    target_group_arn = module.alb.target_group_arns.0
    container_port   = var.app_port
    container_name   = aws_ecs_task_definition.task_definition.family
  }
}