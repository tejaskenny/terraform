provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  
}

resource "aws_instance" "ec2-validation" {
    ami = ""
    instance_type = ""
    count = 1
    tags = {
        Name = "Terraform "
    }
}
variable "instance_type" {
    description = "type t2.micro"
    type = string
    default = "t2.micro"
    validation {
      condition = can(regex("^[Tt][2-3].(nano|micro|small)",var.instance_type))
      error_message = "You cant change the variable"
    }
}