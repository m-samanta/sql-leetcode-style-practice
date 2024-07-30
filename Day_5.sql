-- Day 5: SQL Practice Problem
-- Table: Transactions
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | transaction_id | int      |
-- | customer_id    | int      |
-- | transaction_date | date    |
-- | amount         | decimal  |
-- +----------------+----------+
-- 
-- In SQL, transaction_id is the primary key for this table.
-- This table contains information about customer transactions, including the date and the amount of each transaction.
-- 
-- Problem:
-- Find the customer(s) who made the highest total transaction amount within a single month.
-- 
-- Return the result table with columns customer_id and total_amount, ordered by customer_id in ascending order.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- Transactions table:
-- +----------------+-------------+----------------+--------+
-- | transaction_id | customer_id | transaction_date | amount |
-- +----------------+-------------+----------------+--------+
-- | 1              | 101         | 2023-01-10      | 300    |
-- | 2              | 102         | 2023-01-15      | 200    |
-- | 3              | 101         | 2023-01-20      | 400    |
-- | 4              | 103         | 2023-02-05      | 500    |
-- | 5              | 104         | 2023-02-10      | 700    |
-- | 6              | 103         | 2023-02-15      | 300    |
-- | 7              | 102         | 2023-02-20      | 800    |
-- | 8              | 101         | 2023-02-25      | 600    |
-- +----------------+-------------+----------------+--------+
-- 
-- Output:
-- +-------------+-------------+
-- | customer_id | total_amount|
-- +-------------+-------------+
-- | 101         | 700         |
-- +-------------+-------------+
-- 
-- Explanation:
-- 
-- In January 2023, customer 101 made transactions totaling $300 + $400 = $700.
-- Customer 101's total transaction amount of $700 in January 2023 is the highest among all customers in any single month.


--Solution

WITH MonthlyTransactions AS (
    SELECT 
        customer_id,
        DATE_FORMAT(transaction_date, '%Y-%m') AS month,
        SUM(amount) AS total_amount
    FROM 
        Transactions
    GROUP BY 
        customer_id, 
        DATE_FORMAT(transaction_date, '%Y-%m')
),
MaxMonthlyTransaction AS (
    SELECT 
        MAX(total_amount) AS max_total_amount
    FROM 
        MonthlyTransactions
)
SELECT 
    mt.customer_id, 
    mt.total_amount
FROM 
    MonthlyTransactions mt
JOIN 
    MaxMonthlyTransaction mmt
ON 
    mt.total_amount = mmt.max_total_amount
ORDER BY 
    mt.customer_id;
