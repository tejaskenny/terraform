terraform 

==============================================

 provisioner : aws/gcp/azure 

syntax 
===
provider "aws" {
    region = "us_east_01"
    access_key = ""
    secret_key = ""
}
===



==============================================
 resource   :  ami/vm/   

syntax
===
resource "ami_instance" "test"{
    ami = ""
    instance_id = ""
    tags = {
        name = "vm name"
    }
}
===




===============================================
variables :   Folder  [variable_concept]

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
        key = "<project name>",   #key
        value = "<>"            #value
    }
}


Also we can create a  variable.tf file  and add all the variable data in that file

===============================================
advance variables concept:   Folder  [adv_variable_concept]

Files  :  variable.tf , terraform.tfvars , anyName_1.tfvars, anyName_2.tfvars

variable.tf content:
======
variable "name" {   # Only declare the variable 
}
======

terraform.tfvars   # Define the value 
===
name="value"
===

value will be passed automatically
_____________________________________________________

to  define multiple value to a variable depending on env

variable.tf content:
======
variable "name" {   # Only declare the variable 
}
======

anyName_1.tfvars
======
name="value_1"
======


anyName_2.tfvars
======
name="value_2"
======

pass the tfvars file as per below

#terraform plan -var-file="anyName_2.tfvars"
#terraform apply -var-file="anyName_2.tfvars"



------------------------------------------
PASSING variables from commandline

Files : main.tf, variable.tf 

variable.tf content:
variable "name"{

}

terraform plan -vars="name=value"
terraform apply -vars="name=value"
===============================================


Locals & Output Values

File: main.tf

#define and use the value throughout the main.tf file

###
locals {
  var_name = "value"
}

resource "aws_instance" "default"{
    ami = ""
    instance_type = ""
    tags = {
        name="${locals.var_name}-instance"
    }
        
}
###

Output Values

###
output "name" {
    value = "this is output"
}

output "another_name" {
    value=aws_instance.instance_test.public_ip   # to print the public ip  of the ec2 instance
    sensitive = true                             # if you dont want to print the value on screen
  
}
###

===============================================

Looping  (count/for_each/for)
####   looping  using count  | list variable is required
resource "aws_iam_user" "test_users_set1" {
    count = length(var.user_set_1)
    name = var.user_set_1[count.index]

  
}


variable "user_set_1" {
    description = "aws IAM users"
    type = list(string)
    default = [ "user1","user2","user3" ]
  
}

####

### looping using for_each | set/map is required

resource "aws_iam_user" "test_users_set2" {
    for_each = var.user_set_2
    name=each.value  
}

variable "user_set_2" {
    description = "second set of users using set"
    type = set(string)
    default = [ "user1", "user2", "user3" ]
  
}


### looping using for loop

output "user_names" {
    value = [for name in var.user_set_1 : name]

  
}

===============================================