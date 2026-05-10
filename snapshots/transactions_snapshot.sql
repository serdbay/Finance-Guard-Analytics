{% snapshot transactions_snapshot %}

{{
    config(
        target_schema='dbo',
        unique_key='transaction_id',
        strategy='check',
        check_cols=['status']
    )
}}

select * from {{ ref('stg_transactions') }}

{% endsnapshot %}