# HRMS Error Budget Calculation

## 1. Objective
Calculate the permitted unreliability for HRMS using availability SLO targets over a rolling 30-day window.

## 2. Calculation Formula

Error Budget (%) = 100% - Availability SLO

Error Budget Time = Total Window Duration × Error Budget Percentage

## 3. Monthly Error Budget

A 30-day window contains 43,200 minutes.

| Availability SLO | Error Budget | Allowed Downtime |
|---|---:|---:|
| 99% | 1% | 432 minutes (7 hours 12 minutes) |
| 99.9% | 0.1% | 43.2 minutes |
| 99.95% | 0.05% | 21.6 minutes |
| 99.99% | 0.01% | 4.32 minutes |

## 4. HRMS Target

- Availability SLO: 99.9%
- Measurement window: Rolling 30 days
- Error budget: 0.1%
- Equivalent downtime budget: 43.2 minutes per 30 days

This downtime value is an approximation. Actual request-based availability depends on eligible request counts and failures.

## 5. Error Budget Policy

- Monitor error-budget consumption regularly.
- Investigate sudden increases in failed requests.
- Prioritize reliability fixes when the remaining budget is low.
- Pause non-essential risky releases when the budget is exhausted.
- Review incidents and document corrective actions before resuming risky changes.

## 6. Current Status

The values above are calculated from the proposed SLO targets. Actual budget consumption and remaining budget are not yet measured because validated application SLI data has not been confirmed.

## 7. Validation

The calculation uses a 30-day window:
30 × 24 × 60 = 43,200 minutes.

For the 99.9% target:
43,200 × (1 - 0.999) = 43.2 minutes.
