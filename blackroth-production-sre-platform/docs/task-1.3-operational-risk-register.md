# Task 1.3 — Operational Risk Register

**Date:** 12 October 2026
**Environment:** Kind — blackroth-capstone
**Project:** Blackroth Production SRE Platform

## 1. Objective

Identify operational risks affecting cluster stability, application availability,
monitoring, autoscaling, deployment operations, and infrastructure security.

## 2. Risk Register

| ID | Risk | Severity | Evidence | Recommended Action |
|---|---|---|---|---|
| R-01 | Kubernetes control-plane instability | High | Historical API server, scheduler, controller-manager, and etcd probe failures; restart and timeout events | Inspect current container restart counts and logs; review host resource pressure |
| R-02 | Resource metrics unavailable | High | `kubectl top nodes` and `kubectl top pods -A` return Metrics API not available | Identify whether metrics-server or another metrics provider is installed and healthy |
| R-03 | Duplicate Argo Rollouts controller | High | Controller in `default` is CrashLoopBackOff with 118 restarts; controller in `argo-rollouts` is Running | Inspect deployment ownership, service accounts, RBAC, and logs before changing resources |
| R-04 | Application health-check instability | High | Historical readiness/liveness timeouts and connection-refused events for application pods | Verify current endpoints, probe configuration, logs, and application responses |
| R-05 | Monitoring reliability risk | High | Historical probe failures and restarts across Prometheus, Grafana, Alertmanager, and exporters | Check current targets, alert rules, component health, and notification delivery |
| R-06 | Autoscaling not verified | High | `kubectl get hpa -A` returned no resources; Metrics API unavailable | Compare deployed resources with project manifests and verify autoscaling prerequisites |
| R-07 | Single-node resilience limitation | Medium | Cluster has one control-plane node hosting all workloads | Document that this local Kind environment cannot demonstrate node-level high availability |
| R-08 | Database and Redis access restrictions need review | Medium | Previous configuration review identified security-group ingress covering the VPC CIDR | Review intended application sources and restrict ingress to required security groups |
| R-09 | AWS deployment permissions risk | Medium | Earlier AWS operations encountered explicit SCP denies | Verify authorized AWS access before planning infrastructure deployment |
| R-10 | Backup and disaster recovery readiness unverified | Medium | Recovery procedures and restoration evidence still require validation | Document backup coverage, recovery steps, and restoration-test evidence |

## 3. Existing Controls

- Kubernetes node currently reports Ready.
- MemoryPressure, DiskPressure, and PIDPressure are False.
- Most pods were Running and Ready in the captured snapshot.
- Terraform formatting and static validation passed during Task 1.2.
- The report distinguishes historical warning events from current health.

## 4. Prioritized Follow-up

1. Investigate control-plane timeouts and restart history.
2. Diagnose the missing Metrics API and verify HPA requirements.
3. Investigate the duplicate Argo Rollouts controller and its RBAC.
4. Validate application probes and monitoring targets.
5. Review AWS security-group restrictions and recovery documentation.

## 5. Completion Status

Initial operational risk identification completed from captured Kubernetes
diagnostics and the previous configuration review.

Current component health, root causes, and remediation effectiveness remain
subject to further verification. No production infrastructure changes were
performed as part of this assessment.

## 6. Confirmed Diagnostic Evidence

### R-03 — Duplicate Argo Rollouts Controller
- Status: Confirmed failure.
- Evidence: The controller in the default namespace is in CrashLoopBackOff
  with 119 recorded restarts.
- Root cause: Startup logs report that service account
  system:serviceaccount:default:argo-rollouts cannot get the
  argo-rollouts-config ConfigMap in the default namespace.
- Impact: The duplicate controller cannot initialize successfully.
- Next action: Inspect ownership, service accounts, and RBAC before
  deciding whether the duplicate installation should be removed.

### R-02 — Metrics API Unavailable
- Status: Confirmed unavailable in the captured diagnostic.
- Evidence: No metrics APIService was returned by the metrics filter,
  kubectl top nodes reported Metrics API not available, and no HPA
  resources were returned.
- Impact: Resource metrics and HPA operation have not been demonstrated.
- Next action: Identify the metrics provider and verify its installation
  and API registration before making changes.

### R-01 — Control-Plane Restart History
- Status: Requires further investigation.
- Evidence: Control-plane pods are currently Running, but several have
  accumulated restarts and historical probe failures.
- Next action: Inspect current and previous container logs and correlate
  failures with host resource pressure.


## 7. HPA Configuration Gap

- Status: Configuration gap confirmed.
- Evidence: The project defines an autoscaling/v2 HPA targeting the
  hrms-api Deployment, with a minimum of 3 replicas, maximum of 10,
  and a CPU utilization target of 70%.
- Live state: No HPA resources or metrics API service were found
  in the inspected cluster.
- Risk: CPU-based autoscaling has not been demonstrated.
- Action: Confirm the target Deployment and namespace, install or
  configure an appropriate metrics provider, then validate HPA behavior.

## 8. Duplicate Controller Ownership

- Status: Standalone deployment confirmed.
- Evidence: The default namespace controller has no owner reference
  and uses a service account not covered by the existing
  argo-rollouts ClusterRoleBinding.
- Action: Confirm its installation source and intended purpose before
  removing or changing the duplicate installation.

## 9. Assessment Outcome

The initial operational risk assessment is documented using
Kubernetes diagnostics and project configuration evidence.
Remediation, control-plane root-cause analysis, and post-remediation
validation remain outstanding.
