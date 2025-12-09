{{ config(materialized='table') }}

select
    date_trunc('day', event_start_at) as event_date,
    count(*)                          as events_count
from {{ ref('stg_events') }}
where event_start_at is not null
group by 1
order by 1
