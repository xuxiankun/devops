data "template_file" "task_definition_template" {
    template = file("task_definition.json.tpl")
    vars = {
      REPOSITORY_URL =  "public.ecr.aws/y3g7i1j8/dotnet-demo"
      CONTAINER_PORT = var.app_port
      HOST_PORT = var.app_port
    }
}