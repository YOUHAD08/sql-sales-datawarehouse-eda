USE DataWarehouse
GO

/*---------------------------------------------------------------------------
1) Base Query: Retrieves core columns from tables
---------------------------------------------------------------------------*/
WITH base_query AS (
SELECT
f.order_number,
f.product_key,
f.order_date,
f.sales_amount,
f.quantity,
c.customer_key,
c.customer_number,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
DATEDIFF(year, c.birthday, GETDATE()) age
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
WHERE order_date IS NOT NULL
),

/*---------------------------------------------------------------------------
2) Customer Aggregations: Summarizes key metrics at the customer level
---------------------------------------------------------------------------*/
customer_aggregation AS (
    SELECT 
        customer_key,
        customer_number,
        customer_name,
        age,
        COUNT(DISTINCT order_number) AS total_orders,
        SUM(sales_amount) AS total_sales,
        SUM(quantity) AS total_quantity,
        COUNT(DISTINCT product_key) AS total_products,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS last_order_date,
        DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
    FROM base_query
    GROUP BY 
        customer_key,
        customer_number,
        customer_name,
        age
)
SELECT
    customer_key,
    customer_number,
    customer_name,
    age,
    CASE 
        WHEN age < 20 THEN 'Gen Z (Under 20)'
        WHEN age BETWEEN 20 AND 29 THEN 'Young Adult (20-29)'
        WHEN age BETWEEN 30 AND 39 THEN 'Millennial (30-39)'
        WHEN age BETWEEN 40 AND 49 THEN 'Gen X (40-49)'
        WHEN age BETWEEN 50 AND 59 THEN 'Boomer (50-59)'
        ELSE 'Senior (60+)'
    END AS age_group,
    CASE 
        WHEN lifespan >= 12 AND total_sales > 5000 THEN 'VIP'
        WHEN lifespan >= 12 AND total_sales <= 5000 THEN 'Regular'
        ELSE 'New Customer'
    END AS customer_segment,
    first_order_date,
    last_order_date,
    DATEDIFF(MONTH, last_order_date, GETDATE()) AS recency_months,
    total_orders,
    total_sales,
    total_quantity,
    total_products,
    lifespan AS lifespan_months,
    -- Compute average order value (AOV)
    CASE 
        WHEN total_orders = 0 THEN 0
        ELSE ROUND(total_sales / total_orders, 2)
    END AS avg_order_value,
    -- Compute average monthly spend
    CASE 
        WHEN lifespan = 0 THEN total_sales
        ELSE ROUND(total_sales / lifespan, 2)
    END AS avg_monthly_spend
FROM customer_aggregation
ORDER BY total_sales DESC;