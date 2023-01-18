# AWS CodePipeline Terraform

## Getting started

* Config AWS admin credentials on local to authanicate with terraform. AWS profile can be selected on tfvars
```
aws sts get-caller-identity --profile default
```

* Clone project from the repo

* Fill with necessary variables in `tfvars` file.
```sh
cp terraform.tfvars.sample terraform.tfvars
```

* Run following terraform commands to create stack.
```
terraform init
terraform plan
terraform apply
```

* Once stack is created. For the first time visit following aws console to authenticate codestar connection with github or bitbucket. `https://console.aws.amazon.com/codesuite/settings/connections?region=$AWS_REGION`

* Grant the codebuild to access eks using by updating aws-auth configmap with codebuild role arn. Doc: `https://aws.amazon.com/premiumsupport/knowledge-center/codebuild-eks-unauthorized-errors`
