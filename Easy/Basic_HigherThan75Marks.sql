-- Problem: Higher Than 75 Marks
-- Link: https://www.hackerrank.com/challenges/more-than-75-marks/problem
-- Description:
-- Query the Name of any student in STUDENTS who scored higher than 75 Marks.
-- Order your output by the last three characters of each name.
-- If two or more students have names ending in the same last three characters, secondary sort by ascending ID.
--
-- Approach 1: Using 'RIGHT' function for string sorting
-- Approach 2: Using 'SUBSTR' / 'SUBSTRING' function for string sorting
----------------------------------------------------------------------------------

select name from students
where marks > 75
order by right(name, 3) asc, id asc;

select name from students
where marks > 75
order by substr(name, -3) asc, id asc;
