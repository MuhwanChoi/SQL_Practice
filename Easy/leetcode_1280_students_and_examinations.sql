/*
================================================================================
Platform: LeetCode
Problem: 1280. Students and Examinations
Difficulty: Easy
Category: CROSS JOIN + LEFT JOIN / Cartesian Matrix Canvas / COUNT(column) vs COUNT(*)
Link: https://leetcode.com/problems/students-and-examinations/
================================================================================

[Problem Summary]
- Find the number of times each student attended each exam.
- Result table should include all students and all subjects, even if a student
  never attended an exam for that subject (in which case attended_exams should be 0).
- Order the result by student_id and subject_name.

 The Architecture: Complete Grid Creation + Event Enrichment:
   - Step 1: Create the complete candidate matrix via `CROSS JOIN`:
     - `Students CROSS JOIN Subjects` generates every valid `(student, subject)` pair.
   - Step 2: Left-join actual event logs:
     - `LEFT JOIN Examinations ON s.student_id = exam.student_id AND sub.subject_name = exam.subject_name`.
     - Non-attended subjects will have `NULL` across all right-table columns.
   - Step 3: Aggregate and Count:
     - `GROUP BY s.student_id, s.student_name, sub.subject_name`.
     - `COUNT(exam.subject_name)` ignores `NULL`s, cleanly producing `0` for unattended exams.
================================================================================
*/

-- [Solution 1] Standard CROSS JOIN + LEFT JOIN (Optimal & Intuitive)
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(exam.subject_name) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS exam
    ON s.student_id = exam.student_id
   AND sub.subject_name = exam.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id ASC, sub.subject_name ASC;


-- [Solution 2] Alternative: Subquery / CTE Style Canvas
WITH AllPairs AS (
    SELECT 
        s.student_id,
        s.student_name,
        sub.subject_name
    FROM Students AS s
    CROSS JOIN Subjects AS sub
)
SELECT 
    p.student_id,
    p.student_name,
    p.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM AllPairs AS p
LEFT JOIN Examinations AS e
    ON p.student_id = e.student_id
   AND p.subject_name = e.subject_name
GROUP BY p.student_id, p.student_name, p.subject_name
ORDER BY p.student_id ASC, p.subject_name ASC;
