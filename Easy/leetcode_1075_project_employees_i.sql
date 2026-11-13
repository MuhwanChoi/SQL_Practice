/*
================================================================================
Platform: LeetCode
Problem: 1075. Project Employees I
Difficulty: Easy
Category: Basic JOIN & Aggregation (AVG / ROUND)
Link: https://leetcode.com/problems/project-employees-i/
================================================================================

[Problem Summary]
- Report the average experience years of all the employees for each project,
  rounded to 2 digits.

[Key Concept]
- Join `Project` and `Employee` on `employee_id` (foreign key guarantees match).
- Group by `p.project_id` and compute the average of `e.experience_years`.
- `AVG(e.experience_years)` is a cleaner shorthand for `SUM(e.experience_years) / COUNT(...)`
  and handles NULLs automatically.
================================================================================
*/

-- [Solution 1] Using AVG() (Cleanest)
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project AS p
JOIN Employee AS e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;


-- [Solution 2] Explicit SUM / COUNT (Submitted Solution)
SELECT 
    p.project_id,
    ROUND(SUM(e.experience_years) / COUNT(e.employee_id), 2) AS average_years
FROM Project AS p
JOIN Employee AS e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
