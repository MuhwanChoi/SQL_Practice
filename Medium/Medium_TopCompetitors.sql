-- Problem: Top Competitors (Full Score)
-- Link: https://www.hackerrank.com/challenges/full-score/problem
-- Description:
-- Query the hacker_id and name of hackers who achieved full scores for more than one challenge.
-- Order by total number of challenges with full score descending, then by hacker_id ascending.
--
-- Approach:
-- 1. Join Submissions, Hackers, Challenges, and Difficulty tables.
-- 2. Filter submissions where the achieved score equals the difficulty's max score (s.score = d.score).
-- 3. Group by hacker_id and name, filtering for hackers with COUNT(*) > 1 via HAVING.
-- 4. Order by COUNT(*) DESC, hacker_id ASC.
----------------------------------------------------------------------------------

select 
    h.hacker_id,
    h.name
from submissions as s
join hackers as h 
    on s.hacker_id = h.hacker_id
join challenges as c 
    on s.challenge_id = c.challenge_id
join difficulty as d 
    on c.difficulty_level = d.difficulty_level
where s.score = d.score
group by h.hacker_id, h.name
having count(*) > 1
order by count(*) desc, h.hacker_id asc;

-- [Hackers] (h.name)
--   │
--   └── (hacker_id) ── [Submissions] (s.score)
--                            │
--                            └── (challenge_id) ── [Challenges] (c.difficulty_level)
--                                                       │
--                                                       └── (difficulty_level) ── [Difficulty] (만점 기준 d.score)
