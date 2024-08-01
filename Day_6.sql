-- Day 6: SQL Practice Problem
-- Table: Employees
-- +-------------+----------+
-- | Column Name | Type |
-- +-------------+----------+
-- | employee_id | int |
-- | name | varchar |
-- | department | varchar |
-- | salary | int |
-- +-------------+----------+
-- 
-- In SQL, employee_id is the primary key for this table.
-- This table contains information about employees, including their department and salary.
-- 
-- Problem:
-- Find the second highest salary for each department.
-- 
-- Return the result table with columns department and second_highest_salary, ordered by department in ascending order.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- Employees table:
-- +-------------+-----------+-------------+--------+
-- | employee_id | name | department | salary |
-- +-------------+-----------+-------------+--------+
-- | 1 | John | Engineering | 70000 |
-- | 2 | Jane | HR | 80000 |
-- | 3 | Doe | Engineering | 75000 |
-- | 4 | Alice | HR | 90000 |
-- | 5 | Bob | Sales | 85000 |
-- | 6 | Charlie | Sales | 95000 |
-- +-------------+-----------+-------------+--------+
-- 
-- Output:
-- +-------------+--------------------+
-- | department | second_highest_salary |
-- +-------------+--------------------+
-- | Engineering | 70000 |
-- | HR | 80000 |
-- | Sales | 85000 |
-- +-------------+--------------------+
-- 
-- Explanation:
-- 
-- In the Engineering department, the second highest salary is 70,000.
-- In the HR department, the second highest salary is 80,000.
-- In the Sales department, the second highest salary is 85,000.


-- Solution

WITH RankedSalaries AS (
    SELECT
        department,
        salary,
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
    FROM Employees
)
SELECT
    department,
    salary AS second_highest_salary
FROM RankedSalaries
WHERE rank = 2
ORDER BY department;
