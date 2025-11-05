variable "region" {
  description = "AWS region to create the bucket"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging and identification"
  type        = string
  default     = "demo"
}

