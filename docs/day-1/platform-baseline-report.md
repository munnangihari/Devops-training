# Day 1 — Platform Baseline and Reliability Review

## 1. Cluster Baseline
Reviewed Kubernetes cluster resources, namespaces, nodes, workloads, services, events, and current resource metrics.

## 2. RBAC Security
Validated the HRMS viewer ServiceAccount permissions. Pod access was allowed, while node deletion and Secret access were denied.

Evidence: evidence/rbac-hrms-viewer.txt

## 3. Restart and Probe Investigation
Investigated pod restarts, readiness, liveness checks, and Kubernetes events. Several workloads experienced restarts. The available evidence does not conclusively establish a single root cause.

## 4. NetworkPolicy Validation
Created deny and allow NetworkPolicies and tested pod connectivity. Traffic remained accessible after applying the deny policy. The current Kind networking setup using kindnet did not demonstrate NetworkPolicy enforcement.

Evidence: evidence/networkpolicy-test.txt

## 5. Availability Test
Tested the HRMS service with 10 HTTP requests. All 10 returned HTTP 200. Observed response times ranged from approximately 9.6 ms to 63.6 ms, with an average of approximately 18.4 ms. This was a limited local port-forward test, not a production-wide availability or P95 measurement.

Evidence: evidence/hrms-availability.txt

## 6. Backup and Recovery
No PersistentVolumeClaims, PersistentVolumes, Jobs, CronJobs, or backup/restore pods were detected. Backup restoration and RTO/RPO have not been validated.

Evidence: evidence/backup-recovery-check.txt

## 7. Outstanding Risks
- Investigate the cause of cluster-wide pod restarts.
- Use a NetworkPolicy-capable networking implementation to validate deny/allow behavior.
- Establish and test a backup and restore process.
- Perform longer-running availability and latency tests.

## Conclusion
The Day 1 baseline review and initial RBAC, networking, availability, and backup-resource checks were documented. NetworkPolicy enforcement, root-cause confirmation, and backup/recovery validation remain outstanding.
