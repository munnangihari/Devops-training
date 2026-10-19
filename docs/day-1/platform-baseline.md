# Platform Baseline

Assessment date: 19 October 2026
Context: kind-blackroth-capstone
Kubernetes version: v1.30.0

## Observed architecture

The cluster has one Ready control-plane node and hosts HRMS workloads, the
Blackroth application, Argo CD, Argo Rollouts, CoreDNS, metrics-server,
local-path storage, and the Prometheus/Grafana monitoring stack.

## Reliability observations

- The captured pod snapshot shows listed workloads Running and Ready.
- The HRMS API HPA reports CPU usage at 1% against a 70% target.
- The node reports 61% memory utilization at collection time.
- Several workloads have accumulated restarts.
- Warning-event evidence includes probe failures, metrics-related errors,
  and local-path-provisioner restart history.

## Risks

See [Risk Register](risk-register.md).

## Security review

See [Security Review](security-review.md).

## Service indicators

See [Service Indicators](service-indicators.md).

## Evidence

The evidence directory contains Kubernetes resource snapshots and configuration
captures. Treat each file as a time-specific observation, not a guarantee of
continuous health.

## Limitations

- This is a single-node Kind environment, not a production multi-AZ cluster.
- Availability, P95 latency and error-rate targets have not yet been measured.
- Backup/restore and network-isolation behavior require explicit tests.
- Historical warning events require correlation with current pod status and logs.
