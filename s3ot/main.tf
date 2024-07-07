module "my-first_ecr-repo" {
  source = "../terraform-modules/ecr/"

  repository_name = "my-first-repo-in-private-1"


  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 20 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 20
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Environment = "prod"
  }
}
