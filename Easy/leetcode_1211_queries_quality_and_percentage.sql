/*
================================================================================
Platform: LeetCode
Problem: 1211. Queries Quality and Percentage
Difficulty: Easy
Category: Conditional Aggregation (CASE WHEN / AVG) / Single Table Scan
Link: https://leetcode.com/problems/queries-quality-and-percentage/
================================================================================

[Problem Summary]
- `quality`: The average of the ratio between query rating and its position.
- `poor_query_percentage`: The percentage of all queries with rating less than 3.
- Write a solution to find each `query_name`, the `quality` and `poor_query_percentage`.
- Both `quality` and `poor_query_percentage` should be rounded to 2 decimal places.
- Return the result table in any order.

[Key Concept & Retrospective: Conditional Aggregation vs. Correlated Subqueries]
1. The Mental Traps (First Attempt Review):
   - Trap A: Unnecessary Self-JOIN (`Queries JOIN CTE ON query_name = query_name`):
     - Joining a table onto itself on a non-unique key causes an N x N row explosion.
     - `quality` only appeared correct because both numerator and denominator scaled by N
       and accidentally canceled out. Never join when a single table scan suffices.
   - Trap B: Filtering the denominator inside a scalar subquery (`WHERE rating < 3`):
     - Filtering `rating < 3` inside the subquery restricts BOTH numerator and denominator
       to poor queries, yielding `(poor / poor) * 100 = 100.00%` every time.
   - Trap C: Uncorrelated Subquery:
     - Without `WHERE inner.query_name = outer.query_name`, a scalar subquery returns
       one global constant across every group.
   - Trap D: Hidden Edge Case (`query_name IS NULL`):
     - `GROUP BY query_name` treats `NULL` as its own group. Always filter out `NULL`
       query names via `WHERE query_name IS NOT NULL`.

2. The Solution: Conditional Aggregation (`AVG(CASE WHEN ... THEN 1 ELSE 0 END)`):
   - Map each row to `1` if `rating < 3` else `0`.
   - Taking the `AVG()` of 1s and 0s directly computes `(count of matches) / (total rows)`
     in a single table pass without subqueries or self-joins.
   - Multiply by `100` and round to 2 decimal places.
================================================================================
*/

-- [Solution 1] Standard Conditional Aggregation with CASE WHEN (Optimal & Portable)
SELECT 
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100, 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;
