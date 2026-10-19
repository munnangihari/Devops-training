# Day 1 — Platform Baseline
Date: 12 October 2026
Environment: Kind / Blackroth Capstone
Kubernetes Version: v1.30.0

## 1. Cluster Inventory
- Context: kind-blackroth-capstone
- Nodes: 1 control-plane node, currently Ready
- Namespaces: 8 Active namespaces
- Node pressure: MemoryPressure, DiskPressure, and PIDPressure are False

## 2. Workload and Deployment Review
- Blackroth application: 2/2 replicas available in the initial snapshot
- HRMS blue, green, and production deployments: 3/3 replicas each
- HRMS canary rollout: 10 available replicas in the inspected snapshot
- Core Kubernetes services are running

## 3. Operational Findings
- Duplicate Argo Rollouts controller exists in the default namespace.
- Its service account cannot read default/argo-rollouts-config.
- The existing ClusterRoleBinding references the argo-rollouts namespace service account.
- Local-path provisioner has experienced repeated restarts; its latest logs show successful startup.
- Monitoring workloads have recorded probe failures and restarts.
- Metrics API is unavailable, so actual CPU and memory usage could not be verified.

## 4. Risks and Follow-up
1. Verify the source of the duplicate Argo Rollouts deployment before removing it.
2. Investigate repeated monitoring and storage component restarts.
3. Restore or configure the Metrics API if required.
4. Review probes, resource requests, and limits.
5. Document deployment rollback and recovery procedures.

## 5. Completion Status
Cluster inventory and initial risk assessment completed.
Outstanding issues documented for subsequent remediation.
