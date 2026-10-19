# Day 1 Risk Register

Assessment date: 19 October 2026
Environment: kind-blackroth-capstone

| ID | Risk | Severity | Evidence | Required action |
|---|---|---|---|---|
| R01 | HRMS autoscaling metrics unavailable | High | FailedGetScale and FailedGetResourceMetric events | Validate metrics-server, resource metrics API and HPA permissions |
| R02 | Application probe failures | High | HRMS and Blackroth app probe timeouts and connection refusals | Check pod status, logs, endpoints and probe configuration |
| R03 | Cluster DNS instability | High | CoreDNS readiness failures | Inspect CoreDNS logs and cluster networking |
| R04 | Monitoring availability risk | High | Prometheus, Grafana and monitoring component probe failures | Validate monitoring pods, services and metrics collection |
| R05 | Local storage provisioning instability | High | local-path-provisioner BackOff event | Inspect provisioner logs and validate PVC provisioning |
| R06 | Network isolation not yet verified | Medium | NetworkPolicies exist in multiple namespaces | Test permitted and denied traffic paths |
| R07 | Backup and restore readiness unverified | Medium | Restore evidence not yet collected | Document backup scope and conduct a safe restore test |
| R08 | RBAC least privilege not yet verified | Medium | RBAC inventory collected; permissions review pending | Audit effective permissions and validate unauthorized access denial |

Severity ratings are preliminary and must be reassessed after current-state validation.

| R09 | Current Kubernetes identity can delete nodes | High | `kubectl auth can-i delete nodes` returned `yes` | Identify the active identity and review cluster-admin and node-deletion permissions; apply least privilege |
