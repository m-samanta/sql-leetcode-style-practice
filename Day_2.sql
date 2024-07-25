-- Day 2: SQL Practice Problem
-- Table: EmployeeSalaries
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | salary_date | date     |
-- | salary      | decimal  |
-- +-------------+----------+
-- 
-- In SQL, employee_id and salary_date together form the primary key for this table.
-- This table contains information about the salaries paid to employees on specific dates.
-- 
-- Problem:
-- Find the employee with the highest average salary over any 3 consecutive months.
-- 
-- Return the result table with columns employee_id and average_salary, ordered by employee_id in ascending order.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- EmployeeSalaries table:
-- +-------------+-------------+--------+
-- | employee_id | salary_date | salary |
-- +-------------+-------------+--------+
-- | 1           | 2023-01-01  | 5000   |
-- | 1           | 2023-02-01  | 6000   |
-- | 1           | 2023-03-01  | 7000   |
-- | 1           | 2023-04-01  | 5500   |
-- | 2           | 2023-01-01  | 7000   |
-- | 2           | 2023-02-01  | 8000   |
-- | 2           | 2023-03-01  | 7500   |
-- | 2           | 2023-04-01  | 7200   |
-- +-------------+-------------+--------+
-- 
-- Output:
-- +-------------+---------------+
-- | employee_id | average_salary|
-- +-------------+---------------+
-- | 2           | 7500.00       |
-- +-------------+---------------+
-- 
-- Explanation:
-- 
-- Employee 1's average salaries over any 3 consecutive months:
-- (5000 + 6000 + 7000) / 3 = 6000,
-- (6000 + 7000 + 5500) / 3 = 6166.67.
-- 
-- Employee 2's average salaries over any 3 consecutive months:
-- (7000 + 8000 + 7500) / 3 = 7500,
-- (8000 + 7500 + 7200) / 3 = 7566.67.
-- 
-- The highest average salary over any 3 consecutive months is 7500 for employee 2.


-- Solution

WITH MonthlyAverages AS (
    SELECT
        employee_id,
        AVG(salary) OVER (
            PARTITION BY employee_id 
            ORDER BY salary_date 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS average_salary,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id 
            ORDER BY salary_date 
        ) AS row_num
    FROM EmployeeSalaries
),
FilteredAverages AS (
    SELECT
        employee_id,
        average_salary
    FROM MonthlyAverages
    WHERE row_num >= 3
)
SELECT 
    employee_id,
    MAX(average_salary) AS average_salary
FROM FilteredAverages
GROUP BY employee_id
ORDER BY employee_id;
