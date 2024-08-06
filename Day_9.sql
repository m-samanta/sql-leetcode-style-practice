-- Day 9: SQL Practice Problem
-- Table: ProductSales
-- +-------------+----------+
-- | Column Name | Type |
-- +-------------+----------+
-- | sale_id     | int  |
-- | product_id  | int  |
-- | sale_date   | date |
-- | quantity    | int  |
-- +-------------+----------+
-- 
-- In SQL, sale_id is the primary key for this table.
-- This table contains information about product sales, including the date of sale and the quantity sold.
-- 
-- Problem:
-- Find the product with the highest quantity sold in a single day.
-- 
-- Return the result table with columns product_id, sale_date, and max_quantity, ordered by max_quantity in descending order.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- ProductSales table:
-- +---------+------------+------------+----------+
-- | sale_id | product_id | sale_date | quantity |
-- +---------+------------+------------+----------+
-- | 1       | 201        | 2023-01-10 | 100      |
-- | 2       | 202        | 2023-01-10 | 200      |
-- | 3       | 201        | 2023-01-11 | 150      |
-- | 4       | 203        | 2023-01-11 | 250      |
-- | 5       | 202        | 2023-01-12 | 300      |
-- | 6       | 201        | 2023-01-12 | 200      |
-- +---------+------------+------------+----------+
-- 
-- Output:
-- +------------+------------+--------------+
-- | product_id | sale_date  | max_quantity |
-- +------------+------------+--------------+
-- | 202        | 2023-01-12 | 300          |
-- | 203        | 2023-01-11 | 250          |
-- | 201        | 2023-01-12 | 200          |
-- +------------+------------+--------------+
-- 
-- Explanation:
-- 
-- Product 202 had the highest quantity sold of 300 on 2023-01-12.
-- Product 203 had the highest quantity sold of 250 on 2023-01-11.
-- Product 201 had the highest quantity sold of 200 on 2023-01-12.


--Solution

WITH DailyQuantities AS (
    SELECT 
        product_id,
        sale_date,
        MAX(quantity) AS max_quantity
    FROM 
        ProductSales
    GROUP BY 
        product_id, 
        sale_date
)
SELECT 
    product_id,
    sale_date,
    max_quantity
FROM 
    DailyQuantities
ORDER BY 
    max_quantity DESC;
