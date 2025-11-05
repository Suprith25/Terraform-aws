variable "environment" {
  type    = string
  default = "demo"
}

module "vpc" {
  source      = "../../modules/vpc"
  cidr_block  = "10.0.0.0/16"
  environment = var.environment
}

module "compute" {
  source         = "../../modules/compute"
  subnet_ids     = module.vpc.public_subnet_ids
  environment    = var.environment
  instance_type  = "t2.micro"
  instance_count = 1
}
