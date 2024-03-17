## Create ECR repository 
resource "aws_ecr_repository" "cluerium_ecr_repo" {
  name = "cluerium_ecr_repo"
}

## Build frontend docker image and push to ECR
resource "docker_registry_image" "cluerium_frontend" {
  name = "${aws_ecr_repository.cluerium_ecr_repo.repository_url}-frontend:latest"

  build {
    context    =  "${path.cwd}/../frontend"
    dockerfile = "Dockerfile.multistage"
  }
}

