## Create ECR repository 
resource "aws_ecr_repository" "ecr_repo" {
  name = "ecr_repo"
}

## Build frontend docker image and push to ECR
resource "docker_registry_image" "frontend" {
  name = "${aws_ecr_repository.ecr_repo.repository_url}:latest"

  build {
    context    = "../frontend"
    dockerfile = "Dockerfile"
  }
}

