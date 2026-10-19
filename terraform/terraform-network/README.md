# Terraform Network

Creates the core AWS networking layer: VPC, public subnet, Internet Gateway,
and route table with a default route to the internet.

## Usage
terraform init
terraform plan
terraform apply

## Outputs
- vpc_id
- subnet_id
- route_table_id

Use these outputs as inputs to the `ec2-terraform` module's `vpc_id` and
`subnet_id` variables.
