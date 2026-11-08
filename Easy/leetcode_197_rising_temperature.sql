/*
================================================================================
Platform: LeetCode
Problem: 197. Rising Temperature
Difficulty: Easy
Category: Self JOIN / Date Manipulation (DATEDIFF) / Window Functions
Link: https://leetcode.com/problems/rising-temperature/
================================================================================

[Problem Summary]
- Find all dates' `id` with higher temperatures compared to its previous dates (yesterday).
- Return the result table in any order.

[Key Concept: Comparing Consecutive Time-Series Rows]
1. Why Self JOIN is Needed:
   - The comparison happens between two different rows within the exact same table
     (today's row vs. yesterday's row).
   - By aliasing `Weather` as `w1` (today) and `w2` (yesterday), we can place both
     records side-by-side on the same row.

2. The Solution: `DATEDIFF(w1.recordDate, w2.recordDate) = 1`
   - Setting `DATEDIFF(...) = 1` strictly enforces that `w1` is exactly 1 day after `w2`.
================================================================================
*/

-- [Solution 1] Self JOIN + DATEDIFF
-- Aligns today (w1) with yesterday (w2) and filters for higher temperature.
SELECT w1.id
FROM Weather AS w1
JOIN Weather AS w2
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;


