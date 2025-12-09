{{ config(materialized='view') }}

select
    *
from {{ source('google_calendar', 'CALENDAR_LIST') }}
