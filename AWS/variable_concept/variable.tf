variable "ec2_count" {
    description = "count of the vm"
    type = number
    default = 2  
}
variable "enable_public_ip" {
    description = "enable or disable public ip"
    type = bool
    default = false
  
}
variable "iam_user" {
    description = "users to create"
    type = list(string)
    default = [ "user1", "user2",  "user3" ]
  
}

variable "project_env" {
    description = "users to create"
    type = map(string)
    default = {
        pro_name = "spdp"
        env = "beta"  
    }
}