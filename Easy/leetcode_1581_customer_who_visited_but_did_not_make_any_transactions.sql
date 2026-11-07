/*
================================================================================
Platform: LeetCode
Problem: 1581. Customer Who Visited but Did Not Make Any Transactions
Difficulty: Easy
Category: LEFT JOIN Anti-Pattern (IS NULL) & Aggregation
Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
================================================================================

[Problem Summary]
- Find the IDs of the users who visited without making any transactions and the 
  number of times they made these types of visits.
- Return the result table in any order.

[Key Concept: Filtering Unmatched Records & Proper Aggregation]
1. LEFT JOIN + WHERE right_table.key IS NULL (Anti-Join Pattern):
   - A classic SQL pattern to find rows that exist in Table A (Visits) but have 
     no corresponding records in Table B (Transactions).
   - If a visit generated no transaction, `t.visit_id` (or `t.transaction_id`) evaluates to NULL.
   - Filtering with `WHERE t.visit_id IS NULL` captures visits with zero transactions.

2. GROUP BY & COUNT Selection:
   - "per customer / for each user" -> `GROUP BY v.customer_id`.
   - Aggregate metric needed: number of visits without transactions.
   - `COUNT(v.visit_id)` or `COUNT(*)` counts the filtered visit rows per customer.
   - Note: Never count columns from the right table here (e.g., `COUNT(t.transaction_id)` would return 0).

3. Alternative Pattern: NOT IN / NOT EXISTS
   - Can also be expressed via subquery:
     `WHERE v.visit_id NOT IN (SELECT visit_id FROM Transactions)`
     or using `NOT EXISTS`.
   - LEFT JOIN ... WHERE ... IS NULL is standard and often optimized effectively by SQL engines.
================================================================================
*/

-- [Solution 1] LEFT JOIN + IS NULL (Optimal & Standard)
SELECT 
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM Visits AS v
LEFT JOIN Transactions AS t
    ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;


-- [Solution 2] Alternative: NOT EXISTS
-- Reads intuitively: "Select visits where no matching transaction exists"
SELECT 
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits AS v
WHERE NOT EXISTS (
    SELECT 1 
    FROM Transactions AS t 
    WHERE t.visit_id = v.visit_id
)
GROUP BY v.customer_id;


-- [Solution 3] Alternative: NOT IN (Subquery)
-- Safe only when transaction visit_id has no NULLs
SELECT 
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits AS v
WHERE v.visit_id NOT IN (
    SELECT DISTINCT visit_id 
    FROM Transactions
)
GROUP BY v.customer_id;
