Use DataWarehouse
/*
===============================================================================
Time-Series Sales Analysis
===============================================================================
Purpose:
    - To analyze sales performance trends over time
    - To aggregate business metrics at different temporal granularities
    - To identify yearly, monthly, and time-period patterns in sales data
    - To support trend analysis and forecasting initiatives

SQL Functions Used:
    - YEAR()
    - MONTH()
    - DATETRUNC()
    - SUM()
    - GROUP BY
    - WHERE (null filtering)
    - ORDER BY

Metrics Analyzed:
    - Total sales revenue (sales_amount)
    - Total quantity sold
    - Customer engagement (customer_key sum)

Temporal Granularities:
    - Yearly aggregation
    - Monthly aggregation (by month number)
    - Monthly time-series (by full date)

Tables Used:
    - gold.fact_sales

Notes:
    - Filters out null dates to ensure data quality
    - Uses DATETRUNC for precise monthly time-series analysis
    - Enables comparison across different time periods
===============================================================================
*/

-- Analyse sales performance over time
-- Quick Date Functions
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

-- DATETRUNC()
SELECT
    DATETRUNC(month, order_date) AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date);

-- FORMAT()
SELECT
    FORMAT(order_date, 'yyyy-MMM') AS order_date,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');