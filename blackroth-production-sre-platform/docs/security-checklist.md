# Day 4 Security and Reliability Checklist

## Task 4.1 — Least-Privilege RBAC
- [x] Read-only Role and RoleBinding configured.
- [x] Verified the service account can list pods.
- [x] Verified the service account cannot delete pods.

## Task 4.2 — Secrets Handling
- [x] Added Git ignore rules for sensitive files.
- [x] Scanned the project using Gitleaks.
- [x] No leaks detected during the scan.

## Task 4.3 — Health Probes
- [x] Startup probe configured.
- [x] Readiness probe configured.
- [x] Liveness probe configured.
- [x] Verified three hrms-api replicas are ready.

## Task 4.4 — Resource Management
- [x] CPU and memory requests and limits configured.
- [x] Metrics API availability verified.
- [x] Pod resource usage checked.

## Task 4.5 — Backup and Recovery
- [x] Disaster recovery plan documented.
- [x] Kubernetes resource snapshot created.
- [x] ConfigMap backup and restore test passed.
- [x] Recovery evidence saved.

## Limitations
- Database and persistent-volume recovery were not tested.
- RTO and RPO remain targets until measured in a recovery exercise.
