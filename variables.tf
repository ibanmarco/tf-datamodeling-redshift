variable "aws_region" {
  type = string
}

variable "project" {
  type = string
}

variable "cidr_ssh" {
  type = string
}

variable "ec2_ami" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "generic_kms" {
  type = string
}

variable "rds_instance_class" {
  type = string
}

variable "rds_storage_type" {
  type = string
}

variable "rds_allocated_storage" {
  type = string
}

variable "rds_max_allocated_storage" {
  type = string
}

variable "dbname" {
  type = string
}

variable "db_master_username" {
  type = string
}

variable "redshift_node_type" {
  type = string
}

variable "redshift_cluster_type" {
  type = string
}

variable "redshift_nodes" {
  type = string
}

variable "ec2_ebs_optimized" {
  type    = bool
  default = false
}

variable "ec2_monitoring" {
  type    = bool
  default = true
}

variable "redshift_publicly_accessible" {
  type    = bool
  default = false
}

variable "redshift_skip_final_snapshot" {
  type    = bool
  default = true
}
