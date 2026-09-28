# Troubleshooting

## Terraform: `InvalidGroup.Duplicate` on apply
Cause: a security group from an earlier attempt still exists in AWS but isn't
in the current Terraform state.
Fix:
```bash
aws ec2 describe-security-groups --region us-east-1 \
  --filters "Name=group-name,Values=<name>" "Name=vpc-id,Values=<vpc-id>"
aws ec2 describe-network-interfaces --region us-east-1 \
  --filters "Name=group-id,Values=<sg-id>"
```
If an ENI is attached (e.g. an old ALB or ElastiCache cluster), delete that
resource first, wait for the ENI to detach, then delete the security group
and re-run `terraform apply`.

## Jenkins: `Unable to find .../Jenkinsfile`
The Script Path in the job config must match the exact path in the repo,
including any subfolder prefix (this project lives under
`blackroth-devops-week3/` inside the `Devops-training` repo).

## Jenkins: Docker Hub login `unauthorized`
Docker Hub requires a personal access token for CLI login, not the account
password (especially with 2FA). Generate one under Account Settings ->
Security -> Personal Access Tokens, and use it as the password in the
`dockerhub-creds` Jenkins credential.

## Jenkins: `kubectl apply -f secret.yaml` fails — file not found
`secret.yaml` is gitignored (it holds DB credentials) so it never reaches the
Jenkins workspace. Apply it manually once to the cluster instead; the
pipeline only updates the deployment image, not the secret.

## `curl` shows nothing on `/` in the terminal
The JSON response has no trailing newline, so it blends into the next shell
prompt. Use `curl -v` to confirm the actual status code and body.
