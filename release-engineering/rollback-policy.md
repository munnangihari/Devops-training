# Task 33.4 — Automated Rollback Policy

## Objective

Automatically stop or roll back a production release when application health or
performance exceeds predefined thresholds.

## Rollback Conditions

| Condition | Threshold | Action |
|---|---:|---|
| Error Rate | > 5% | Rollback |
| P95 Latency | > 1 second | Rollback |
| HTTP 5xx | Above defined threshold | Rollback |
| Pod Restart Rate | Increasing / abnormal | Rollback |
| Health Check | Failure | Rollback |

## Rollback Flow

New Release
    ↓
Canary Deployment
    ↓
Monitor Metrics
    ↓
Health Checks
    ↓
Threshold Exceeded?
    ├── No → Continue Promotion
    └── Yes → Abort Rollout
                  ↓
             Restore Stable Version

## Monitoring Tools

- Prometheus — metrics
- Grafana — visualization
- Loki — application logs
- Argo Rollouts — progressive delivery and rollback
- Argo CD — GitOps deployment management

## Rollback Objective

The primary objective is to minimize customer impact and restore the last known
healthy application version as quickly as possible.
