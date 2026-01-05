USE DataWarehouse
/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To identify top and bottom performers across multiple business dimensions
    - To rank products, customers, countries, and categories by key metrics
    - To compare ranking approaches: TOP clause vs Window Functions
    - To support strategic decision-making through performance insights

SQL Functions Used:
    - TOP
    - DENSE_RANK() OVER()
    - COUNT / SUM
    - GROUP BY
    - LEFT JOIN
    - Subqueries

Metrics Analyzed:
    - Revenue (total sales amount)
    - Quantity sold
    - Order frequency

Tables Used:
    - gold.fact_sales
    - gold.dim_products
    - gold.dim_customers
===============================================================================
*/

-- Top 5 Products Generating the Highest Revenue
SELECT TOP 5
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Ranking Using Window Functions

SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        DENSE_RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.product_name
) AS ranked_products
WHERE rank_products <= 5;

-- Top 5 Worst-Performing Products in Terms of Sales

SELECT TOP (5)
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-- Top 5 Countries by Total Revenue
SELECT TOP 5
    c.country,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_revenue DESC;

-- Bottom 5 Countries by Total Revenue
SELECT TOP 5
    c.country,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_revenue;

-- Top 5 Customers by Total Revenue
SELECT TOP 5
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue DESC;

-- Bottom 5 Customers by Total Revenue
SELECT TOP 5
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue;

-- Top 5 Categories by Total Revenue
SELECT TOP 5
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Bottom 5 Categories by Total Revenue
SELECT TOP 5
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue;

-- Top 5 Countries by Quantity Sold
SELECT TOP 5
    c.country,
    SUM(f.quantity) AS total_quantity
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_quantity DESC;

-- Bottom 5 Countries by Quantity Sold
SELECT TOP 5
    c.country,
    SUM(f.quantity) AS total_quantity
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_quantity;

-- Top 5 Customers by Number of Orders
SELECT TOP 5
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders DESC;

-- Bottom 5 Customers by Number of Orders (Active Customers Only)
SELECT TOP 5
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders;