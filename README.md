# Description

It is a stripped dowm example that tries to provision on GCP:
- a host project
- s shared VPC
- a service project
using the CFT modules

Not functionnal!!!

Don't use it as an example!

# install

Set the following environment variables:
```
export SERVICE_ACCOUNT_JSON=$(< ~/.credentials/sa-key.json)
export TF_VAR_org_id="00000000000000"
export TF_VAR_folder_id="000000000000000"
export TF_VAR_billing_account="000000-000000-000000"
```
Note: 
- The use of a tool like direnv is recommended to manage different env vars per folder
- sa-key.json is a json Service account key that has at least the roles "project creator" and "owner" on the folder level 
- replace the org_id, folder_id and billing_account values by your own

Open a docker console with the required tools (terraform, gcloud)
```
make docker_run
```

# terraform setup

- Download the terraform modules and plugins:
```
terraform init
```
- Check that it doesn't work :)
```
terraform plan
```
