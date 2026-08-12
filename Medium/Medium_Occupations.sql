-- Problem: Occupations
-- Link: https://www.hackerrank.com/challenges/occupations/problem
-- Description:
-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
-- and displayed under its corresponding Occupation. 
-- The column output headers should be Doctor, Professor, Singer, and Actor, respectively.
--
-- Approach:
-- 1. Assign a row number (rn) to each name partitioned by Occupation and ordered alphabetically.
-- 2. Use conditional aggregation (MAX + CASE WHEN) grouped by row number (rn) to pivot the data into columns.
----------------------------------------------------------------------------------

with ranked_occupations as (
    select 
        name,
        occupation,
        row_number() over (partition by occupation order by name) as rn
    from occupations
)
select 
    max(case when occupation = 'Doctor' then name end) as Doctor,
    max(case when occupation = 'Professor' then name end) as Professor,
    max(case when occupation = 'Singer' then name end) as Singer,
    max(case when occupation = 'Actor' then name end) as Actor
from ranked_occupations
group by rn
order by rn;
