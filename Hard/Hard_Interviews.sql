-- Problem: Interviews
-- Link: https://www.hackerrank.com/challenges/interviews/problem
-- Description:
-- Query contest_id, hacker_id, name, and the sums of:
-- total_submissions, total_accepted_submissions, total_views, and total_unique_views
-- for each contest. Exclude contests where all four sums are 0.
-- Order by contest_id ascending.
--
-- Approach:
-- 1. Pre-aggregate Submission_Stats and View_Stats grouped by challenge_id.
--    (Prevents Cartesian product fan-out when joining multiple 1:N detail tables).
-- 2. Join Contests -> Colleges -> Challenges -> Pre-aggregated stats using LEFT JOIN.
-- 3. Group by contest_id, hacker_id, name and SUM the pre-aggregated values.
-- 4. Filter out contests where all four metrics sum to 0 using HAVING.
-- 5. Order by contest_id ASC.
----------------------------------------------------------------------------------

with agg_submissions as (
    -- Pre-aggregate submission statistics by challenge_id
    select 
        challenge_id,
        sum(total_submissions) as sum_subs,
        sum(total_accepted_submissions) as sum_acc_subs
    from submission_stats
    group by challenge_id
),
agg_views as (
    -- Pre-aggregate view statistics by challenge_id
    select 
        challenge_id,
        sum(total_views) as sum_views,
        sum(total_unique_views) as sum_uniq_views
    from view_stats
    group by challenge_id
)
select 
    con.contest_id,
    con.hacker_id,
    con.name,
    coalesce(sum(sub.sum_subs), 0) as total_submissions,
    coalesce(sum(sub.sum_acc_subs), 0) as total_accepted_submissions,
    coalesce(sum(vw.sum_views), 0) as total_views,
    coalesce(sum(vw.sum_uniq_views), 0) as total_unique_views
from contests as con
join colleges as col 
    on con.contest_id = col.contest_id
join challenges as cha 
    on col.college_id = cha.college_id
left join agg_submissions as sub 
    on cha.challenge_id = sub.challenge_id
left join agg_views as vw 
    on cha.challenge_id = vw.challenge_id
group by 
    con.contest_id,
    con.hacker_id,
    con.name
having (total_submissions + total_accepted_submissions + total_views + total_unique_views) > 0
order by con.contest_id asc;
