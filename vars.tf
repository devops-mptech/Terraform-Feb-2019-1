variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "178.123.0.0/16"
}

variable "vpc_name" {
  default = "Westron_VPC"
}

variable "public_subnet" {
  type    = "list"
  default = ["178.123.0.0/25", "178.123.1.0/25"]
}

variable "azs" {
  type    = "list"
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "subnet_count" {
  default = "2"
}

variable "igw_cidr" {
  default = "0.0.0.0/0"
}

variable "ami" {
  type = "map"

  default = {
    ap-south-1 = "ami-0d773a3b7bb2bb1c1"
    us-west-2  = "ami-28e07e50"
    us-east-1  = "ami-0ff8a91507f77f867"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "mumbaikey"
}

variable "private_subnet_cidrs" {
  type    = "list"
  default = ["178.123.2.0/25", "178.123.3.0/25"]
}
