module "updatepackage_ecr" {
  source = "../tf-modules/ecr/"

  repository_name = "packageupgrade"


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
