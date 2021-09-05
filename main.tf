variable "AWS_REGION" {    
    default = "eu-west-2"
}
variable "app_port" {
  description = "The port where it runs the qubec API server"
  default     = 80
}
variable "profile" {
  description = "The AWS profile configured locally"
  type        = string
  default     = "default"
}

variable "region" {
  description = "The AWS region where to start the ECS service"
  type        = string
  default     = "us-west-2"
}
variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}
provider "aws" {
  region  = var.region
  profile = var.profile
}
#variable "AMI" {
#    type = map
#    default = {
#        eu-west-2 = "ami-0afca6c808e56d77d"
#        us-east-1 = "ami-0ad235070aed081b7"
#    }
#}