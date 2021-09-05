$AWS_PROFILE="default"
$ECR_URL = "public.ecr.aws/y3g7i1j8"
$DOCKER_LOCATION = "../dockdev"
$REPOSITORY = "dotnet-demo"
#Set-Location -Path $DOCKER_LOCATION 
Write-Output "AWS profile: $AWS_PROFILE"
Write-Output "ECR repository address: $ECR_URL"
Write-Output "Dockerfile location to build the image: $DOCKER_FILE"

aws ecr-public --profile $AWS_PROFILE get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_URL
Write-Output "aws ecr-public --profile ${AWS_PROFILE} get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_URL"

docker build -t $REPOSITORY $DOCKER_LOCATION
Write-Output "docker tag ${REPOSITORY}:latest $ECR_URL/${REPOSITORY}:latest"
docker tag ${REPOSITORY}:latest $ECR_URL/${REPOSITORY}:latest
Write-Output "docker push $ECR_URL/${REPOSITORY}:latest"

docker push $ECR_URL/${REPOSITORY}:latest
