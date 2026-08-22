-- Problem: The PADS
-- Link: https://www.hackerrank.com/challenges/the-pads/problem
-- Description:
-- Generate two result sets:
-- 1. Name followed by the first letter of profession in parentheses, sorted alphabetically by Name.
-- 2. "There are a total of [count] [profession]s.", sorted by count asc, then profession asc.
--
-- Approach:
-- Query 1: Use CONCAT and LEFT to format strings. Sort by Name.
-- Query 2: Use COUNT, LOWER, and CONCAT to group by Occupation. Sort by COUNT then Occupation.
----------------------------------------------------------------------------------

-- Query 1: Format names with the first letter of their occupation
select concat(name, '(', left(occupation, 1), ')')
from occupations
order by name;

-- Query 2: Count total number of people per occupation
select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.')
from occupations
group by occupation
order by count(occupation) asc, occupation asc;
