-- Day 3: SQL Practice Problem
-- Table: Orders
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | order_id    | int      |
-- | order_date  | date     |
-- | product_id  | int      |
-- | quantity    | int      |
-- | customer_id | int      |
-- +-------------+----------+
--
-- In SQL, order_id is the primary key for this table.
-- This table contains information about customer orders, including the date of the order, the product ordered, the quantity, and the customer who placed the order.
--
-- Problem:
-- Find the products that were never ordered by any customer.
--
-- Return the result table with a single column product_id, ordered by product_id in ascending order.
--
-- The result format is in the following example.
--
-- Example:
-- Input:
-- Orders table:
-- +----------+------------+------------+----------+-------------+
-- | order_id | order_date | product_id | quantity | customer_id |
-- +----------+------------+------------+----------+-------------+
-- | 1        | 2023-01-01 | 101        | 5        | 1001        |
-- | 2        | 2023-01-01 | 102        | 3        | 1002        |
-- | 3        | 2023-01-02 | 103        | 2        | 1003        |
-- | 4        | 2023-01-02 | 104        | 4        | 1001        |
-- | 5        | 2023-01-03 | 105        | 1        | 1004        |
-- | 6        | 2023-01-03 | 102        | 7        | 1005        |
-- +----------+------------+------------+----------+-------------+
--
-- Products table:
-- +------------+-------------+
-- | product_id | product_name|
-- +------------+-------------+
-- | 101        | Product A   |
-- | 102        | Product B   |
-- | 103        | Product C   |
-- | 104        | Product D   |
-- | 105        | Product E   |
-- | 106        | Product F   |
-- +------------+-------------+
--
-- Output:
-- +------------+
-- | product_id |
-- +------------+
-- | 106        |
-- +------------+
--
-- Explanation:
--
-- Product 106 was never ordered by any customer.


-- Solution

SELECT product_id
FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM Orders
)
ORDER BY product_id;
