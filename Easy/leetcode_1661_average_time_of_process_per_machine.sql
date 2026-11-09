/*
================================================================================
Platform: LeetCode
Problem: 1661. Average Time of Process per Machine
Difficulty: Easy
Category: Self JOIN / Time-Series Pairing / Conditional Aggregation
Link: https://leetcode.com/problems/average-time-of-process-per-machine/
================================================================================

[Problem Summary]
- Calculate the average time each machine takes to complete a process.
- The time to complete a process is 'end' timestamp minus 'start' timestamp.
- The average time is the total duration divided by the number of processes.
- Return the result table with 'processing_time' rounded to 3 decimal places.

[Key Concept: Pairing Disjoint Lifecycle Events]
1. Why Self JOIN is Effective:
   - The lifecycle of a single process is split across two separate rows ('start' and 'end').
   - Joining `Activity` onto itself aligns both start and end timestamps horizontally:
     - Must match on BOTH `machine_id` AND `process_id`.
     - Filter left table for `activity_type = 'start'` and right table for `activity_type = 'end'`.
   - Resulting row: `(machine_id, process_id, start_time, end_time)`.
   - Duration per process: `(a2.timestamp - a1.timestamp)`.

2. Aggregation Logic:
   - The question requires the average processing time "per machine" -> `GROUP BY machine_id`.
   - `AVG(a2.timestamp - a1.timestamp)` computes the mean across all completed processes.
   - `ROUND(..., 3)` meets the precision requirement.
================================================================================
*/

-- Self JOIN
-- Pairs start and end events side-by-side using multi-key join conditions.
SELECT 
    a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity AS a1
JOIN Activity AS a2
    ON a1.machine_id = a2.machine_id
   AND a1.process_id = a2.process_id
   AND a1.activity_type = 'start'
   AND a2.activity_type = 'end'
GROUP BY a1.machine_id;

