# ECR Repositories
resource "aws_ecr_repository" "aws_ecr_api_repository" {
  name = "vitalx-staging-api"
}

resource "aws_ecr_repository" "aws_ecr_app_repository" {
  name = "vitalx-staging-app"
}

# ECR Repository Lifecycle Policies
resource "aws_ecr_lifecycle_policy" "aws_ecr_api_repository_lifecycle_policy" {
  repository = aws_ecr_repository.aws_ecr_api_repository.name

  policy = jsonencode({
    "rules": [
      {
        "rulePriority": 1,
        "description": "Expire images older than 14 days",
        "selection": {
          "tagStatus": "untagged",
          "countType": "sinceImagePushed",
          "countUnit": "days",
          "countNumber": 14
        },
        "action": {
          "type": "expire"
        }
      },
      {
        "rulePriority": 2,
        "description": "Keep last 10 images",
        "selection": {
          "tagStatus": "any",
          "countType": "imageCountMoreThan",
          "countNumber": 10
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  })   
}

resource "aws_ecr_lifecycle_policy" "aws_ecr_app_repository_lifecycle_policy" {
  repository = aws_ecr_repository.aws_ecr_app_repository.name

  policy = jsonencode({
    "rules": [
      {
        "rulePriority": 1,
        "description": "Expire images older than 14 days",
        "selection": {
          "tagStatus": "untagged",
          "countType": "sinceImagePushed",
          "countUnit": "days",
          "countNumber": 14
        },
        "action": {
          "type": "expire"
        }
      },
      {
        "rulePriority": 2,
        "description": "Keep last 30 images",
        "selection": {
          "tagStatus": "any",
          "countType": "imageCountMoreThan",
          "countNumber": 10
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  })   
}
