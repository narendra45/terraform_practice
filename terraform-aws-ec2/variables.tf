variable "ami_id" {
    type = string
    default = "ami-"
}

variable "security_group_ids" {
  type = list
  default = [
    "" # security group ids
  ]

}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "tags" {
    type = map
    default = {} # this means empty, so not mandatory
  
}