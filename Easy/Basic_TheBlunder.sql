-- Problem: The Blunder
-- Link: https://www.hackerrank.com/challenges/the-blunder/problem
-- Description:
-- Calculate the amount of error between actual average salary and Samantha's miscalculated average salary (with all 0s removed).
-- Round the result up to the next integer.
--
-- Approach: Using 'AVG', 'REPLACE', and 'CEIL' functions
----------------------------------------------------------------------------------

select ceil(avg(salary) - avg(replace(salary, '0', '')))
from employees;
