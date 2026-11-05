/*
================================================================================
Platform: LeetCode
Problem: 1378. Replace Employee ID With The Unique Identifier
Difficulty: Easy
Category: Basic JOIN / Preserving Unmatched Rows
Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
================================================================================

[Key Takeaway & Retrospective: The Nature of LEFT JOIN]
1. The Mistake / Overthinking:
   - Attempted to manually assign NULL using conditional logic (`CASE WHEN`, `IF`)
     when an employee had no matching unique ID.
   
2. The Core Mechanism of `LEFT JOIN`:
   - A `LEFT JOIN` automatically preserves ALL rows from the left table (`Employees`).
   - If there is NO corresponding match in the right table (`EmployeeUNI`), the database
     engine automatically populates all columns originating from the right table with `NULL`.
   - No explicit `CASE WHEN`, `IFNULL`, or `COALESCE` is required to generate `NULL` values.

3. Rule of Thumb:
   - When a problem says: "Show all records from Table A, and if there is no match 
     in Table B, show NULL / replace with null", your first instinct should ALWAYS be
     a simple `LEFT JOIN`.
================================================================================
*/

SELECT 
    eu.unique_id,
    e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS eu
    ON e.id = eu.id;

