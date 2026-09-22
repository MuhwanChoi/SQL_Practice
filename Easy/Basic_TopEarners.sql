-- Problem: Top Earners
-- Link: https://www.hackerrank.com/challenges/earnings-of-employees/problem
-- Description:
-- We define an employee's total earnings to be their monthly (salary * months),
-- and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
-- Write a query to find the maximum total earnings for all employees as well as the total number of
-- employees who have maximum total earnings. Then print these values as 2 space-separated integers.
--
-- Approach:
-- 1. Calculate total earnings per employee as (salary * months).
-- 2. Group by total earnings to count how many employees share the same earnings.
-- 3. Order by total earnings DESC to bring the maximum to the top.
-- 4. Use LIMIT 1 to select only the maximum earnings and its corresponding employee count.
----------------------------------------------------------------------------------

select 
    (salary * months) as total_earnings,
    count(*) as employee_count
from employee
group by total_earnings
order by total_earnings desc
limit 1;
