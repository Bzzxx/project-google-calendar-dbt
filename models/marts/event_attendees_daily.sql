{{ config(materialized='table') }}

with events as (
    select
        event_id,
        event_title,
        event_start_at
    from {{ ref('stg_events') }}
),

attendees as (
    select
        event_id,
        attendee_email,
        attendee_status
    from {{ ref('stg_attendee') }}
)

select
    e.event_id,
    e.event_title,
    date_trunc('day', e.event_start_at) as event_date,
    count(distinct a.attendee_email)    as attendees_count
from events e
left join attendees a
    on a.event_id = e.event_id
group by 1, 2, 3
order by event_date, event_title
