Google Calendar ELT Pipeline (Fivetran → Snowflake → dbt → GitHub Actions)

This project is a compact, production-style ELT pipeline built as a Data Engineering portfolio piece.
It demonstrates automated data ingestion, transformation, testing and CI/CD using modern cloud tools.

🔧 Tech Stack

Fivetran – automated ingestion of Google Calendar data
Snowflake – cloud data warehouse (raw + analytics schemas)
dbt Core – transformations, tests, documentation
GitHub Actions – automated daily dbt build (CI/CD)

🚀 What the Pipeline Does

Replicates Google Calendar events + attendees via Fivetran

Stores raw data in Snowflake

Cleans and models data into:

staging layer (raw → standardized)

intermediate layer (events + attendees join)

marts (analytics tables)

Runs tests + builds models automatically via GitHub Actions

🧱 Data Models (dbt)

Staging:

stg_events

stg_attendee

Intermediate:

int_events_with_attendees – enriched event records with attendee-level detail

Marts:

calendar_events_summary – event metrics (attendee counts, statuses)

attendees_status_summary – user-level activity statistics

events_activity_over_time – daily/weekly event participation trends

All marts include dbt tests (not_null, unique) and documentation.

⚙️ CI/CD (GitHub Actions)

Automated workflow runs:

pip install dbt-core dbt-snowflake

generates profiles.yml from GitHub Secrets

executes dbt build on schedule or manual trigger

This mimics a production-grade orchestration setup.

📈 What This Project Demonstrates

✔ End-to-end ELT pipeline

✔ Working dbt DAG (staging → intermediate → marts)

✔ Data quality tests

✔ Automated builds via GitHub Actions

✔ Clean, modular SQL transformations

✔ Cloud-native stack used by modern Data Engineering teams


📌 Status

Fully functional and automated.
A clear example of a real-world analytical pipeline using modern DE tooling.

