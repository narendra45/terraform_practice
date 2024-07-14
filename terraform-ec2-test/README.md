module development(terraform-aws-ec2):
    DRY --> don't repete yourself
    minmum code
    code reuse

    re used variables
    functions

    1. custome module
    2. opensource module
VPC(virtual private cloud):
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






# Terra form AWS EC2
    ## INPUT
    * ami_id