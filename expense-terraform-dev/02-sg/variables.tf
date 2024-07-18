variable "project_name" {
    default = "expence"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expence"
    Environment = "dev"
    Terraform = "true"
  }
  
}

variable "db_sg_description" {
  default = "Security for DB MYSQL Instance"
  
}


