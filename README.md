# DataWarehouse with RDS PostgreSQL and Redshift

This module creates a private Redshift cluster and RDS PostgreSQL instance only reachable from a bastion host. This module
The default VPC is used as main infrastructure and this module
It doesn't create either additional VPCs therefore it requires to define the proper `vpc_id` and `subnet_id` to integrate it with your current infrastructure.
The security groups have been configured in order to access to PostgreSQL and RedShift via SSH tunneling from your own laptop.


## Variables:

| Name | Description | Type |
|------|-------------|:----:|
| aws_region | The aws region | string |
| cidr_ssh | Your public IP address in CIDR notation | string |
| db_master_username | Username for the master DB user | string |
| dbname | The name of the default database | string |
| ec2_ami | EC2 AMI Id | string |
| ec2_ebs_optimized | Flag that sets if the launched EC2 instance will be EBS-optimized | string |
| ec2_instance_type | The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance. | string |
| ec2_monitoring |  If true, the launched EC2 instance will have detailed monitoring enabled. | string |
| generic_kms | Id of the KMS | string |
| project | Name of my project :-) | string |
| rds_allocated_storage | The aws region | string |
| rds_instance_class | The instance type of the RDS instance. | string |
| rds_max_allocated_storage | The upper limit to which Amazon RDS can automatically scale the storage of the DB instance.| string |
| rds_storage_type | The storage type used | string |
| redshift_cluster_type | The cluster type to use. Either single-node or multi-node. | string |
| redshift_node_type | The type of nodes in the cluster | string |
| redshift_nodes | The number of the nodes in the cluster | string |
| redshift_publicly_accessible | If the cluster can be accessed from a public network | string |
| redshift_skip_final_snapshot | Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster. | string |
| subnet_id | The subnet Id assgined to the EC2 instance | string |
| vpc_id | The VPC Id | string |


## Outputs:

| Name | Description |
|------|-------------|
| bastion_id | Bastion host instance id |
| bastion_ip | Public IP address assigned to bastion host |
| redshift_endpoint | The connection endpoint |
| redshift_role_arn | The IAM Role ARN associated with the cluster  |
| redshift_role_name | The IAM Role name associated with the cluster |
| redshift_sg_id | Id of the security group assigned to Redshift |
| rds_postgresql_endpoint | The connection endpoint in address:port format |
