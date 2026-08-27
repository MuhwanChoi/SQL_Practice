-- Problem: Ollivander's Inventory
-- Link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
-- Description:
-- Query id, age, coins_needed, and power of the non-evil wands that require the minimum 
-- number of gold galleons for each combination of power and age.
-- Order by power DESC, then age DESC.
--
-- Approaches Covered:
-- 1. Window Function (ROW_NUMBER() CTE)
-- 2. Correlated Subquery
----------------------------------------------------------------------------------

-- ===============================================================================
-- Approach 1: Window Function (ROW_NUMBER() CTE)
-- ===============================================================================
with ranked_wands as (
    select 
        w.id,
        p.age,
        w.coins_needed,
        w.power,
        row_number() over (
            partition by w.code, w.power 
            order by w.coins_needed asc
        ) as rn
    from wands as w
    join wands_property as p 
        on w.code = p.code
    where p.is_evil = 0
)
select 
    id,
    age,
    coins_needed,
    power
from ranked_wands
where rn = 1
order by power desc, age desc;


-- ===============================================================================
-- Approach 2: Correlated Subquery
-- ===============================================================================
/*
select 
    w.id,
    p.age,
    w.coins_needed,
    w.power
from wands as w
join wands_property as p 
    on w.code = p.code
where p.is_evil = 0
  and w.coins_needed = (
      select min(w2.coins_needed)
      from wands as w2
      join wands_property as p2 
          on w2.code = p2.code
      where p2.is_evil = 0
        and w2.power = w.power
        and p2.age = p.age
  )
order by w.power desc, p.age desc;
*/
