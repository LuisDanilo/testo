# Terraform scripts
--
This scripts were made to inyect env vars to terraform commands.
It's the only way I managed to make this work!.
I've tried using another methods such secrets.tfvar and providers config without success.

You need to set on your machine the following env vars:
* TF_VAR_aws_access_key_id
* TF_VAR_aws_secret_access_key
* TF_VAR_circleci_token
* TF_VAR_region

## init.py
---
Initiates terraform
If you don't init terraform you can't make plans and applies.

(Dont be afraid to execute this, indeed you need to execute this first if you plan to work something here)

## plan.py
---
Check current/deployed AWS infrastructure and compares with terraform code.
After comparison terraform will build a plan to create/destroy/change resources on AWS.

(Dont be afraid to execute this, it just will build a plan)

## apply.py
---
Applies terraform plan. **BE CARREFUL**, using this command you will update/create/destroy your app infrastructure according to previous built plan.

## destroy.py
---
Destroy current infrastructure.
I **hope** you will never use this script!


*Happy coding*