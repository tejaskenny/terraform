provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}

resource "ami_instance" "test"{
    ami = ""
    instance_id = var.instance_type
    tags = var.project_env
    count = var.ec2_count
}

resource "aws_iam_user" "default_users" {
    count = length(var.iam_user)
    name = var.iam_user[count.index]
}

variable "instance_type"{
    description = " name of the instance"
    type = string
    default = "t2.micro"
}

variable "ami_id" {
  description = "id of ami"
  type = string
  default = "amzn2-ami-hvm-x86_64-gp2"
}