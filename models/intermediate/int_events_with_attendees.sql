{{ config(materialized='view') }}

with events as (
    select
        EVENT_ID,
        EVENT_TITLE,
        EVENT_DESCRIPTION,
        EVENT_START_AT,
        EVENT_END_AT,
        EVENT_STATUS,
        CREATED_AT,
        UPDATED_AT
    from {{ ref('stg_events') }}
),

attendees as (
    select
        EVENT_ID,
        ATTENDEE_EMAIL,
        ATTENDEE_STATUS,
        IS_ORGANIZER,
        IS_OPTIONAL
    from {{ ref('stg_attendee') }}
)

select
    e.EVENT_ID,
    e.EVENT_TITLE,
    e.EVENT_DESCRIPTION,
    e.EVENT_START_AT,
    e.EVENT_END_AT,
    e.EVENT_STATUS,
    e.CREATED_AT,
    e.UPDATED_AT,
    a.ATTENDEE_EMAIL,
    a.ATTENDEE_STATUS,
    a.IS_ORGANIZER,
    a.IS_OPTIONAL
from events e
left join attendees a
    on a.EVENT_ID = e.EVENT_ID

