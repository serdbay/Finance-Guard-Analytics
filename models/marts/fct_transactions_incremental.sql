{{
    config(
        materialized='incremental',
        unique_key='transaction_id'
    )
}}

with stg as (
    select * from {{ ref('stg_transactions') }}

    {% if is_incremental() %}
        where transaction_date > (
            select max(transaction_date) 
            from {{ this }}
        )
    {% endif %}
)

select * from stg