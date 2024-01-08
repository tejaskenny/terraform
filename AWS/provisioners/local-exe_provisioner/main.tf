provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  
}

resource "aws_instance" "default" {
    ami = ""
    instance_type = ""
    count = ""

provisioner "local-exec" {
    command = "touch /opt/test"
    
}
}