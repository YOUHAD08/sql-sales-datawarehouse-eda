
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

/* ********  Customers *********** */

-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country

-- Retrieve distinct gender values
SELECT DISTINCT 
    gender 
FROM gold.dim_customers
ORDER BY gender 

-- Retrieve distinct marital status values
SELECT DISTINCT 
    marital_status 
FROM gold.dim_customers
ORDER BY marital_status 

/* ********  Products *********** */

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;

-- Retrieve distinct product lines
SELECT DISTINCT 
    product_line 
FROM gold.dim_products
ORDER BY product_line;

-- Retrieve distinct maintenance values
SELECT DISTINCT 
    maintenance 
FROM gold.dim_products
ORDER BY maintenance;