# AWS CodePipeline Terraform

## Getting started

* Make sure AWS credentials are config using aws cli.
* Clone project 

* Fill with necessary variables in `tfvars` file.
```sh
cp terraform.tfvars.sample terraform.tfvars
```

* Run the terraform to create aws stack using Make.
```sh
make plan
make apply
```

* OR Using reguler terraform cli.
```
terraform init
terraform plan
terraform apply
```