terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = var.vpcname
#   }
# }

# resource "aws_vpc" "additional_vpcs" {
#   count       = length(var.vpc_cidrs)
#   cidr_block  = var.vpc_cidrs[count.index]

#   tags = {
#     Name = "dev-vpc-0${count.index + 1}"
#   }
# }

# resource "aws_instance" "my_instance" {
#   ami           = "ami-09e6f87a47903347c" # Example AMI, replace with a valid one
#   instance_type = var.instance_details.size

#   tags = {
#     Name = var.instance_details.name
#   }
# }

# resource "aws_instance" "env_instances" {
#   for_each = var.env_instance_details

#   ami           = "ami-09e6f87a47903347c" # Example AMI, replace with a valid one
#   instance_type = each.value.size

#   tags = {
#     Name = each.value.name
#   }
# }

# resource "aws_subnet" "subnet1" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.0.1.0/24"

# }

# resource "aws_instance" "my_instance" {
#   ami           = "ami-09e6f87a47903347c" # Example AMI, replace with a valid one
#   instance_type = "t2.nano"
#   subnet_id     = aws_subnet.subnet1.id

#   depends_on = [ aws_s3_bucket.my_bucket ]
# }

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "my-unique-bucket-name-123123123334343"

#   tags = {
#     Name        = "MyBucket"
#     Environment = "Dev"
#   }
# }

# data "aws_eip" "my_eip" {
#   filter {
#     name = "tag:Name"
#     values = [ "EIP" ]
#   }
# }

# resource "aws_instance" "my_instance" {
#   ami           = "ami-09e6f87a47903347c" # Example AMI, replace with a valid one
#   instance_type = "t2.nano"
  
# }

# resource "aws_eip_association" "my_eip_association" {
#   instance_id   = aws_instance.my_instance.id
#   allocation_id = data.aws_eip.my_eip.id
# }

# resource "aws_instance" "my_instance" {
#   ami           = "ami-09e6f87a47903347c" # Example AMI, replace with a valid one
#   instance_type = var.environment == "prod" ? "t2.large" : "t2.micro"

#   tags = {
#     Name = var.instance_details.name
#   }
# }

# resource "aws_instance" "my_instance2" {
#   ami           = "ami-09e6f87a47903347c" # Example AMI, replace with a valid one
#   instance_type = terraform.workspace == "prod" ? "t2.large" : "t2.micro"

#   tags = {
#     Name = var.instance_details.name
#   }
# }

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "dev-vpc-0003"
  }
}

resource "aws_subnet" "main_subnets" {
    count = 3
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)

    tags = {
      Name = "subnet-${count.index + 1}"
    }

}
