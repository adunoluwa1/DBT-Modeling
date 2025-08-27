{%- set order_statuses = ['Shipped','Complete','Processing','Cancelled','Returned'] -%}

SELECT 
    user_id,
    COUNT(DISTINCT order_id) AS num_orders,
    {#- Jinja loop to pivot out order_statuses -#}
    {%- for order_status in order_statuses %}
    COUNT(DISTINCT CASE WHEN status = '{{order_status}}' THEN order_id END) AS num_orders_{{order_status}}
    {%- if not loop.last -%}
        ,
    {%- endif -%}
    {%- endfor %}
FROM {{ref('stg_ecommerce__orders')}}
GROUP BY 1
      