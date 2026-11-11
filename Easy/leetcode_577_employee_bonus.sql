/*
================================================================================
Platform: LeetCode
Problem: 577. Employee Bonus
Difficulty: Easy
Category: Basic JOIN / Query Execution Order / NULL Handling
Link: https://leetcode.com/problems/employee-bonus/
================================================================================

[Problem Summary]
- Report the name and bonus amount of each employee with a bonus less than 1000.
- Return the result table in any order.

  The Solution: `LEFT JOIN` Preserves All Left-Table Rows:
   - Using `LEFT JOIN` guarantees all employees from `Employee` remain in the dataset.
   - For employees without a matching entry in `Bonus`, SQL automatically populates
     `b.bonus` as `NULL`.
================================================================================
*/

SELECT 
    e.name,
    b.bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
    ON e.empId = b.empId
WHERE b.bonus < 1000 
   OR b.bonus IS NULL;
