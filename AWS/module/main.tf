provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}

module "securityGroup" {
    source = "./securityGroup"
  
}
module "VPC" {
    source = "./VPC"
  
}