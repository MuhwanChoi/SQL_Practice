-- Problem: 15 Days of Learning SQL
-- Link: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
-- Description:
-- For each day of the contest (2016-03-01 to 2016-03-15):
-- 1. Count unique hackers who made at least 1 submission each day up to the current date.
-- 2. Find the hacker_id and name who made the maximum submissions on that date 
--    (tie-breaker: lowest hacker_id).
-- Order results by submission_date ascending.
--
-- Approach:
-- 1. Outer query iterates through distinct submission dates.
-- 2. Subquery 1: Count hackers whose distinct submission dates up to current date 
--    equals the day offset (DATEDIFF(current_date, '2016-03-01')).
-- 3. Subquery 2: Find top hacker_id on current date ordered by COUNT(*) DESC, hacker_id ASC LIMIT 1.
-- 4. Subquery 3: Fetch hacker name using top hacker_id.
----------------------------------------------------------------------------------

select 
    d.submission_date,

    (
        select count(distinct s1.hacker_id)
        from submissions as s1
        where s1.submission_date = d.submission_date
          and (
              select count(distinct s2.submission_date)
              from submissions as s2
              where s2.hacker_id = s1.hacker_id
                and s2.submission_date <= d.submission_date
          ) = datediff(d.submission_date, '2016-03-01') + 1
    ) as unique_hackers,

    (
        select s3.hacker_id
        from submissions as s3
        where s3.submission_date = d.submission_date
        group by s3.hacker_id
        order by count(*) desc, s3.hacker_id asc
        limit 1
    ) as top_hacker_id,

    (
        select h.name
        from hackers as h
        where h.hacker_id = (
            select s4.hacker_id
            from submissions as s4
            where s4.submission_date = d.submission_date
            group by s4.hacker_id
            order by count(*) desc, s4.hacker_id asc
            limit 1
        )
    ) as top_hacker_name

from (
    select distinct submission_date 
    from submissions
) as d
order by d.submission_date asc;
