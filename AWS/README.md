terraform 

==============================================

 provider : aws/gcp/azure 


==============================================
 resource   :  ami/vm/   


===============================================
variables :   Folder  [variable_concept]


Also we can create a  variable.tf file  and add all the variable data in that file

===============================================
advance variables concept:   Folder  [adv_variable_concept]

Files  :  variable.tf , terraform.tfvars , anyName_1.tfvars, anyName_2.tfvars

value will be passed automatically
_____________________________________________________

to  define multiple value to a variable depending on env

pass the tfvars file as per below

#terraform plan -var-file="anyName_2.tfvars"
#terraform apply -var-file="anyName_2.tfvars"



------------------------------------------
PASSING variables from commandline

Files : main.tf, variable.tf 


terraform plan -vars="name=value"
terraform apply -vars="name=value"
===============================================

===
Locals & Output Values : Folder [locals_outputValues]
===
File: main.tf

define and use the value throughout the main.tf file


===
Output Values
===

File: main.tf

to print specfic text or same data of vm etc

===============================================

===
Looping  (count/for_each/for) : Folder [loops]
===

File: main.tf

1.looping  using count  | list variable is required

2.looping using for_each | set/map is required

3. looping using for loop

===============================================

===
Provisioner (file/local-exec/remote-exec) : Folder [provisioners]
===


-----------------------------------------------
file provisioner : Folder [provisioners/file]

File: main.tf

Use to copy file from  local to remote

# Note :- Needed ssh  acces 

-----------------------------------------------


local-exec provisioner : Folder [provisioners/local-exec] 
File: main.tf

execute commands on local

-----------------------------------------------

remote-exec provisioner : Folder [provisioners/remote-exec]
File: main.tf

execute commands on remote

# Note :- Needed ssh  acces 

===============================================
dynamic block

use to implimate multiple itteration (eg:  add multiple ports in a SG)

