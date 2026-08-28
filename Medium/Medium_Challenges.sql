-- Problem: Challenges
-- Link: https://www.hackerrank.com/challenges/challenges/problem
-- Description:
-- Query hacker_id, name, and total number of challenges created.
-- - If more than one hacker created the maximum number of challenges, include them.
-- - If more than one hacker created the same number of challenges (less than max), exclude them.
-- Order by total challenges DESC, then hacker_id ASC.
--
-- Approach:
-- 1. Create a CTE to aggregate total challenges per hacker.
-- 2. Filter hackers whose challenge count is either the MAX count or unique across all hackers.
----------------------------------------------------------------------------------

with hacker_counts as (
    select 
        h.hacker_id,
        h.name,
        count(c.challenge_id) as cnt
    from hackers as h
    join challenges as c 
        on h.hacker_id = c.hacker_id
    group by h.hacker_id, h.name
)
select 
    hacker_id,
    name,
    cnt
from hacker_counts
where cnt = (select max(cnt) from hacker_counts)
   or cnt in (
       select cnt 
       from hacker_counts 
       group by cnt 
       having count(cnt) = 1
   )
order by cnt desc, hacker_id asc;
