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
____________________________________________________

to  define multiple value to a variable depending on env
pass the tfvars file as per below
#terraform plan -var-file="anyName_2.tfvars"
#terraform apply -var-file="anyName_2.tfvars"


PASSING variables from commandline:
Files : main.tf, variable.tf 
terraform plan -vars="name=value"
terraform apply -vars="name=value"
===============================================

Locals & Output Values : Folder [locals_outputValues]
File: main.tf
define and use the value throughout the main.tf file


Output Values : Folder [locals_outputValues]
File: main.tf
to print specfic text or same data of vm etc

===============================================

Looping  (count/for_each/for) : Folder [loops]

File: main.tf
1.looping  using count  | list variable is required
2.looping using for_each | set/map is required
3.looping using for loop

===============================================


Provisioner (file/local-exec/remote-exec) : Folder [provisioners]


file provisioner : Folder [provisioners/file]
File: main.tf
Use to copy file from  local to remote
# Note :- Needed ssh  acces 

local-exec provisioner : Folder [provisioners/local-exec] 
File: main.tf
execute commands on local

remote-exec provisioner : Folder [provisioners/remote-exec]
File: main.tf
execute commands on remote
# Note :- Needed ssh  acces 

===============================================
dynamic block :        Folder [dynamic]

use to implimate multiple itteration (eg:  add multiple ports in a SG)

===============================================
module :     Folder [module]

call  and run multiple main.tf files from single file

===============================================

aws_key_pair:     Folder [aws_key_pair]

to add key to remote server 

===============================================
Workspace (identical to  namespace in kubernetes):   Folder [workspace]

File: main.tf,variable.tf,prod.tfvars,beta.tfvars

workspaces: prod, beta
command: terraform new/list/show/select/delete

first select the workspace and run apply respectively this will create setup for respective workspace ,if needed to destroy the setup one must first select the workspace and then destroy.

===============================================
Data Source :  Folder [data_source]
File: main.tf
to get metadata(public ip/private ip etc) of a specific instance or range of instances

===============================================

local/remote tfstate : Folder [tfstate_manage]
File: main.tf

command: terraform state pull (to get the tfstate file stored remotely)

===============================================

Aws_lambda   : Folder [aws_lambda]

File: main.tf, hello-python.py

===============================================

Aws_credentials

1. write directly in provider file
2. create creds file  and pass  the path in provider  [variable name: shared_credentials_files]
3. export the variable no need to mention in provider [variable: AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY] 

===============================================
Terraform logs debug & Validation  : Folder [validation]
1. export:
    TF_LOG=DEBUG
    TF_LOG_PATH="/path/to/log"

2. validation

===============================================

Null Resource:

To do nothing  as per triggers : Use to run  [shell commands/ ansible playbook/pythonor other language programs] in provisioner
If the value changes in trigger provisioner will be executed
