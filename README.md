# 📅 Google Calendar ETL Pipeline (dbt + Snowflake)

A production-ready data transformation pipeline built using **dbt**, **Snowflake**, and **GitHub Actions**.

This project extracts raw Google Calendar events & attendees, cleans and models them through a multi-layer dbt architecture, and produces analytical marts for reporting & automation.

---

## 🚀 Project Overview

This project demonstrates a **modern data engineering workflow**:

- dbt for SQL modeling, testing, and lineage  
- Snowflake as the cloud data warehouse  
- GitHub Actions for automated nightly builds  
- Google Calendar API as the raw event data source  

The pipeline turns raw event & attendee records into insights such as:

- Daily and weekly event counts  
- Number of attendees per event  
- Participation trends  
- Attendance status distribution  

---

## 💾 Dataset

Data originates from the **Google Calendar API export**.

### Source Tables

<details>
<summary><strong>📄 STG_EVENTS</strong></summary>

Contains raw event metadata:

- event title  
- description  
- start/end times  
- calendar ID  
</details>

<details>
<summary><strong>📄 STG_ATTENDEE</strong></summary>

Contains attendee-level details:

- attendee email  
- acceptance status  
- organizer flag  
- optional/required indicator  
</details>

---

## 🧠 Modeling Approach

The project follows the classic **three-layer dbt architecture**:


### 📌 Staging Models (`/models/staging`)
Purpose:
- Standardize field names  
- Cast types  
- Clean inconsistent values  
- Prepare reliable structured inputs  

Models:
- `stg_events.sql`  
- `stg_attendee.sql`  

---

### 📌 Intermediate Models (`/models/intermediate`)

<details>
<summary><strong>🔗 int_events_with_attendees.sql</strong></summary>

Joins events with attendees and produces:

- one row per attendee per event  
- consistent grain across dataset  
- relationships validated through dbt tests  
</details>

---

### 📌 Analytics Marts (`/models/marts`)

<details>
<summary><strong>📊 calendar_events_summary.sql</strong></summary>
Aggregates metadata per calendar:

- event counts  
- distribution by event type or status  
</details>

<details>
<summary><strong>📊 attendees_status_summary.sql</strong></summary>
Aggregates per attendee:

- accepted  
- declined  
- tentative  
- total events  
</details>

<details>
<summary><strong>📈 events_activity_over_time.sql</strong></summary>

Time-series facts:

- daily event counts  
- weekly trends  
- attendee volume  
- multi-year comparison  
</details>

---

## 📊 Example Outputs

### Event Activity Over Time
| event_start_date | total_events | total_attendees |
|------------------|--------------|-----------------|
| 2025-01-01        | 2            | 5               |
| 2025-01-02        | 1            | 2               |

### Attendee Status Summary
| attendee_email | accepted | declined | tentative |
|----------------|----------|----------|-----------|
| user@gmail.com | 12       | 1        | 0         |

---

## ⚙️ Tech Stack

- **Snowflake** — cloud data warehouse  
- **dbt Core** — transformations, documentation, testing  
- **GitHub Actions** — CI/CD automation  
- **Google Calendar API** — raw data source  
- **Python 3.11** — dbt runtime  

---

## 📂 Repository Structure

```text
google_calendar_project/
│
├── models/
│   ├── staging/
│   │   ├── stg_events.sql
│   │   ├── stg_attendee.sql
│   │
│   ├── intermediate/
│   │   └── int_events_with_attendees.sql
│   │
│   ├── marts/
│       ├── calendar_events_summary.sql
│       ├── attendees_status_summary.sql
│       ├── events_activity_over_time.sql
│       └── schema.yml
│
├── snapshots/
├── tests/
├── logs/
├── dbt_project.yml
│
└── .github/workflows/
    └── dbt_prod.yaml

│
└── .github/workflows/
    └── dbt_prod.yaml
```
## 📦 CI/CD Overview (GitHub Actions)
description: >
    Automated GitHub Actions pipeline for running dbt transformations
    and ensuring daily data freshness in Snowflake.
  schedule:
    manual_trigger: true
    cron: "0 4 * * *"   # runs daily at 04:00 UTC
  workflow_steps:
    - Install dbt runtime and dependencies
    - Generate profiles.yml from GitHub Secrets
    - Run dbt deps
    - Run dbt build (models and tests)
    - Deploy transformed datasets to Snowflake
  purpose: >
    Ensures continuous reliability, data quality, and automation of the
    analytics pipeline.
