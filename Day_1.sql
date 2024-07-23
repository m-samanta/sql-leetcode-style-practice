-- Day 1: SQL Practice Problem
-- Table: Sales
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | SaleID      | int      |
-- | ProductID   | int      |
-- | SaleDate    | date     |
-- | SaleAmount  | decimal  |
-- | CustomerID  | int      |
-- +-------------+----------+
-- 
-- In SQL, SaleID is the primary key for this table.
-- This table contains information about sales transactions, including the product sold, the date of the sale, the amount of the sale, and the customer who made the purchase.
-- 
-- Problem:
-- Find the IDs of the customers who have made purchases totaling more than $500 within a single day.
-- 
-- Return the result table ordered by CustomerID.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- Sales table:
-- +--------+-----------+------------+------------+------------+
-- | SaleID | ProductID | SaleDate   | SaleAmount | CustomerID |
-- +--------+-----------+------------+------------+------------+
-- | 1      | 101       | 2023-01-01 | 500.00     | 1001       |
-- | 2      | 102       | 2023-01-01 | 150.00     | 1002       |
-- | 3      | 103       | 2023-01-02 | 200.00     | 1003       |
-- | 4      | 101       | 2023-01-02 | 250.00     | 1001       |
-- | 5      | 104       | 2023-01-03 | 100.00     | 1004       |
-- | 6      | 102       | 2023-01-03 | 300.00     | 1005       |
-- | 7      | 103       | 2023-01-04 | 450.00     | 1002       |
-- | 8      | 101       | 2023-01-04 | 700.00     | 1003       |
-- | 9      | 104       | 2023-01-05 | 120.00     | 1004       |
-- | 10     | 102       | 2023-01-05 | 330.00     | 1001       |
-- +--------+-----------+------------+------------+------------+
-- 
-- Output:
-- +------------+
-- | CustomerID |
-- +------------+
-- | 1001       |
-- | 1003       |
-- +------------+
-- 
-- Explanation:
-- 
-- Customer 1001 made purchases totaling $500 on 2023-01-01 and $580 on 2023-01-05.
-- Customer 1003 made purchases totaling $700 on 2023-01-04.


-- Solution

SELECT DISTINCT CustomerID
FROM (
    SELECT CustomerID, SaleDate, SUM(SaleAmount) AS TotalAmount
    FROM Sales
    GROUP BY CustomerID, SaleDate
) AS DailySales
WHERE TotalAmount > 500
ORDER BY CustomerID;