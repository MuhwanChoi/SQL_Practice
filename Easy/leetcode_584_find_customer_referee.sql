
================================================================================
Platform: LeetCode
Problem: 584. Find Customer Referee
Difficulty: Easy
Category: Basic Aggregate / Filter & Three-Valued Logic
Link: https://leetcode.com/problems/find-customer-referee/
================================================================================
-- Solution 1

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;

-- Soliution 2 

select name
from customer
where referee_id not in (2) or referee_id is null;

-- In SQL, `IN` and `NOT IN` are set-based operators that evaluate against a set (a list or a subquery) rather than a single scalar value.
-- Therefore, even when comparing against a single value, it must be enclosed in parentheses:
-- ❌ `column NOT IN 2` (Syntax Error)
-- ⭕ `column NOT IN (2)` (or use `column != 2`)

