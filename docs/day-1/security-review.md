# Security and Boundary Review

Assessment date: 19 October 2026

| Area | Current evidence | Remaining validation |
|---|---|---|
| RBAC | Cluster and namespaced RBAC inventories collected | Confirm least privilege and unauthorized access denial |
| Network isolation | NetworkPolicy inventory collected | Test allowed and denied traffic paths |
| Secrets | Secret metadata inventory collected | Verify access restrictions; never commit secret values |
| Probes | Workload configuration captured | Review readiness, liveness and startup probes |
| Resources | Deployment configuration captured | Verify CPU and memory requests and limits |
| Storage | PVC inventory collected; local-path provisioner Running | Test PVC provisioning and recovery |
| Backups | Design documentation required | Perform and record a safe restore test |

## Security rules

- Do not export or commit Secret data.
- Use least-privilege service accounts and RBAC.
- Verify NetworkPolicy behavior with explicit connectivity tests.
- Record negative-test results without deleting production-like resources.
- Mark controls as verified only when supported by test evidence.
