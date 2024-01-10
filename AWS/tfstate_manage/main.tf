terraform {                                    # store the tfstate file to s3
  backend "s3" {
    bucket = "bucketname"
    key = "s3_path dir path inside bucket"
    region = "us-east01"
    
  }
}

provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}

