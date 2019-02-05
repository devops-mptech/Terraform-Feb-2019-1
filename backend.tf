terraform {
  backend "s3" {
    bucket = "mptech-666"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
