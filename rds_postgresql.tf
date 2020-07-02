####################################################################
# RDS PostgreSQL

resource "random_string" "postgresql_dbpassword" {
  length      = 15
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  special     = false
}

resource "aws_ssm_parameter" "postgresql_dbpassword" {
  name      = "${var.project}-postgresql_dbpassword"
  value     = random_string.postgresql_dbpassword.result
  type      = "SecureString"
  key_id    = data.aws_kms_key.generic_kms.arn
  overwrite = "true"
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project}-postgres-sg"
  description = "SG for allowing access to RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = "3306"
    to_port     = "3306"
    protocol    = "tcp"
    description = "MySQL access from private subnets"
    # cidr_blocks = [cidrsubnet(data.aws_vpc.default_vpc.cidr_block, 4, 1)]
    cidr_blocks = ["${aws_instance.bastion.private_ip}/32"]
  }
}

resource "aws_db_instance" "rds_postgresql" {
  identifier            = "${lower(var.project)}-rds-postgresql"
  engine                = "postgres"
  engine_version        = "11.6"
  instance_class        = var.rds_instance_class
  storage_type          = var.rds_storage_type
  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage

  #  DB Instance class db.t2.micro does not support encryption at rest
  # You need to change to t3.micro at least if you want encryption at rest
  storage_encrypted = false
  name              = var.dbname
  username          = var.db_master_username
  password          = random_string.postgresql_dbpassword.result
  port              = "3306"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

}
