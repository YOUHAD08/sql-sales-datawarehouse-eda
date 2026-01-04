-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT 
    country 
FROM gold.dim_customers

-- Retrieve distinct gender values
SELECT DISTINCT 
    gender 
FROM gold.dim_customers

-- Retrieve distinct marital status values
SELECT DISTINCT 
    marital_status 
FROM gold.dim_customers