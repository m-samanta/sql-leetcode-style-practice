-- Day 8: SQL Practice Problem
-- Table: CustomerOrders
-- +-------------+----------+
-- | Column Name | Type |
-- +-------------+----------+
-- | order_id | int |
-- | customer_id | int |
-- | order_date | date |
-- | amount | decimal |
-- +-------------+----------+
-- 
-- In SQL, order_id is the primary key for this table.
-- This table contains information about customer orders, including the date of the order and the amount spent.
-- 
-- Problem:
-- Find the customers who made more than one order in a single month.
-- 
-- Return the result table with columns customer_id and month_year, ordered by customer_id and month_year in ascending order.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- CustomerOrders table:
-- +----------+-------------+------------+--------+
-- | order_id | customer_id | order_date | amount |
-- +----------+-------------+------------+--------+
-- | 1 | 101 | 2023-01-10 | 300 |
-- | 2 | 102 | 2023-01-15 | 200 |
-- | 3 | 101 | 2023-01-20 | 150 |
-- | 4 | 103 | 2023-02-05 | 500 |
-- | 5 | 101 | 2023-02-10 | 250 |
-- | 6 | 102 | 2023-02-15 | 300 |
-- | 7 | 102 | 2023-02-20 | 200 |
-- +----------+-------------+------------+--------+
-- 
-- Output:
-- +-------------+------------+
-- | customer_id | month_year |
-- +-------------+------------+
-- | 101 | 2023-01 |
-- | 102 | 2023-02 |
-- +-------------+------------+
-- 
-- Explanation:
-- 
-- Customer 101 made two orders in January 2023.
-- Customer 102 made two orders in February 2023.


-- Solution

WITH MonthlyOrders AS (
    SELECT 
        customer_id,
        DATE_FORMAT(order_date, '%Y-%m') AS month_year,
        COUNT(order_id) AS order_count
    FROM 
        CustomerOrders
    GROUP BY 
        customer_id, 
        DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    customer_id, 
    month_year
FROM 
    MonthlyOrders
WHERE 
    order_count > 1
ORDER BY 
    customer_id, 
    month_year;
