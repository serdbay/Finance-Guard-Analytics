with source as (
    select * from {{ ref('raw_accounts') }}
),

staged as (
    select
        account_id,
        customer_id,
        lower(trim(account_type))            as account_type,
        cast(balance as decimal(18,2))       as balance,
        lower(trim(status))                  as status
    from source
    where account_id is not null
)

select * from staged