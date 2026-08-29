-- Problem: The Report
-- Link: https://www.hackerrank.com/challenges/the-report/problem
-- Description:
-- Query Name, Grade, and Marks.
-- If Grade is less than 8, Name should be NULL.
-- Order by Grade DESC, then by Name ASC (for grades 8-10), then by Marks ASC (for grades 1-7).
--
-- Approach:
-- 1. Join Students and Grades tables using non-equi join (BETWEEN min_mark AND max_mark).
-- 2. Use IF/CASE expression to mask Name as NULL when Grade < 8.
-- 3. Order by Grade DESC, Name ASC, Marks ASC.
----------------------------------------------------------------------------------

select 
    if(g.grade >= 8, s.name, null) as name,
    g.grade,
    s.marks
from students as s
join grades as g 
    on s.marks between g.min_mark and g.max_mark
order by 
    g.grade desc, 
    s.name asc, 
    s.marks asc;
