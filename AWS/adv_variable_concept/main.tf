provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "test"{
    ami = var.ami_id
    instance_type = var.instance_type
    tags = var.project_env



    
}

