terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Create a VPC
resource "aws_vpc" "Dalia" {
  cidr_block = "192.170.7.0/24"
  tags = {
    "name" = "dalia-vpc"
  }
}


##subnet_web##
resource "aws_subnet" "nasnet_web" {
    vpc_id = aws_vpc.Dalia.id
    cidr_block = "192.170.7.0/27"

    tags = {
      "name" = "subnet_web"
    }
  
}


###subnet_app##
resource "aws_subnet" "subnet_app" {
  vpc_id = aws_vpc.Dalia.id
  cidr_block="192.170.7.32/27"

  tags={
      name= "subnet_app"
  }
}


##subnet db##
resource  "aws_subnet" "subnet_db" {
  vpc_id = aws_vpc.Dalia.id
  cidr_block = "192.170.7.64/28"

  tags ={
      name = "subnet_db"
  }
}
