USE DataWarehouse
GO
/*
===============================================================================
Category Sales Distribution Analysis
===============================================================================
Purpose:
    - Calculate total sales contribution by product category
    - Determine each category's percentage share of overall sales
    - Identify dominant and underperforming categories
    - Support category management and resource allocation decisions

SQL Functions Used:
    - CTEs (Common Table Expressions)
    - Window Functions: SUM() OVER()
    - CAST(), ROUND(), CONCAT()
    - Percentage calculations
    - LEFT JOIN, GROUP BY

Metrics Analyzed:
    - Total sales per category
    - Overall company sales
    - Category contribution percentage

Tables Used:
    - gold.fact_sales
    - gold.dim_products
===============================================================================
*/

WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    CONCAT(ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2),' %') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC