with stg as (
    select * from {{ ref('stg_transactions') }}
),

final as (
    select
        customer_name,
        count(transaction_id)                    as total_transactions,
        sum(amount)                              as total_amount,
        avg(amount)                              as avg_amount,
        sum(case when status = 'completed' 
                 then 1 else 0 end)              as completed_count
    from stg
    group by customer_name
)

select * from final