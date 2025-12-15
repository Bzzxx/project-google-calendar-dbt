# 📂 Project Artifacts

# 1. Data Generation

- Registered Fivetran account and connected Snowflake as destination

---

# 2. Storage

- Created Snowflake account with user, role, and warehouse
- Granted necessary access permissions

<p align="center">
  <img src=".github/assets/Snowflake_DB_view.png"
       alt="Snowflake_DB_view"
       width="85%">
</p>

---

# 3. Ingestion

- Configured Google Calendar connector in Fivetran
- Established automated sync to Snowflake (every 6 hours)
  
<p align="center">
  <img src=".github/assets/Fiv_con.png"
       alt="Fivetran_connection"
       width="85%">
</p>

---

# 4. Transformation

- Installed dbt Core and initialized project
- Configured Snowflake connection in profiles.yml

  <p align="center">
  <img src=".github/assets/console_log_2.png"
       alt="console_log_profiles.yml"
       width="85%">
</p>

# Created three-layer dbt architecture:

- Staging: Raw source data models
- Intermediate: Business logic transformations
- Marts: Final analytical models

---

- Implemented data quality tests with dbt test
  
<p align="center">
  <img src=".github/assets/console_log.png"
       alt="console_log_tests"
       width="85%">
</p>

- Generated documentation and lineage graphs

<p align="center">
  <img src=".github/assets/lineage_graph_DB.png"
       alt="Lineage_graph_Database"
       width="85%">
</p>

---

# Serving in Snowflake Dashboard

<p align="center">
  <img src=".github/assets/Snow_dash.png"
       alt="Snowflake_dashboard.png"
       width="85%">
</p

  ---
  
# Key Commands

- `dbt run`      # Run all models
- `dbt test`         # Run data tests
- `dbt docs generate `        # Generate documentation
- `dbt docs serve`        # View documentation
  

---

# Results
Automated pipeline that syncs Google Calendar data, transforms it into analytics-ready models, and maintains data quality through automated testing.

<p align="center">
  <img src=".github/assets/github_history.png"
       alt="github_history"
       width="85%">
</p>

---

🔗[Back to Main Project](/README.md)
