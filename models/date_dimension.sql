WITH CTE as
(
    select TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)),
    HOUR(TO_TIMESTAMP(STARTED_AT)),
    DAYOFWEEK(TO_TIMESTAMP(STARTED_AT)),
    DAYNAME(TO_TIMESTAMP(STARTED_AT)),
    
    {{ day_type('STARTED_AT') }} as Day_Type,

    {{ seasons('STARTED_AT')}} as season

    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select * from CTE