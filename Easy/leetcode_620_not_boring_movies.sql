/*
================================================================================
Platform: LeetCode
Problem: 620. Not Boring Movies
Difficulty: Easy
Category: Basic Filtering & Sorting / Modulo Operator
Link: https://leetcode.com/problems/not-boring-movies/
================================================================================

[Problem Summary]
- Report the movies with an odd-numbered ID and a description that is not "boring".
- Return the result table ordered by rating in descending order.

[Key Concept: Modulo Filtering, Inequality Operators & NULL Consideration]
1. Checking for Odd / Even Numbers:
   - `id % 2 = 1` (or `id % 2 <> 0`): Standard arithmetic modulo operator in MySQL/PostgreSQL/SQL Server.
   - `MOD(id, 2) = 1`: ANSI SQL function alternative (compatible with Oracle as well).
   - Note: For positive IDs, `id % 2 = 1` is clean and idiomatic. (If negative integers were possible, `id % 2 <> 0` is safer).

2. String Inequality Comparison:
   - `description != 'boring'` and `description <> 'boring'` are functionally identical in MySQL.
   - `<>` is the strict ANSI SQL standard operator, whereas `!=` is widely supported across modern RDBMS engines.

3. Edge Case Note (Three-Valued Logic with NULLs):
   - In this schema, `description` is non-null.
   - However, in real-world datasets where `description` could be NULL, `description != 'boring'`
     evaluates to `UNKNOWN` and excludes NULL rows. If NULL descriptions should be treated as
     "not boring", you would write: `(description != 'boring' OR description IS NULL)`.

4. Sorting:
   - `ORDER BY rating DESC` sorts from highest to lowest rating.
================================================================================
*/

-- [Solution 1] Standard Modulo
SELECT 
    id,
    movie,
    description,
    rating
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;


-- [Solution 2] Alternative: ANSI SQL MOD() Function & <> Operator
SELECT 
    id,
    movie,
    description,
    rating
FROM Cinema
WHERE MOD(id, 2) = 1
  AND description <> 'boring'
ORDER BY rating DESC;
