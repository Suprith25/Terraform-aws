data "aws_availability_zones" "az" {}

variable "cidr_block" { type = string }
variable "environment" { type = string }

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = { Name = "vpc-${var.environment}" }
}

# create 2 public subnets (free-tier small lab — keep count small)
resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "public-${var.environment}-${count.index}" }
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "vpc_id" { value = aws_vpc.this.id }
