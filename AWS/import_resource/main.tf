provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  
}


#terraform import aws_instance.ec2_example i-02342342342ddsa

resource "aws_instance" "ec2_example" {
    ami = ""                 #ami of imported ec2
    instance_type = ""     # same of imported ec2
    tags = {
      "key" =  "value"    # if any mentioned in imported one or new
    }
  
}


#terraform import aws_s3_bucket.bucket_resource_name bucket_name
resource "aws_s3_bucket" "bucket_resource_name" {
    bucket = "bucket_name"
    

    
  
}
