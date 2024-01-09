provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""  
}

locals {
  setupname="${terraform.workspace}-instance"
}
resource "aws_instance" "web" {
    ami = ""
    instance_type = var.instanceType 
    count = 1
    tags = {
      "setup" = local.setupname
    }
  
}
