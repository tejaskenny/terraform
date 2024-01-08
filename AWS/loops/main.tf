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


    
}

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

###looping using for_each | set/map is required

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