# HRMS Service Level Indicators and Objectives

## 1. Purpose
Define measurable reliability targets for the HRMS application.

## 2. Service Level Indicators (SLIs)

| SLI | Definition | Measurement |
|---|---|---|
| Availability | Percentage of eligible requests completed successfully | Successful requests / Total eligible requests * 100 |
| Error Rate | Percentage of eligible requests returning HTTP 5xx errors | HTTP 5xx requests / Total requests * 100 |
| P95 Latency | Response time within which 95% of requests complete | 95th percentile of request duration |
| Recovery Time | Time taken to restore service after an incident | Incident start to service restoration |
| Recovery Point | Maximum acceptable data loss measured in time | Difference between failure time and latest recoverable data |

## 3. Service Level Objectives (SLOs)

| Indicator | Target | Measurement Window |
|---|---|---|
| Availability | >= 99.9% | Rolling 30 days |
| P95 Latency | < 500 ms | 5-minute monitoring interval |
| Error Rate | < 1% | 5-minute monitoring interval |
| Recovery Time Objective (RTO) | <= 30 minutes | Per recovery test |
| Recovery Point Objective (RPO) | <= 15 minutes | Per recovery test |

## 4. Error Budget

Error budget = 100% - Availability SLO.

For a 30-day window:
- Availability target: 99.9%
- Error budget: 0.1%
- Total window: 43,200 minutes
- Equivalent downtime budget: 43.2 minutes

The downtime equivalent is an approximation; request-based availability should be measured from eligible requests.

## 5. Error-Budget Policy

- Monitor SLO performance and error-budget consumption regularly.
- Investigate rapid error-budget consumption and reliability alerts.
- If the budget is nearly exhausted, prioritize reliability improvements and reduce risky releases.
- If the budget is exhausted, pause non-essential risky changes until reliability improves.
- Review incidents and document corrective actions.

## 6. Monitoring and Validation

Prometheus alert rules are configured for:
- HTTP 5xx error rate above 1%.
- P95 request latency above 500 ms.
- High pod CPU usage.
- Increased container restarts.

These rules must be validated against actual application metrics and confirmed as loaded by Prometheus.

## 7. Assumptions and Limitations

- Targets are proposed objectives, not proof of achieved production reliability.
- RTO and RPO require recovery and backup restoration tests.
- Availability and latency calculations depend on the application exporting the required metrics.
- Missing or unavailable metrics must not be treated as evidence that an SLO is met.
