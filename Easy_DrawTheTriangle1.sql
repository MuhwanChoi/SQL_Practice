-- Problem: Draw The Triangle 1
-- Link: https://www.hackerrank.com/challenges/draw-the-triangle-1/problem
-- Description:
-- P(R) represents a pattern drawn by Julia in R rows. 
-- Write a query to print the pattern P(20) in descending order of stars.
--
-- Approaches Covered:
-- 1. Recursive CTE (Standard Set-based Approach - Recommended)
-- 2. Stored Procedure with WHILE Loop (Procedural Approach)
----------------------------------------------------------------------------------

-- ===============================================================================
-- Approach 1: Recursive CTE (Standard & Clean Set-Based Query)
-- ===============================================================================
with recursive pattern as (
    -- Base Case: Starting from 20
    select 20 as n
    union all
    -- Recursive Step: Decrement until n = 1
    select n - 1
    from pattern
    where n > 1
)
select repeat('* ', n)
from pattern;


-- ===============================================================================
-- Approach 2: Stored Procedure with WHILE Loop (Procedural Query)
-- ===============================================================================
/*
delimiter $$

create procedure while_proc()
begin   
    declare i int default 20;
    while i > 0 do
        select if(i = 1, '*', repeat('* ', i));
        set i = i - 1;
    end while;
end$$

delimiter ; 

call while_proc();
*/
