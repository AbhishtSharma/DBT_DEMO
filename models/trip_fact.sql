with trips as(
select 
ride_id,
rideable_type,
date(to_timestamp(Started_at)) as trip_date,
start_station_id,
end_station_id,
member_casual,
timestampdiff(minutes,to_timestamp(Started_at), to_timestamp(ended_at)) as trip_duration_minutes
from {{ source('demo', 'bike') }}
where ride_id != 'ride_id'
limit 10
)

select * from trips