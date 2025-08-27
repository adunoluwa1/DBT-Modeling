WITH product_base AS (
    SELECT 
        id AS product_id,
        product_name AS product_name,
        category AS product_category,
        department AS product_department
    FROM {{ ref('stg_ecommerce__products') }}
)

, inventory_items AS (
    SELECT 
        product_id,
        SUM(CASE WHEN sold_at IS NOT NULL THEN cost_price END) AS cost_of_goods_sold
    FROM {{ ref('stg_ecommerce__inventory_items') }}
    GROUP BY 1
)

, order_items AS (
    SELECT 
        product_id,
        SUM(sale_price) AS sales_amount
    FROM {{ ref('stg_ecommerce__order_items') }}
    GROUP BY 1    
)

SELECT 
    pb.product_id,

    pb.product_name,
    pb.product_category,

    oi.sales_amount,
    {{ coalesce_and_round('ii.cost_of_goods_sold', 2) }},
    {{ coalesce_and_round('oi.sales_amount', 2) }} - {{ coalesce_and_round('ii.cost_of_goods_sold', 2) }} AS profit

FROM product_base pb 
LEFT JOIN inventory_items ii 
    ON pb.product_id = ii.product_id 
LEFT JOIN order_items oi 
    ON pb.product_id = oi.product_id