provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}


resource "aws_instance" "test"{
    ami = ""
    instance_type = ""
    tags = ""
    key_name = "aws_key"
    vpc_security_group_ids = [aws_seurity_group.sg_ssh.id]
    count = 1



##### File provisioner 
provisioner "file" {
    source = "/local/path/to/file"
    destination = "/remote/path/to/file"

connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("/path/to/private-key")
    timeout = "4m"
}
}
}
resource "aws_security_group" "sg_ssh" {
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
    ingress = [ {
        cidr_blocks = [ "0.0.0.0/0" ]
        description = ""
        from_port = 22
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        to_port = 22
    } ]
  
}

resource "aws_key_pair" "key_for_ssh" {
    key_name = "aws_key"
    public_key = "full public key"
}
  
