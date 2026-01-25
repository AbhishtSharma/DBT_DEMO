WITH CTE as
(
    select TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)),
    HOUR(TO_TIMESTAMP(STARTED_AT)),
    DAYOFWEEK(TO_TIMESTAMP(STARTED_AT)),
    DAYNAME(TO_TIMESTAMP(STARTED_AT)),
    case 
    when DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sun','Sat')
    then 'Weekend'
    else 'Business Day'
    END as Day_Type,

    case
    when month(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
    then 'Winter'
    when month(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
    then 'Spring'
    when month(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
    then 'Summer'
    else 'Autum'
    END as Season

    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)

select * from CTE