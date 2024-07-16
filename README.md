# terraform_practice

# terraform:
	
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

# Infra as a code.
    1. version controller ---> we can maintain different versions of infra. multiple persons can colloborate to create infra.
    2. same infra accorss environments --> DEV, QA, PROD, etc..
    working in dev failed in prod. run the same code in all environments that create same infra.

    3. CRUD -->  
    4. Iventory --> list of resources for the project in terms of infra.
    5. depedency -> dependencies would be automaticaly resoled while CRUD.
    6. cost --> creation and deletion takes less time, so cost can be reduced.
    7.code reuse --> modules, you can re use the infra code created multiple times for different projects.
    8. state management --> implictfeature.


# Hybrid cloud --> 
	Download Terraform. This article was tested using Terraform version 1.1.4.

	From the download, extract the executable to a directory of your choosing (for example, c:\terraform).

	Update your system's global PATH environment variable to include the directory that contains the executable.

	Open a terminal window.

	Verify the global path configuration with the terraform command.
	
	Download and run the AWS CLI MSI installer for Windows (64-bit):

		https://awscli.amazonaws.com/AWSCLIV2.msi

# Terraform --> HCL(Hashicorp Configuration language).
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

        aws configure --> Aws cli is already installed . so we can run aws configure in windows.
            aws configure
                AWS Access Key ID [None]: 
                AWS Secret Access Key [None]: 
                Default region name [None]: us-east-1
                Default output format [None]:
	
# provider.tf
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

# initialize terraform --> terraform initialize
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

# Variables:
	 in shell scripting -> USER --> declaring and assigning value to variable.
	 in ansible : vars:
						user: narendra
	in terraform:
		variable "<variable name>" {
			type = string/number/bool/list/map
			default = "<default-value>"
		}
		
		
    ##tagging strategy

        nameof the resource
        which project
        which modules
        which environment
        who created
        which date


    ## terraform.tfvars
        in varibledecleration we can give default values.
        terraform.tfvars will over ride 

    ##command line variables
        terraform plan -var="instance_type=t3.medium"

    ##env variables.
        export TF_VAR_instance_type = t3.large

    ## preference variables
        #1. command line
        #2. .tfvars
        #3. env variable
        #4. defaultvalues


# Conditions:
	if (expression):{
		these will run if expression is true
		
	}
	else{
		these will run if the expression is false.
	}

	expression ? "this will run if expression is true": "run if false"

expense:
	if db, instance type should be t3.small
	
# lopps:
	 count based loops
	 for loops
	 dynamic block loops
	
	count.index--> 0,1,2....
		indexs start from 0



# locals:
	locals and variables are same , referring key value pair.

	locals can hold expression and use it where ever you want. you can use variables inside locals. but you can't use other variables/locals inside variables.

# data Sources:
	
	
# state and remote state
	terraform --> Iaac, declarative
	what ever we write we will get.
	shell is imperative
	terraform is idempotent also.
	
	there is something called state.
	
	what ever we decleared terraform should create
	
	declared state[terraform files] == actual state[resources inside provider .i.e AWS]/ created infra
	
	I ran,terraform created infrastructure
	I ran once again How terraform will understand what infra it is already created.
	terraform.tfstate i the file that terraform tracks the actual infra.
	
	if i delete manually inside AWS but it exists in terraform.tfstate
	
	Refreshing state:
		it will check terraform.tfsatte against AWS....
	
	terraform files = AWS infra --> no it is not equal
	
	terraform responsibility to create the infra equivalent to terraform files.
	
	terraform.tfstate,declare state, actual state, refresh state.
	
	remote state:
		duplicate resources or errors, locking.
		
		1 person is creating infra through terraform, can we ask oter person also do same thing?
		
		there shoud be some locking mechanism, when one person is creating infra. it should be locked until it is completed.
		
		.lock file ---> means some one opened and others are not allowed to edit.

# local state v/s remote state:
	1. there is a chance you delete/edit the file...
	2. it will not work in collobaration environment.
	3. there is a chance multiple persons apply/edit the infra.
	
	we have s3 bucket in AWS.

# s3 remote state"
	s3 bucket can be looked with dynamodb table.
	
