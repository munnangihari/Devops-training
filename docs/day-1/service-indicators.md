# Service Indicators and SLO Baseline

Assessment date: 19 October 2026
Environment: kind-blackroth-capstone

## Target SLOs

| Indicator | Target | Current measurement |
|---|---|---|
| Availability | 99.9% | Not yet measured over a defined window |
| P95 latency | Below 500 ms | Application latency evidence pending |
| Error rate | Below 1% | Application request/error evidence pending |
| Recovery Time Objective | 30 minutes | Restore exercise pending |
| Recovery Point Objective | 15 minutes | Backup and restore evidence pending |

## Current Kubernetes evidence

- One control-plane node is Ready.
- The HRMS API HPA reports CPU at 1% against a 70% target.
- The node reports 1598m CPU and 3637Mi memory usage at collection time.
- Listed pods were Running and Ready in the captured snapshot.
- Multiple workloads have accumulated restarts.
- Warning events include historical probe failures and metrics-related issues.

## Measurement plan

1. Measure successful and failed application requests over a defined period.
2. Capture request latency and calculate P95.
3. Validate Prometheus targets and alert rules.
4. Conduct a controlled recovery exercise to measure RTO.
5. Validate backup restoration and data recovery point to measure RPO.

A Kubernetes Ready status alone does not demonstrate that the SLOs are met.
