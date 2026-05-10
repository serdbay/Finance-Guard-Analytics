with source as (
    select * from {{ ref('raw_customers') }}
),

staged as (
    select
        customer_id,
        {{ clean_string('customer_name') }}  as customer_name,
        lower(trim(email))                   as email,
        {{ clean_string('city') }}           as city,
        cast(risk_score as int)              as risk_score
    from source
    where customer_id is not null
)

select * from staged