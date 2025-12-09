{{ config(materialized='view') }}

select
    EVENT_ID        as event_id,
    EMAIL           as attendee_email,
    RESPONSE_STATUS as attendee_status,
    ORGANIZER       as is_organizer,
    OPTIONAL        as is_optional
from {{ source('google_calendar', 'ATTENDEE') }}
