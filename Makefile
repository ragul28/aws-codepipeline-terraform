plan:
	terraform fmt -recursive
	terraform init
	terraform plan -var-file=terraform.tfvars

tfinit:
	terraform fmt -recursive
	terraform init
	terraform validate

validate:
	terraform fmt -recursive
	terraform validate

upgrade:
	terraform fmt -recursive
	terraform init --upgrade
	terraform validate

planout:
	terraform plan -out=out.plan -var-file=terraform.tfvars

apply:
	terraform apply -var-file=terraform.tfvars

destroy:
	terraform destroy -var-file=terraform.tfvars

refresh:
	terraform refresh -var-file=terraform.tfvars
	
infracost: planout
	infracost breakdown --path=out.plan