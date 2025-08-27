{% snapshot order_snapshot%}

{{config(
    target_schema='main',
    unique_key='order_id',
    strategy='timestamp',
    updated_at='created_at'
)}}

select * 
from {{source('main','orders')}}

{% endsnapshot %}