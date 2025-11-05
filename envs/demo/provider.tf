variable "region" {
  type    = string
  default = "ap-south-1"
}

provider "aws" {
  region = var.region
  # optional: profile = "gowtham"
}
