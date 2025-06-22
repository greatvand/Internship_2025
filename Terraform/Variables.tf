variable "region" {
  description = "The AWS region to deploy the resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpcname" {
  description = "The name of the VPC."
  type        = string
  default     = "new_vpc"
}

variable "vpc_cidrs" {
  description = "List of CIDR blocks for the VPC."
  type        = list(string)
  default     = ["10.0.0.0/16", "192.168.0.0/24"]
}

variable "instance_details" {
  description = "Stores the name and size of the instance."
  type = object({
    name = string
    size = string
  })
    default = {
        name = "my_instance"
        size = "t2.nano"
    }
}

variable "env_instance_details" {
  description = "Stores the environment-specific instance details."
  type = map(object({
    name = string
    size = string
  }))
  default = {
    dev = {
      name = "dev_instance"
      size = "t2.micro"
    },
    prod = {
      name = "prod_instance"
      size = "t2.nano"
    }
  }
}

# variable "environment" {
#   description = "The environment for which the resources are being created."
#   type        = string
#   default     = "dev"
# }   

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}