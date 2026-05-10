with customers as (
    select * from {{ ref('stg_customers') }}
),

accounts as (
    select * from {{ ref('stg_accounts') }}
),

transactions as (
    select * from {{ ref('stg_transactions') }}
),

final as (
    select
        c.customer_id,
        c.customer_name,
        c.city,
        c.risk_score,
        a.account_type,
        a.balance,
        a.status                              as account_status,
        count(t.transaction_id)               as total_transactions,
        sum(t.amount)                         as total_amount,
        case
            when c.risk_score >= 75 then 'HIGH'
            when c.risk_score >= 50 then 'MEDIUM'
            else 'LOW'
        end                                   as risk_level
    from customers c
    left join accounts a on c.customer_id = a.customer_id
    left join transactions t on c.customer_id = t.transaction_id
    group by c.customer_id, c.customer_name, c.city, 
             c.risk_score, a.account_type, a.balance, a.status
)

select * from final