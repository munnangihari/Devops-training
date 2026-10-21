# Day 2 — Reusable Infrastructure and Policy Modules

## Objective
Improve infrastructure reuse, configuration boundaries, and safe delivery.

## Implementation
- Created a reusable Terraform network module for VPC and subnet resources.
- Defined configurable project, environment, CIDR, and Availability Zone inputs.
- Exposed VPC ID, subnet ID, and VPC CIDR outputs.
- Added variable validation for supported environments and CIDR inputs.
- Added a subnet CIDR precondition.
- Added an example Terraform variables file.
- Added Terraform state and generated-file ignore rules.
- Reused the existing HRMS Helm chart and environment-specific values.

## Validation Evidence
- Terraform formatting: Passed.
- Terraform initialization with backend disabled: Passed.
- Terraform validation: Passed.
- Negative environment test: Passed; invalid environment was rejected.
- Helm lint: Passed for development, staging, and production with zero failures.
- Helm template rendering: Passed for all three environments.
- Rendered output line counts: Development 765; staging 758; production 758.
- Helm dependency warning: The Bitnami repository update timed out, but dependency downloads and rendering subsequently succeeded.

## Security and State Handling
- Do not commit credentials, Terraform state files, or generated plans.
- Configure encrypted remote state, access controls, and locking before shared deployments.
- Review IAM and Kubernetes RBAC permissions before applying changes.
- Use an approved secret manager or Kubernetes secret integration for application secrets.

## Limitations and Outstanding Checks
- No AWS resources were applied during these validation steps.
- AWS infrastructure planning and provisioning permissions have not been verified.
- Security scans have not yet been recorded as completed.
- Remote state, multi-AZ networking, routing, and production IAM require further review.
- Helm lint reported zero failures but does not replace runtime or security testing.
