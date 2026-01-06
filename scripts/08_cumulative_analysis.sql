/*
===============================================================================
Advanced Time-Series Analysis with Window Functions
===============================================================================
Purpose:
    - Track cumulative sales performance and pricing trends over time
    - Calculate running totals and moving averages for business intelligence
    - Support financial reporting and forecasting initiatives

SQL Functions Used:
    - DATETRUNC(), SUM(), AVG()
    - Window Functions: SUM() OVER(), AVG() OVER()
    - Subqueries with GROUP BY

Metrics Analyzed:
    - Monthly total sales
    - Running total sales (cumulative)
    - Moving average price

Tables Used:
    - gold.fact_sales
===============================================================================
*/

SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
	AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT 
        DATETRUNC(month, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(month, order_date)
) t
