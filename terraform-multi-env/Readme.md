tfvars

for dev env:
    terraform init -backend-config=dev.backend.tf

    terraform plan -var-file=dev/dev.tfvars

    terraform apply -var-file=dev/dev.tfvars -auto-approve

    terraform init reconfigure -backend-config=dev.backend.tf
    terraform destroy -var-file=dev/dev.tfvars -auto-approve

for production env
    terraform init reconfigure -backend-config=prod.backend.tf

    terraform plan -var-file=prod/prod.tfvars

    terraform apply -var-file=prod/prod.tfvars -auto-approve

    terraform init reconfigure -backend-config=prod.backend.tf
    terraform destroy -var-file=prod/prod.tfvars -auto-approve

workspaces:
    terraform init
    terraform init -reconfigure

    terraform workspace list

    terraform workspace new dev

    terraform workspace new prod

    terraform workspace list

    terraform select dev


workspace,tfvars

advantages: lesscode
disadvantages: should be more careful while dealing variables and tfvars. chance of doing wrong in production

separate repos:

adv : clearseparation of environments
dis: duplication of code.

provisioners:

    terraform we are creating instances 
    1. local-exec --> running terraform command in local(lap) machine
    2. remote-exec --> running terraform command inside remote machine.

    provisioners will run when you are creating resources
    they will not run when the resources are already created.

