WITH sales AS (
    select
        sales_id,
        product_sk,
        customer_sk,
        gross_amount,
        payment_method
    from {{ ref('bronze_sales') }}
), products AS (
    select
        product_sk,
        product_name,
        category
    from {{ ref('bronze_product') }}
), customers AS (
    select
        customer_sk,
        gender
    from {{ ref('bronze_customer') }}
), joined_query AS (
    SELECT
        sales.sales_id,
        sales.gross_amount,
        sales.payment_method,
        products.product_name,
        products.category,
        customers.gender
    FROM sales
    JOIN products ON sales.product_sk = products.product_sk
    JOIN customers ON sales.customer_sk = customers.customer_sk
)

SELECT
    category,
    gender,
    SUM(gross_amount) AS total_sales
FROM joined_query
GROUP BY
    category,
    gender
ORDER BY
    total_sales DESC