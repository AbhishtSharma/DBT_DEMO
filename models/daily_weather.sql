with daily_weather as (

    select 
    date(time) as weather_time,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather') }}
    limit 10
),

daily_weather_agg as (
select 
    weather_time,
    weather,
    round(avg(pressure),2) as avg_pressure,
    avg(humidity),
    count(weather) as weather_occurance,
    ROW_NUMBER() OVER(partition by weather_time order by weather_occurance desc) as ROW_NUMBER

    from daily_weather
    group by weather_time, weather 
    qualify ROW_NUMBER() OVER(partition by weather_time order by weather_occurance desc) = 1
)

select * from daily_weather_agg