# how to create multiple environments with terraform

    ## using tfvars
        code is same ---> resources definition with terraform 

    ## dev and prod:
        
        to override default values.

    ## terraform init -backend-config=dev.backend.tf

    ## module development(terraform-aws-ec2):
        DRY --> don't repete yourself
        minmum code
        code reuse

        re used variables
        functions

        1. custome module
        2. opensource module
    ## VPC(virtual private cloud):
        in old days where there is VPC--> they have to buy the servers and deploy the code in servers.

        development --> only dev servers
        testing team --> only QA servers
        production support --> limited access to production servers
        call centers --> just iternal apps
        devops --> full access to all servers.
        linux admins --> all servers access

        data center:
            space
            watch men
            network
            resources
            maintainance
        VPC is like a mini data center for a project. resources created inside VPC are isolated and private to ourself.

        VPC Name = like village Name
        VPC CIDR = Village pincode
        subnets = streets
        internet gate way = arch
        routs = roads

        public and private subnets:
            * subnets which are connected to internet gateway are called public subnets.
            * subnets which are not connectec to internet gate way are called private subnets.

        192.168.1.3
        Ip address --> 32 bits
        4 octates --> each octate 8 bits
        2^32 IP address possible
        10.0.0.0/16 --> first 16 bits are fixed, you are not allowed to change
        10.0 is fixed
        each octate range --> 0-255

        10.0.0.1
        10.0.0.2
        ...
        ...
        10.0.0.255
        10.0.1.0
        10.0.1.1
        ...
        ...
        10.0.1.255

        256*256 = 2^16= 64,000 possible Ip adderss.

        step1.create VPC --> ipv4 cidr --> 10.0.0.0/16
        step2.1.create Public subnet--> ipv4 cidr --> 10.0.1.0/24-->public
        step2.2.create private subnet--> ipv4 cidr --> 10.0.11.0/24-->private
        step2.3.create db subnet--> ipv4 cidr --> 10.0.21.0/24-->private


        step3. create internet gateway( by default it creates internet gateway when we create VPC).
        step4. attach to vpc-->VPC-->Internet gateways->select Internet gateway ID--> Actions--> Attach To Vpc--> select Available VPCs.
        step5.create route table(Public and private)
            click on route id(public) --> Routes-->Edit routes -->Add Route--> 0.0.0.0/0-->select Internet Gateway
            routes not required for private
            <!-- click on route id(private) --> Routes-->Edit routes -->Add Route--> 0.0.0.0/0-->select Internet Gateway -->
        step6.1: Associate Public subnet to public Route table
            click on public subnet--> Route table --> Edit route table association--> select Public
            Route Table ID
        step6.2: Associate Private subnet to Private Route table
            click on private subnet--> Route table --> Edit route table association--> select Private
            Route Table ID
        step6.3: Associate db subnet to Private Route table
            click on db subnet--> Route table --> Edit route table association--> select Private
            Route Table ID

            # NAT Gate Way:
                * private servers can not connect to internet or can not accept connections from internet.
                * traffic originating fromservers --> outbund
                * traffic to the servers is called --> inbound.

                NAT gate way --> public sub net
                    this is to enable outbound internet traffic to the private servers..
                    general use cases fetching the updates, downloading packages from internet.

                    we need static Ip to create Nat gate way, normal ip keeps on changing.
                    static Ip in AWS is Elastic IP.
        step7: provide internet access to private Ip address
            step7.1: create Elastic Ip 
                VPC-->Elastic IPs-->Allocate Elastic IP address--> click on Allocate
            step7.2: create Natgateway and assigne Elastic IP
                VPC-->NAT gateways-->click on Create Nat Gateway --> write Name --> select Elastic IP allocation ID --> click on Create Nat Gateway.
            step 7.3: Assigne Nat Gateway to private Private Route table
                VPC-->click on route id(private) --> Routes-->Edit routes -->Add Route--> 0.0.0.0/0-->select Nat Gateway
    ## VPC peering:
        1. CIDR should not be overlaped
        2. VPC can be in 
            * either same regins of same account
            * either diff region of same account.
            * either same region of different accounts
            * either diff region of diff accounts
        3. routes should be added to subnets

        Requester --> expense vpc
        Acceptor --> default vpc

        1. create peering connection
        2. 
    peering is optional --> make the peering optional default is false. if true then peering should be created.

    auto acceptor works in the same aws account.
    acceptor_vpc is empty then auto accept true, otherwise false.
    




# Terra form AWS EC2
    ## INPUT
    * ami_id

