# two-tier-arch-aws

## Note
- need to create the keypair on aws before running terraform apply.
- change the value of aws_key_name variable in modules/instances/variables.tf with the name of the key created.
- After this we can deploy the mysql application on webserver instance which use RDS.