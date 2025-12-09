{{ config(materialized='table') }}

with base as (
    select
        EVENT_ID,
        EVENT_TITLE,
        EVENT_START_AT,
        EVENT_END_AT,
        ATTENDEE_EMAIL,
        ATTENDEE_STATUS,
        IS_ORGANIZER,
        IS_OPTIONAL
    from {{ ref('int_events_with_attendees') }}
    where ATTENDEE_EMAIL is not null
)

select
    ATTENDEE_EMAIL,

    count(distinct EVENT_ID) as events_total,

    count(distinct case when ATTENDEE_STATUS = 'accepted' then EVENT_ID end) as events_accepted,
    count(distinct case when ATTENDEE_STATUS = 'declined' then EVENT_ID end) as events_declined,
    count(distinct case when ATTENDEE_STATUS = 'tentative' then EVENT_ID end) as events_tentative,

    max(case when IS_ORGANIZER then 1 else 0 end) as is_ever_organizer,

    count(distinct case when IS_OPTIONAL then EVENT_ID end) as events_optional

from base
group by ATTENDEE_EMAIL