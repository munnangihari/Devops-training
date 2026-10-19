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

## Additional Validation Results

- Restart Investigation: Multiple pods restarted in the same time window. The cluster is currently healthy, but the exact root cause remains unconfirmed.
- Backup and Restore: Successfully restored a Kubernetes ConfigMap from its saved YAML manifest. Database and persistent-volume recovery remain untested.
- NetworkPolicy: Enforcement could not be demonstrated with the current Kind networking setup. Validation with a NetworkPolicy-capable CNI remains pending.

## Database Recovery Validation

- Status: PASS — logical backup and restore validated using PostgreSQL 16.
- Evidence: `docs/day-1/evidence/postgres-recovery-backup.sql`
- Test record was restored into a fresh database and verified.
- Production failover and point-in-time recovery remain untested.
- NetworkPolicy enforcement remains BLOCKED pending validation with a policy-enforcing CNI.
- Pod restart investigation remains unresolved; the root cause was not confirmed.

### Follow-up: Cluster Responsiveness Incident

- **Impact:** Widespread probe timeouts and container restarts across application, GitOps, monitoring, and Kubernetes system workloads.
- **Recovery:** All inspected pods returned to Running/Ready, and the node is Ready.
- **Evidence:** API server logs showed slow requests and API aggregation warnings. etcd logs showed transactions taking approximately 100–300 ms, with some operations exceeding the expected 100 ms duration. The metrics API returned HTTP 503 during the incident.
- **Resource checks:** No OOM-kill evidence was found in the inspected kernel logs. The Kind node container showed RestartCount=0 and OOMKilled=false.
- **Assessment:** Control-plane and etcd latency likely contributed to the widespread timeouts. The original trigger is not confirmed.
- **Follow-up:** Monitor etcd latency, API server responsiveness, resource utilization, probe failures, and restart counts.
