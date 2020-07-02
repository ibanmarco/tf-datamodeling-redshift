output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_id" {
  value = aws_instance.bastion.id
}

output "rds_postgresql_endpoint" {
  value = aws_db_instance.rds_postgresql.address
}

output "redshift_endpoint" {
  value = aws_redshift_cluster.redshift.endpoint
}

output "redshift_role_name" {
  value = aws_iam_role.etl_redshift.name
}

output "redshift_role_arn" {
  value = aws_iam_role.etl_redshift.arn
}

output "redshift_sg_id" {
  value = aws_security_group.redshift_sg.id
}
