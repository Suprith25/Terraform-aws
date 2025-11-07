#terraform {
#  backend "s3" {
#    bucket               = "your-unique-tfstate-bucket" # <-- REPLACE
#    key                  = "envs/demo/terraform.tfstate"
#    region               = "ap-south-1"
#    encrypt              = true
#    workspace_key_prefix = "env:"
#    use_lockfile         = true
#  }
#}
