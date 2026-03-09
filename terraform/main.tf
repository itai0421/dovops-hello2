resource "aws_s3_bucket" "app" {
  bucket = var.app_bucket_name
}

resource "aws_ecr_repository" "app" {
  name = var.ecr_repo_name
}

resource "docker_image" "app" {
  name = "${var.ecr_repo_name}:latest"

  build {
    context    = "../"
    dockerfile = "../Dockerfile"
  }
}
