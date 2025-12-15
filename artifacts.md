# 📂 Project Artifacts

# 1. Data Generation

- Registered Fivetran account and connected Snowflake as destination

---

# 2. Storage

- Created Snowflake account with user, role, and warehouse
- Granted necessary access permissions

<p align="center">
  <img src=".github/assets/Fiv_con.png"
       alt="Fivetran_connection"
       width="85%">
</p>


---

# 3. Ingestion

- Configured Google Calendar connector in Fivetran
- Established automated sync to Snowflake (every 6 hours)


---

# 4. Transformation

- Installed dbt Core and initialized project
- Configured Snowflake connection in profiles.yml
- Created three-layer dbt architecture:

- **Staging: Raw source data models
- **Intermediate: Business logic transformations
- **Marts: Final analytical models

---

Implemented data quality tests with dbt test
Generated documentation and lineage graphs


---

# Project Structure

```text
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
├── tests/
└── dbt_project.yml
```

---

# Key Commands

- `dbt run`      # Run all models
- `dbt test`         # Run data tests
- `dbt docs generate `        # Generate documentation
- `dbt docs serve`        # View documentation
  

---

# Results
Automated pipeline that syncs Google Calendar data, transforms it into analytics-ready models, and maintains data quality through automated testing.

---

🔗 Back to Main Project
