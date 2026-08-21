-- Problem: Print Prime Numbers
-- Link: https://www.hackerrank.com/challenges/print-prime-numbers/problem
-- Description:
-- Write a query to print all prime numbers less than or equal to 1000. 
-- Print your result on a single line, and use the ampersand (&) character as your separator.
--
-- Approach:
-- 1. Generate numbers from 2 to 1000 using a Recursive CTE.
-- 2. Filter for prime numbers by checking that no smaller number (m >= 2, m < n) evenly divides n (NOT EXISTS).
-- 3. Concatenate the resulting prime numbers using GROUP_CONCAT with '&' as separator.
----------------------------------------------------------------------------------

with recursive numbers as (
    -- Base Case: Starting from 2 (smallest prime number)
    select 2 as n
    union all
    -- Recursive Step: Increment up to 1000
    select n + 1
    from numbers
    where n < 1000
)
select group_concat(n separator '&')
from numbers as p
where not exists (
    select 1
    from numbers as d
    where d.n < p.n
      and p.n % d.n = 0
);
