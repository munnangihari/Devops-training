# Task 5.3 — Recovery Validation Report

## Objective
Validate HRMS application health, deployment recovery, and recovery evidence.

## 1. Deployment Health
- Deployment: hrms-api
- Namespace: default
- Ready replicas: 3/3
- Rollout status: Successful

## 2. Pod Health
- All three hrms-api pods are Running.
- All three pods report Ready (1/1).
- Current pod restart count: 0 for each pod.

## 3. Rollback Validation
- Updated image: nginx:1.29
- Rollback image: nginx:1.28
- Rollout status after rollback: Successful
- Deployment health after rollback: 3/3 replicas ready

## 4. HPA Validation
- Minimum replicas: 3
- Maximum replicas: 10
- CPU target: 70%
- Observed CPU utilization: 1%
- Current replicas: 3

## 5. Limitations
- Database restore has not been tested.
- Disaster recovery and measured RTO/RPO have not been validated.
- HPA scale-up under load has not been tested.

## Result
Application health and deployment rollback were verified.
Database and full disaster recovery validation remain pending.
