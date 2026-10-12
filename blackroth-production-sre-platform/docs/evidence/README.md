# Task 1.5 — Kubernetes Baseline Evidence

**Cluster:** kind-blackroth-capstone
**Evidence type:** Diagnostic snapshots
**Capture date:** 12 October 2026

| File | Purpose |
|---|---|
| context.txt | Active Kubernetes context |
| nodes.txt | Node status and version |
| namespaces.txt | Namespace inventory |
| deployments.txt | Deployment inventory |
| pods.txt | Pod status and placement |
| services.txt | Service inventory |
| events.txt | Kubernetes event history |
| hpa.txt | HPA inventory |
| apiservices.txt | Registered API services |
| metrics-api.txt | Resource Metrics API check |
| node-metrics.txt | Live node metrics check |
| captured-at.txt | Capture timestamp |

## Findings

- The Kind control-plane node reported Ready during collection.
- No HPA resources were found.
- The `v1beta1.metrics.k8s.io` APIService was not found.
- `kubectl top nodes` reported that the Metrics API is unavailable.
- These findings mean CPU-based HPA behavior has not been demonstrated.
- Historical events must be distinguished from current failures.

These files are diagnostic snapshots and do not prove that every
workload or monitoring component is healthy.
