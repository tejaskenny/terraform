provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  
}

resource "aws_instance" "example_1" {
    ami = ""
    instance_type = ""
    count = 1

    user_data = <<-EOF
                    #!/bin/bash
                    echo "Hello World" > hello.txt  
                    EOF
  
}
resource "aws_instance" "example_2" {
    ami = ""
    instance_type = ""
    count = 1
    user_data = "${file("install_update_package.sh")}"  # run the shell script
    depends_on = [aws_instance.example_1]               # run resource example_2 only f exampel_2
 }
