📅 Google Calendar ETL Pipeline (dbt + Snowflake)

A complete end-to-end data transformation pipeline built using dbt, Snowflake, and GitHub Actions.
This project extracts raw Google Calendar events and attendees, cleans and models them through a multi-layered dbt architecture, and produces analytical marts for reporting and automation.

📘 Table of Contents

🚀 Project Overview

💾 Dataset

🧠 Modeling Approach

Staging Models

Intermediate Models

Analytics Marts

📊 Example Outputs

⚙️ Tech Stack

📂 Repository Structure

🔄 Automation (CI/CD)

🧪 Data Tests

📈 Future Improvements

✔️ Status

🚀 Project Overview

This project demonstrates a production-ready data transformation workflow using:

dbt for SQL modeling and testing

Snowflake as the cloud data warehouse

GitHub Actions for automated nightly builds

Google Calendar API as the raw data source

The pipeline transforms raw event & attendee data into insights such as:

Daily/weekly event counts

Number of attendees per event

Participation trends over time

Status distribution of users

This is structured and documented following modern data engineering best practices.

💾 Dataset

The project uses exported data from the Google Calendar API.

Source Tables (raw → staging)
STG_EVENTS

Contains raw event metadata such as:

title

description

start/end times

calendar ID

STG_ATTENDEE

Contains attendee information:

attendee email

status

organizer flag

optional/required indicator

🧠 Modeling Approach

The dbt project follows the classic three-layer architecture:

staging  →  intermediate  →  marts

Staging Models

Purpose:

Standardize field naming

Perform type casting

Clean null or inconsistent values

Prepare reliable inputs for transformations

Models:

stg_events.sql

stg_attendee.sql

Intermediate Models
int_events_with_attendees.sql

Joins events with attendees

Produces one row per attendee per event

Ensures referential consistency between both sources

Analytics Marts
calendar_events_summary.sql

Aggregates:

Events per calendar

Count by status

Basic metadata rollups

attendees_status_summary.sql

Aggregates per user:

Accepted

Declined

Tentative

Total participation

events_activity_over_time.sql

Time-series mart containing:

Daily and weekly event counts

Attendances per event

Multi-year trends (past years + current)

📊 Example Outputs
Event Activity Over Time
event_start_date	total_events	total_attendees
2025-01-01	2	5
2025-01-02	1	2
Attendee Status Distribution
attendee_email	accepted	declined	tentative
user@gmail.com
	12	1	0
⚙️ Tech Stack

Snowflake — cloud data warehouse

dbt Core — SQL modeling, macros, lineage, testing

GitHub Actions — fully automated CI/CD

Google Calendar API — source system

Python 3.11 — environment for dbt execution

📂 Repository Structure
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

🔄 Automation (CI/CD)

GitHub Actions pipeline runs:

manually on demand

automatically once per day (04:00 UTC)

Workflow steps:

Install dbt

Generate profiles.yml dynamically using GitHub Secrets

Run dbt deps

Run dbt build (models + tests)

Deploy results to Snowflake

This ensures the project remains always up-to-date, production-ready, and continuously validated.

🧪 Data Tests

Built-in dbt tests used:

not_null

unique

relationships

custom grain tests

Test definitions are located in schema.yml inside the marts folder.

📈 Future Improvements

Potential enhancements:

Incremental models for large event histories

dbt snapshots for tracking attendee status changes

BI dashboards (Tableau / Power BI)

Alerts for anomalies in event activity

✔️ Status

🟢 Fully operational and deployed
Snowflake environment + CI/CD + dbt modeling all functioning as expected.
