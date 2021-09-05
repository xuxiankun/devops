[
  {
    "essential": true,
    "memory": 2048,
    "name": "worker",
    "cpu": 1024,
    "image": "${REPOSITORY_URL}:latest",
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
            "awslogs-create-group": "true",
            "awslogs-group": "awslogs-app",
            "awslogs-region": "us-west-2",
            "awslogs-stream-prefix": "awslogs-app-demo"
        }
    }
    ,
    "portMappings" : [
        {
          "containerPort" : ${CONTAINER_PORT},
          "hostPort"      : ${HOST_PORT}
        }
      ],
    "environment": []
  }
]