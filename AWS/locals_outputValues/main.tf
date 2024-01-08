
provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}


### defining locals
locals {
  staging_env = "staging"
}
###

resource "aws_instance" "instance_test"{
    ami = ""
    instance_type = ""
    tags = {
        name="${locals.staging_env}-instance"
    }
        
}
resource "aws_vpc" "vpc_test" {
    cidr_block = "10.7.7.7/16"
    tags = {

     name="${locals.staging_env}-vpc"
    }
  
}


### define output 
output "my_output" {
    value = "this is output"
}

output "aws_public_ip" {
    value=aws_instance.instance_test.public_ip   # to print the public ip  of the ec2 instance
    sensitive = true                             # if you dont want to print the value on screen
  
}
###