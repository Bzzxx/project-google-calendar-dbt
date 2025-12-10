# Google Calendar Analytics Pipeline (dbt + Snowflake + GitHub Actions)

A complete end-to-end analytics engineering project built with **dbt**, **Snowflake**, and **GitHub Actions**.  
The pipeline transforms raw Google Calendar event & attendee data into structured analytical marts
for reporting, automation, and trend analysis.

---

## 🖼 Architecture Overview

<p align="center">
  <img src="docs/images/calendar_dbt_architecture.png" 
       alt="Google Calendar → Snowflake → dbt → GitHub Actions → Power BI architecture"
       width="85%">
</p>

This diagram shows the full analytics pipeline:

- **Google Calendar** — source of events and attendees  
- (optionally) **Fivetran / ingestion layer** — automated data loading into Snowflake  
- **Snowflake** — cloud data warehouse (raw + staging + analytics schemas)  
- **dbt Core** — transformations (staging → intermediate → marts), tests, documentation  
- **GitHub Actions** — CI/CD orchestration for scheduled dbt runs  
- **Power BI** — consuming marts as a BI / reporting layer

---

## 🌟 Project Overview

This project demonstrates a **production-ready data transformation workflow**, including:

- dbt for SQL modeling, testing & documentation  
- Snowflake as a cloud data warehouse  
- GitHub Actions for automated nightly builds  
- Google Calendar API as the raw data source  
- Multi-layer dbt architecture (staging → intermediate → marts)  

The pipeline extracts raw events & attendee metadata and turns them into insights such as:

- Daily & weekly event distributions  
- Number of attendees per event  
- Attendee status trends  
- Calendar usage patterns  
- Event-level analytical mart for reporting  

---

## 📊 Dataset

The project uses exported data from the **Google Calendar API**, loaded into Snowflake via external tools.

### **Source tables (raw → staging):**

- `STG_EVENTS`
Contains event metadata such as title, start/end timestamps, description, event status, and calendar ID.

- `STG_ATTENDEE`
Contains attendee-level data: email, status, organizer flag, optional flags, etc.

- `STG_CALENDAR_LIST`
Contains metadata about user's calendars (name, color, visibility).

---

## 🧱 Project Structure (dbt)

```text
google_calendar_project/
│
├── models/
│   ├── staging/
│   │   ├── stg_events.sql
│   │   ├── stg_attendee.sql
│   │   └── stg_calendar_list.sql
│   │
│   ├── intermediate/
│   │   └── int_events_with_attendees.sql
│   │
│   ├── marts/
│   │   ├── attendees_status_summary.sql
│   │   ├── calendar_events_summary.sql
│   │   ├── events_daily_weekly_summary.sql
│   │   └── schema.yml
│   │
│   └── sources/
│       └── google_calendar_sources.yml
│
├── logs/
├── target/
└── README.md
```
---

## ⚙️ CI/CD Overview

Automated CI/CD process powered by **GitHub Actions**, used to run dbt transformations,
validate data quality, and deploy analytics models to **Snowflake** on a daily schedule.

## 🔁 Workflow Summary
- Installs dbt runtime and dependencies  
- Generates `profiles.yml` securely using GitHub Secrets  
- Runs `dbt deps`  
- Runs `dbt build` (models + tests)  
- Publishes transformed datasets to Snowflake  
- Ensures reliability, observability, and automation across all pipeline layers  

## ⏱️ Schedule
| Trigger | Value |
|--------|--------|
| Manual trigger | ✔️ |
| Daily cron | `0 4 * * *` (04:00 UTC) |

## 🎯 Purpose
Ensures consistent data freshness, test validation, and production-ready
automation for the analytics workflow.

---


## 🧪 Data Tests

The project uses **dbt native tests** and **custom logic** to ensure data consistency across staging,
intermediate layers, and marts.

## Built-in Tests
- `not_null`
- `unique`
- `relationships`

## Custom Tests
- Grain validation for event-attendee models  
- Business-rule tests for summary marts  

## 📁 Location
``models/marts/schema.yml``

## 🎯 Purpose
Guarantees correctness and reliability of every transformed dataset before
publishing analytics marts.

---


## 🚀 Future Improvements

Planned enhancements to expand analytical capabilities and improve long-term observability.

## 📌 Roadmap
- Incremental history for events & attendees  
- dbt snapshots for attendee status evolution  
- Visualization dashboards (Tableau / PowerBI)  
- Automated anomaly-detection alerts in the pipeline  

## 🎯 Vision
Build a scalable, production-grade analytics ecosystem around Google Calendar data.

---

## 📊 Project Status

Current operational state of the pipeline.

## 🔍 Indicators
| Component | Status |
|----------|--------|
| Snowflake connection | 🟢 Operational |
| dbt model builds | 🟢 Passing |
| GitHub Actions automation | 🟢 Enabled |

## 🏁 Summary
All core components (Snowflake, dbt, CI/CD automation) are stable, functional,
and running in production mode.


