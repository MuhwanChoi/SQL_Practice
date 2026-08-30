-- Problem: Contest Leaderboard
-- Link: https://www.hackerrank.com/challenges/contest-leaderboard/problem
-- Description:
-- Query hacker_id, name, and total score of all hackers.
-- The total score is the sum of their maximum scores for all challenges.
-- Exclude hackers with a total score of 0.
-- Order by total score DESC, then by hacker_id ASC.
--
-- Approach:
-- 1. Create a CTE/Subquery to get the MAX score per hacker per challenge.
-- 2. Join with Hackers table to get hacker names.
-- 3. Group by hacker_id and name, calculating SUM of max scores.
-- 4. Filter out total_score = 0 using HAVING.
-- 5. Order by total_score DESC, hacker_id ASC.
----------------------------------------------------------------------------------

with max_scores as (
    -- Step 1: Get the maximum score for each challenge per hacker
    select 
        hacker_id,
        challenge_id,
        max(score) as max_score
    from submissions
    group by hacker_id, challenge_id
)
-- Step 2: Sum up max scores per hacker and filter
select 
    h.hacker_id,
    h.name,
    sum(m.max_score) as total_score
from hackers as h
join max_scores as m 
    on h.hacker_id = m.hacker_id
group by h.hacker_id, h.name
having total_score > 0
order by total_score desc, h.hacker_id asc;
