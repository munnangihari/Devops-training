# Day 3 — GitOps Deployment Report

## Objective
Implement and validate GitOps-based Kubernetes deployments using Kustomize and Argo CD.

## Completed Tasks
1. Created a reusable Kustomize base for the HRMS API.
2. Configured separate development and staging overlays.
3. Configured Argo CD applications for both environments.
4. Validated synchronization and application health.
5. Updated staging from nginx:1.28 to nginx:1.29 and verified the rollout.
6. Confirmed development remained on nginx:1.28.
7. Reverted staging to nginx:1.28 and verified the rollback.
8. Confirmed both environments have three ready replicas.

## Final Status
- Argo CD hrms-dev: Synced and Healthy
- Argo CD hrms-staging: Synced and Healthy
- Development replicas: 3/3
- Staging replicas: 3/3
- Development final image: nginx:1.28
- Staging final image: nginx:1.28

## Evidence
See docs/evidence/day-3-* for captured application, workload, and image state.
