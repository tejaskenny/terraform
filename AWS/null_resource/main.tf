provider "aws" {
   region     = "eu-east-1"
   shared_credentials_files = ["/opt/.aws/credentials"]
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   tags = {
           Name = "Terraform EC2 "
   }
} // id

resource "null_resource" "null_resource_simple" {
   triggers = {
      id = aws_instance.ec2_example.id                              # execute provisioner only when id value changes 
   }
   provisioner "local-exec" {
      command = "echo Hello World"
   }
}