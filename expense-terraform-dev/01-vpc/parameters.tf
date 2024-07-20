resource "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
  type = "String"
  value = module.vpc.vpc_id
}

## ["id1","id2"]-->terraform format of List of strings
## id1,id2 --> Aws ssm format of List of strings
resource "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type = "StringList"
  value = join(",",module.vpc.public_subnet_ids) # converting terraform list to aws ssm list
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type = "StringList"
  value = join(",",module.vpc.private_subnet_ids) # converting terraform list to aws ssm list
}

resource "aws_ssm_parameter" "database_subnet_group_name" {
  name = "/${var.project_name}/${var.environment}/database_subnet_group_name"
  type = "String"
  value = module.vpc.database_subnet_group_name
}

