-- Problem: Placements
-- Link: https://www.hackerrank.com/challenges/placements/problem
-- Description:
-- Query the names of all students whose best friends got offered a higher salary than them.
-- Names must be ordered by the salary amount offered to the best friends in ascending order.
--
-- Approach:
-- 1. Join Students with Friends to map each student to their best friend.
-- 2. Join Packages twice:
--    - Once on s.id to get the student's salary.
--    - Once on f.friend_id to get the friend's salary.
-- 3. Filter where friend's salary > student's salary.
-- 4. Order by friend's salary ascending.
----------------------------------------------------------------------------------

select 
    s.name
from students as s
join friends as f 
    on s.id = f.id
join packages as s_pkg 
    on s.id = s_pkg.id
join packages as f_pkg 
    on f.friend_id = f_pkg.id
where f_pkg.salary > s_pkg.salary
order by f_pkg.salary asc;
