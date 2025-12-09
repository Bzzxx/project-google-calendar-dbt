{{ config(materialized='view') }}

select
    ID          as event_id,
    SUMMARY     as event_title,
    DESCRIPTION as event_description,
    START_DATE  as event_start_at,
    END_DATE   as event_end_at,
    STATUS      as event_status,
    CREATED     as created_at,
    UPDATED     as updated_at
from {{ source('google_calendar', 'EVENT') }}

