{{ config(materialized='table') }}

with base as (
    select
        EVENT_ID,
        EVENT_TITLE,
        EVENT_START_AT,
        EVENT_END_AT,
        ATTENDEE_EMAIL
    from {{ ref('int_events_with_attendees') }}
    where
        EVENT_START_AT <= current_date()
        and EVENT_START_AT >= to_date('2024-01-01')
),

daily as (
    select
        EVENT_START_AT                         as activity_day,
        count(distinct EVENT_ID)               as events_per_day,
        count(distinct ATTENDEE_EMAIL)         as attendees_per_day
    from base
    group by EVENT_START_AT
),

weekly as (
    select
        date_trunc('week', EVENT_START_AT)     as week_start,
        count(distinct EVENT_ID)               as events_per_week,
        count(distinct ATTENDEE_EMAIL)         as attendees_per_week
    from base
    group by date_trunc('week', EVENT_START_AT)
)

select
    d.activity_day,
    w.week_start,
    d.events_per_day,
    d.attendees_per_day,
    w.events_per_week,
    w.attendees_per_week
from daily d
left join weekly w
    on w.week_start = date_trunc('week', d.activity_day)
order by d.activity_day
