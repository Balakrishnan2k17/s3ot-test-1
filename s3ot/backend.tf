terraform {
  backend "s3" {
    bucket         = "bk2k17-tf-backend-bucket"
    key            = "terraform-backend-files/terraform.tfstate"
    encrypt        = true
    region         = "us-west-2"
  }
}
