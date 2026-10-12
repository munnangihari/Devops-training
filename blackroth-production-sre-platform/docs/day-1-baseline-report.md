# Day 1 — Production SRE Platform Baseline Report

**Date:** 12 October 2026  
**Project:** Blackroth Production SRE Platform  
**Environment:** Local Kind Kubernetes cluster  
**Cluster context:** kind-blackroth-capstone  
**Status:** Baseline assessment documented; remediation pending

## 1. Objective

Establish an initial operational baseline for the Blackroth Production
SRE Platform by reviewing Kubernetes health, application workloads,
infrastructure configuration, monitoring, autoscaling, security, and
disaster recovery readiness.

## 2. Kubernetes Platform Baseline

The local Kind cluster uses Kubernetes v1.30.0 and has one control-plane
node, blackroth-capstone-control-plane.

The captured diagnostics reported:
- Node status: Ready.
- MemoryPressure: False.
- DiskPressure: False.
- PIDPressure: False.
- Allocatable CPU: approximately 8 cores.
- Allocatable memory: approximately 3.9 GiB.
- CPU requests: approximately 1,150m (14%).
- Memory requests: approximately 746 MiB (19%).

Historical events included control-plane probe failures, timeouts,
application health-check failures, and container restarts. These findings
require further investigation and do not, by themselves, establish a
single root cause.

## 3. Workload and Deployment Baseline

The captured workload inventory included the Blackroth capstone
deployment, HRMS blue/green and production deployments, and an HRMS
canary rollout.

Most workloads were Running and Ready in the inspected snapshot.
However, the default-namespace Argo Rollouts controller was in
CrashLoopBackOff, while another controller in the argo-rollouts
namespace was Running.

Historical readiness/liveness failures and restarts were observed.
Current health must be rechecked before any remediation is considered
successful.

## 4. Infrastructure Configuration Review

The project configuration review identified:
- Terraform configuration for a VPC, public/private subnets, an
  Internet Gateway, a NAT Gateway, EKS, RDS PostgreSQL, and Redis.
- EKS configured for Kubernetes v1.30 with a managed node group.
- RDS configured with encryption, Multi-AZ, seven-day backups, and
  deletion protection.
- Redis configured with replication, automatic failover, Multi-AZ,
  and encryption.
- Database and Redis security-group ingress rules allowing the VPC CIDR,
  which require review against least-privilege requirements.
- Kubernetes application manifests defining three initial replicas,
  readiness/liveness probes, and resource requests and limits.
- An HPA manifest targeting 70% CPU utilization, with three to ten
  replicas.

Terraform formatting and static validation passed during the configuration
review. No Terraform apply or AWS infrastructure deployment was performed
as part of that review.

## 5. Monitoring and Autoscaling Baseline

The captured cluster diagnostics showed:
- The Kubernetes Metrics API was unavailable.
- kubectl top could not retrieve resource metrics.
- No HPA resources were present in the inspected cluster.
- The project HPA manifest targets an hrms-api Deployment, but that
  Deployment was not found in the inspected live cluster.
- Prometheus alert rules exist in project configuration, but live
  alert evaluation, metric availability, and notification delivery
  have not been fully verified.

Therefore, working resource-based autoscaling and end-to-end alerting
have not yet been demonstrated.

## 6. Confirmed Operational Risks

| ID | Risk | Severity | Initial action |
|---|---|---|---|
| R-01 | Historical Kubernetes control-plane instability | High | Correlate restarts, logs, events, and host resource conditions |
| R-02 | Metrics API unavailable | High | Identify and validate the metrics provider |
| R-03 | Duplicate Argo Rollouts controller with RBAC failure | High | Confirm ownership and installation source before changes |
| R-04 | Historical application health-check failures | High | Validate probes, endpoints, and application responses |
| R-05 | Monitoring reliability not fully verified | High | Check targets, alert evaluation, and notification delivery |
| R-06 | Autoscaling not demonstrated | High | Align deployed workload, HPA, and metrics infrastructure |
| R-07 | Single-node local cluster | Medium | Document resilience limitations |
| R-08 | Database/Redis ingress requires least-privilege review | Medium | Restrict access to required sources |
| R-09 | AWS deployment permissions require verification | Medium | Confirm authorized access before deployment |
| R-10 | Disaster recovery readiness unverified | Medium | Validate backup and restoration procedures |

Detailed evidence and recommended actions are maintained in
docs/task-1.3-operational-risk-register.md.

## 7. Remediation Priorities

1. Investigate historical control-plane restarts and probe failures.
2. Diagnose and restore the required resource metrics capability.
3. Review the duplicate Argo Rollouts controller and its RBAC.
4. Validate application health checks and monitoring reliability.
5. Align the HRMS Deployment, HPA, and metrics configuration.
6. Review database and Redis network access restrictions.
7. Verify AWS permissions, backup coverage, and recovery procedures.
8. Capture fresh diagnostics after remediation.

## 8. Validation and Limitations

This report consolidates the initial baseline, configuration review, and
risk assessment. It does not represent a post-remediation health check.

The local single-node Kind environment cannot establish production
multi-node high availability. AWS deployment permissions have previously
prevented some operations, and no production AWS deployment is claimed.

Historical events must be distinguished from current conditions. Root
causes and remediation effectiveness remain unverified until new evidence
is collected.

## 9. Day 1 Outcome

The initial Kubernetes baseline, infrastructure configuration review,
and operational risk register have been documented. The baseline report
provides a prioritized follow-up plan for stability, metrics, deployment
control, monitoring, security, and recovery readiness.

**Documentation status:** Complete after review and commit.  
**Operational remediation status:** Pending.
