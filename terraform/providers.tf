provider "aws" {
  region = "ca-central-1"
}

provider "docker" {

    host = "unix:///home/rehman/.docker/desktop/docker.sock"

  registry_auth {
    address  = local.aws_ecr_url
    username = data.aws_ecr_authorization_token.token.user_name
    password = data.aws_ecr_authorization_token.token.password
  }
}
