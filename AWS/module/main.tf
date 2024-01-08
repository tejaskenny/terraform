provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}

locals {
    ingress_rules = [{
        port = 80
        description = "port for 80"

    },
    {
        port = 443
        description = "port for 443"
    }]
}

resource "aws_instance" "test"{
    ami = ""
    instance_type = ""
    tags = ""
    key_name = "aws_key"
    vpc_security_group_ids = [aws_seurity_group.sg.id]
    count = 1

}

resource "aws_security_group" "sg" {
egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = ""
      from_port = 0
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "-1"
      security_groups = []
      self = false
      to_port = 0
    }
    ]


dynamic "for_SG_ingress" {
    for_each = local.ingress_rules
    
    content{
        description = ingress.value.description
        from_port = ingress.value.port
        to_port = ingress.value.port
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }

}
}  


resource "aws_key_pair" "key_for_ssh" {
    key_name = "aws_key"
    public_key = "full public key"
}
  
