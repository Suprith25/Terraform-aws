variable "environment" {
  type    = string
  default = "demo"
}

#/*
#module "vpc" {
#  source      = "../../modules/vpc"
#  cidr_block  = "10.0.0.0/16"
#  environment = var.environment
#}
#
#module "compute" {
#  source         = "../../modules/s3"
#  subnet_ids     = module.vpc.public_subnet_ids
#  environment    = var.environment
#  instance_type  = "t2.micro"
#  instance_count = 1
#}
#*/

variable "bucket_name" {
  type        = string
  description = "Globally unique S3 bucket name"
}

module "s3_bucket" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
  environment = var.environment
}
