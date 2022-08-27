import os
aws_access_key = os.environ.get("TF_VAR_aws_access_key_id", None)
aws_secret_key = os.environ.get("TF_VAR_aws_secret_access_key", None)
circleci_token = os.environ.get("TF_VAR_circleci_token", None)
region = os.environ.get("TF_VAR_region", None)
if (
    aws_access_key is not None and 
    aws_secret_key is not None and 
    circleci_token is not None and
    region is not None
):
    print("*** Terraform plan ***")
    print("...using access_key_id {}".format(aws_access_key))
    print("...using secret_key {}".format(aws_secret_key))
    print("...using circleci_token {}".format(circleci_token))
    os.system("AWS_ACCESS_KEY_ID=\"{}\" AWS_SECRET_ACCESS_KEY=\"{}\" CIRCLECI_TOKEN=\"{}\" AWS_REGION=\"{}\" terraform plan".format(aws_access_key, aws_secret_key, circleci_token, region))
else:
    print("Error: Not enougth credentials")