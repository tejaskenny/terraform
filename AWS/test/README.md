terraform 

###  provisioner : aws/gcp/azure ###

syntax 
---
provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}
---



==============================================
###   resource   :  ami/vm/   ###

syntax
---
resource "ami_instance" "test"{
    ami = ""
    instance_id = ""
    tags = {
        name = "vm name"
    }
}
---




===============================================
###   variables :   ###

variable "<name>"{
    description = ""
    type = number/string/bool/
    default = 2/"value"/false/
    }

variable "<name>"{
    descripttion = ""
    type = list(<string/number>)
    default= ["val1","val2"]/[1,2,3]

}

variable "<name>"{
    descripttion = ""
    type = map(<string/number>)
    default= {
        project = "<project name>",   #value
        environment = "<>"            # key
    }

}
