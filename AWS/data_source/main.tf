provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  
}

resource "aws_instance" "ec2-1" {
    ami = ""
    instance_type = "t2.micro"
    tags = {
      "name" = "Prod"
    }
  
}

data "aws_instance" "getPublicIp" {
    filter {
      name = "tag:name"
      values = [ "Prod" ]
    }
    depends_on = [ "aws_instance.ec2-1" ]

  
}

output "print public ip" {
    value = data.aws_instance.getPublicIp.public_ip
  
}