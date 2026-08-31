-- Problem: SQL Project Planning
-- Link: https://www.hackerrank.com/challenges/sql-projects/problem
-- Description:
-- Query the start and end dates of projects listed by the number of days it took to complete
-- in ascending order. If there is a tie, order by the project start date.
--
-- Approach:
-- 1. Identify true project start dates (Start_Date NOT IN (SELECT End_Date...)).
-- 2. Identify true project end dates (End_Date NOT IN (SELECT Start_Date...)).
-- 3. Pair them 1-to-1 using ROW_NUMBER() based on chronological order.
-- 4. Calculate project duration and order by DATEDIFF ascending, then Start_Date ascending.
----------------------------------------------------------------------------------

with project_starts as (
    select 
        start_date,
        row_number() over (order by start_date) as rn
    from projects
    where start_date not in (select end_date from projects)
),
project_ends as (
    select 
        end_date,
        row_number() over (order by end_date) as rn
    from projects
    where end_date not in (select start_date from projects)
)
select 
    s.start_date,
    e.end_date
from project_starts as s
join project_ends as e 
    on s.rn = e.rn
order by 
    datediff(e.end_date, s.start_date) asc, 
    s.start_date asc;
