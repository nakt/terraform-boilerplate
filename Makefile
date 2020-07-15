AWS_VAULT_PROFILE := ""

prep:
	pre-commit install

init:
	terraform init --upgrade

plan: init
	aws-vault exec $(AWS_VAULT_PROFILE) -- \
		terraform plan

apply:
	aws-vault exec $(AWS_VAULT_PROFILE) -- \
		terraform apply -auto-approve

destroy:
	aws-vault exec $(AWS_VAULT_PROFILE) -- \
		terraform destroy -auto-approve

show:
	aws-vault exec $(AWS_VAULT_PROFILE) -- \
		terraform show
