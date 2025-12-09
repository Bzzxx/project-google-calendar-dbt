{{ config(materialized='table') }}

with base as (
    select
        EVENT_ID,
        EVENT_TITLE,
        EVENT_DESCRIPTION,
        EVENT_START_AT,
        EVENT_END_AT,
        EVENT_STATUS,
        CREATED_AT,
        UPDATED_AT,
        ATTENDEE_EMAIL,
        ATTENDEE_STATUS,
        IS_ORGANIZER,
        IS_OPTIONAL
    from {{ ref('int_events_with_attendees') }}
    where EVENT_START_AT is not null
)

select
    EVENT_ID,
    EVENT_TITLE,
    EVENT_DESCRIPTION,
    EVENT_START_AT,
    EVENT_END_AT,
    EVENT_STATUS,
    CREATED_AT,
    UPDATED_AT,

    count(distinct ATTENDEE_EMAIL) as total_attendees,

    count(distinct case when ATTENDEE_STATUS = 'accepted' then ATTENDEE_EMAIL end) as accepted_attendees,
    count(distinct case when ATTENDEE_STATUS = 'declined' then ATTENDEE_EMAIL end) as declined_attendees,
    count(distinct case when ATTENDEE_STATUS = 'tentative' then ATTENDEE_EMAIL end) as tentative_attendees,

    count(distinct case when IS_ORGANIZER then ATTENDEE_EMAIL end) as organizers_count,

    count(distinct case when IS_OPTIONAL then ATTENDEE_EMAIL end) as optional_attendees

from base
group by
    EVENT_ID,
    EVENT_TITLE,
    EVENT_DESCRIPTION,
    EVENT_START_AT,
    EVENT_END_AT,
    EVENT_STATUS,
    CREATED_AT,
    UPDATED_AT

