{% macro seasons(STARTED_AT) %}
case
    when month(TO_TIMESTAMP({{STARTED_AT}})) in (12,1,2)
    then 'Winter'
    when month(TO_TIMESTAMP({{STARTED_AT}})) in (3,4,5)
    then 'Spring'
    when month(TO_TIMESTAMP({{STARTED_AT}})) in (6,7,8)
    then 'Summer'
    else 'Autum'
    END
{% endmacro %}

{% macro day_type(STARTED_AT) %}
case 
    when DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sun','Sat')
    then 'Weekend'
    else 'Business Day'
    END
{% endmacro %}