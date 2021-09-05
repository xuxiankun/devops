variable "cluster_name" {
  description = "The ECS cluster to start the instances in"
  type        = string
  default     = "example_cluster"
}

resource "aws_ecs_cluster" "ecs_cluster" {
    name  = var.cluster_name
    setting {
      name  = "containerInsights"
      value = "enabled"
    }
}
 