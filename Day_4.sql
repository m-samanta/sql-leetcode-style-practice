-- Day 4: SQL Practice Problem
-- Table: Employees
-- +-------------+----------+
-- | Column Name | Type |
-- +-------------+----------+
-- | employee_id | int |
-- | name | varchar |
-- | department | varchar |
-- | hire_date | date |
-- | salary | int |
-- +-------------+----------+
-- 
-- In SQL, employee_id is the primary key for this table.
-- This table contains information about employees, including their department, hire date, and salary.
-- 
-- Problem:
-- Find the names of employees who have the highest salary in each department.
-- 
-- Return the result table with columns department and name, ordered by department in ascending order.
-- 
-- The result format is in the following example.
-- 
-- Example:
-- Input:
-- Employees table:
-- +-------------+-----------+-------------+------------+--------+
-- | employee_id | name | department | hire_date | salary |
-- +-------------+-----------+-------------+------------+--------+
-- | 1 | John | Engineering | 2020-01-01 | 70000 |
-- | 2 | Jane | HR | 2019-02-01 | 80000 |
-- | 3 | Doe | Engineering | 2021-03-01 | 75000 |
-- | 4 | Alice | HR | 2020-04-01 | 90000 |
-- | 5 | Bob | Sales | 2018-05-01 | 85000 |
-- | 6 | Charlie | Sales | 2019-06-01 | 95000 |
-- +-------------+-----------+-------------+------------+--------+
-- 
-- Output:
-- +-------------+-------+
-- | department | name |
-- +-------------+-------+
-- | Engineering | Doe |
-- | HR | Alice |
-- | Sales | Charlie|
-- +-------------+-------+
-- 
-- Explanation:
-- 
-- In the Engineering department, Doe has the highest salary of $75,000.
-- In the HR department, Alice has the highest salary of $90,000.
-- In the Sales department, Charlie has the highest salary of $95,000.


-- Solution

WITH MaxSalaries AS (
    SELECT 
        department,
        MAX(salary) AS max_salary
    FROM Employees
    GROUP BY department
)
SELECT 
    e.department,
    e.name
FROM 
    Employees e
JOIN 
    MaxSalaries ms
ON 
    e.department = ms.department AND e.salary = ms.max_salary
ORDER BY 
    e.department;
