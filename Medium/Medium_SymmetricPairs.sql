-- Problem: Symmetric Pairs
-- Link: https://www.hackerrank.com/challenges/symmetric-pairs/problem
-- Description:
-- Two pairs (X1, Y1) and (X2, Y2) are symmetric pairs if X1 = Y2 and X2 = Y1.
-- Query all such symmetric pairs in ascending order by the value of X. List the rows such that X1 <= Y1.
--
-- Approach:
-- 1. For X = Y: Group by X, Y and find pairs appearing more than once (COUNT(*) > 1).
-- 2. For X < Y: Self-join Functions table on f1.X = f2.Y and f1.Y = f2.X where f1.X < f1.Y.
-- 3. Combine both cases using UNION and order by X ascending.
----------------------------------------------------------------------------------

-- Case 1: X = Y (Must appear at least twice)
select 
    x, 
    y
from functions
where x = y
group by x, y
having count(*) > 1

union

-- Case 2: X < Y (Distinct matching symmetric pair exists)
select 
    f1.x, 
    f1.y
from functions as f1
join functions as f2 
    on f1.x = f2.y 
   and f1.y = f2.x
where f1.x < f1.y

order by x asc;
