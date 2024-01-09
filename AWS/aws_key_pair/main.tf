provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}


resource "aws_instance" "test"{
    ami = ""
    instance_type = ""
    tags = ""
    count = 1
    key_name = "ssh_prod"
    vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  
}


resource "aws_security_group" "ssh_sg" {
    egress = [{
        cidr_blocks = [ "0.0.0.0/0" ]
        to_port = 0
        from_port = 0
        protocol = "-1"
        security_groups = []

    } 
    
     ]
     ingress = [ {
       cidr_blocks = [ "0.0.0.0/0" ]
       to_port = 22
       from_port = 22
       protocol = "tcp"
       security_groups = []
     } ]
  
}

resource "aws_key_pair" "ssh_key" {
    key_name = "ssh-prod"
    public_key = "adadasfdfhkjsdkjdghsdjkfghhsdjkfgh"
  
}
