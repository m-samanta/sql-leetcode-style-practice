-- Day 7: SQL Practice Problem
-- Table: Sales
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
-- This table contains information about product sales, including the date of the sale and the quantity sold.
-- 
-- Problem:
-- Find the month and year in which the highest number of products were sold.
-- 
-- Return the result table with columns month_year and total_quantity, ordered by month_year in ascending order.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- Sales table:
-- +---------+------------+------------+----------+
-- | sale_id | product_id | sale_date  | quantity |
-- +---------+------------+------------+----------+
-- | 1       | 101        | 2023-01-10 | 300      |
-- | 2       | 102        | 2023-01-15 | 200      |
-- | 3       | 101        | 2023-02-20 | 400      |
-- | 4       | 103        | 2023-02-05 | 500      |
-- | 5       | 104        | 2023-03-10 | 700      |
-- | 6       | 102        | 2023-03-15 | 800      |
-- +---------+------------+------------+----------+
-- 
-- Output:
-- +------------+---------------+
-- | month_year | total_quantity|
-- +------------+---------------+
-- | 2023-03    | 1500          |
-- +------------+---------------+
-- 
-- Explanation:
-- 
-- In January 2023, the total quantity sold is 300 + 200 = 500.
-- In February 2023, the total quantity sold is 400 + 500 = 900.
-- In March 2023, the total quantity sold is 700 + 800 = 1500.
-- The highest total quantity sold is 1500 in March 2023.


--Solution

WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(sale_date, '%Y-%m') AS month_year,
        SUM(quantity) AS total_quantity
    FROM 
        Sales
    GROUP BY 
        DATE_FORMAT(sale_date, '%Y-%m')
),
MaxMonthlySales AS (
    SELECT 
        MAX(total_quantity) AS max_quantity
    FROM 
        MonthlySales
)
SELECT 
    ms.month_year, 
    ms.total_quantity
FROM 
    MonthlySales ms
JOIN 
    MaxMonthlySales mms
ON 
    ms.total_quantity = mms.max_quantity
ORDER BY 
    ms.month_year;
