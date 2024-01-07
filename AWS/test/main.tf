provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}

resource "ami_instance" "test"{
    ami = ""
    instance_id = var.instance_type
    tags = {
        name = "vm name"
    }
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
variable "ec2_count" {
    description = "count of the vm"
    type = number
    default = 2  
}
variable "enable_public_ip" {
    description = "enable or disable public ip"
    type = bool
    default = false
  
}
variable "iam_user" {
    description = "users to create"
    type = list(string)
    default = [ "user1", "user2",  "user3" ]
  
}