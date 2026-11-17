/*
================================================================================
Platform: LeetCode
Problem: 1633. Percentage of Users Attended a Contest
Difficulty: Easy
Category: Aggregation / Scalar Subquery / COUNT(column) vs COUNT(*) NULL Trap
Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
================================================================================

[Problem Summary]
- Find the percentage of the users registered in each contest rounded to two decimals.
- Return the result table ordered by `percentage` in descending order.
- In case of a tie, order it by `contest_id` in ascending order.

[Key Concept & Retrospective: COUNT(nullable_col) Trap & Eliminating Redundant JOINs]
1. The Trap (Why 13/14 Test Cases Passed, Failing the Final Edge Case):
   - Attempted:
     `ROUND(COUNT(u.user_name) * 100.0 / (SELECT COUNT(*) FROM Users), 2)`
   - Why it fails:
     - `COUNT(column)` ignores `NULL` values, whereas `COUNT(*)` counts all rows.
     - In the hidden 14th test case, a registered user has `user_name = NULL`.
     - That user is included in the denominator (`SELECT COUNT(*) FROM Users`),
       but silently dropped from the numerator (`COUNT(u.user_name)`), skewing the percentage.

================================================================================
*/

select
  contest_id,
  round(count(user_id) * 100 / (select count(*) from users), 2) as percentage
from register
group by contest_id,
order by percentage desc, contest_id asc;
