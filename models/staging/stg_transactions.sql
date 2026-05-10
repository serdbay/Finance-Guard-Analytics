with source as (
    select * from {{ ref('raw_transactions') }}
),

staged as (
    select
        transaction_id,
        {{ clean_string('customer_name') }}        as customer_name,
        cast(amount as decimal(18,2))     as amount,
        cast(transaction_date as date)    as transaction_date,
        lower(trim(status))               as status
    from source
    where transaction_id is not null and amount is not null
)

select * from staged