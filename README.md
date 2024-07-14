# terraform_practice

##terraform:
	
    ##infrastructure:

        Infra is very important to create business

        ##Disadvantages of Manual infra creation

        1. Manually created
        2. takes time
        3. follow the sequence
            create sg
            ceate ec2
            create r53 record
        4. we need to check each and every resourc and note down manually
        5. cost analysis

##Infra as a code.
    1. version controller ---> we can maintain different versions of infra. multiple persons can colloborate to create infra.
    2. same infra accorss environments --> DEV, QA, PROD, etc..
    working in dev failed in prod. run the same code in all environments that create same infra.

    3. CRUD -->  
    4. Iventory --> list of resources for the project in terms of infra.
    5. depedency -> dependencies would be automaticaly resoled while CRUD.
    6. cost --> creation and deletion takes less time, so cost can be reduced.
    7.code reuse --> modules, you can re use the infra code created multiple times for different projects.
    8. state management --> implictfeature.


## Hybrid cloud --> 
	Download Terraform. This article was tested using Terraform version 1.1.4.

	From the download, extract the executable to a directory of your choosing (for example, c:\terraform).

	Update your system's global PATH environment variable to include the directory that contains the executable.

	Open a terminal window.

	Verify the global path configuration with the terraform command.
	
	Download and run the AWS CLI MSI installer for Windows (64-bit):

		https://awscli.amazonaws.com/AWSCLIV2.msi

#Terraform --> HCL(Hashicorp Configuration language).
    variables
    data types
    conditions
    Functions
    loops
    terraform concepts
        outputs
        locals
        data sources
        count
        dynamic blocks.
	
	
xxx.tf --> terraform reads only . tf files.
Configure IAM user to terraform
    IAM user acceskey and secret key ---> aws->IAM->user(select user)->Security credentials->Create access key

    aws configure --> Aws cli isalready installed . so we can run aw configure in windows.
        aws configure
            AWS Access Key ID [None]: 
            AWS Secret Access Key [None]: 
            Default region name [None]: us-east-1
            Default output format [None]:
	
#provider.tf
    ##provider configuration.
        terraform{
            required_providers {
                aws = {
                    source = "hashicorp/aws"
                    version = "5.48.0"
                }
            }
            backend "s3" {
                bucket = "mybucket"
                key    = "ec2-module-test"
                region = "us-east-1"
                dynamodb_table = "<dynamodb name>"
            }
        }
    ## prrovide authentication.	
    provider "aws" {
        region = "us-east-1"
    }



1. inbound --> ingress --> allow every thing, or port no 22
2. outbound --> allow everything.

Sample Terraform template for creating AWS security group.


# resource <resource-type> <resource-name>
        resource "aws_security_group" "allow_ssh" {
        ## ... other configuration ...
        name = "allow_ssh"
        description = "Allowing ssh connection"

        tags = {
            Name = "allow_ssh"
            CreatedBy = "Narendra"
        }
        ingress {
            from_port        = 22
            to_port          = 22
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }

        egress {
            from_port        = 0 # allows all protocalls
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
        }
        }


        resource "aws_instance" "db" {
            ami = "ami-041e2ea9402c46c32"
            vpc_security_group_ids = [aws_security_group.allow_ssh.id]
            instance_type = "t3.micro"
            tags = {
            Name = "db"
            
        }
        
        }

#initialize terraform --> terraform initialize
    ## command
        Narendra@DESKTOP-EN72NH2 MINGW64 ~/terra_basics/create_ec2$ terraform init


# terraform plan--> 
 terraform plan will validate .tf scrits and show us the resources it is gong to create.
    ## command
	Narendra@DESKTOP-EN72NH2 MINGW64 ~/terra_basics/create_ec2$ terraform plan.

# terraform apply--> 
    ## command
	Narendra@DESKTOP-EN72NH2 MINGW64 ~/terra_basics/create_ec2$ terraform apply

#  terraform destroy --> 
    Narendra@DESKTOP-EN72NH2 MINGW64 ~/terra_basics/create_ec2$ terraform destroy -auto-approve

