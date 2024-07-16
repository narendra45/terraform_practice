variable "project_name" {
    default = "expence"
  
}

variable "common_tags" {
  default = {
    Project = "Expence"
    Environment = "dev"
    Terraform = "true"
  }
}

variable "public_subnet_cidrs" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type = list
  default = ["10.0.3.0/24","10.0.4.0/24"]
}


variable "database_subnet_cidrs" {
  type = list
  default = ["10.0.5.0/24","10.0.6.0/24"]
}

variable "is_peering_required" {
  default = true
  
}