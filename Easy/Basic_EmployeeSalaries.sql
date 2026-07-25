-- Problem: Employee Salaries
-- Link: https://www.hackerrank.com/challenges/salary-of-employees/problem
-- Description:
-- Query the list of employee names (i.e.: the name attribute) from the Employee table 
-- having a salary greater than $2000 per month who have been employees for less than 10 months.
-- Sort your result by ascending employee_id.
--
-- Approach: Using 'WHERE' clause with 'AND' operator and 'ORDER BY'
----------------------------------------------------------------------------------

select name from employee
where salary > 2000 and months < 10
order by employee_id asc;
