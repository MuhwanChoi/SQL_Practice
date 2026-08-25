-- Problem: New Companies
-- Link: https://www.hackerrank.com/challenges/the-company/problem
-- Description:
-- Query company_code, founder name, total number of lead managers, senior managers,
-- managers, and employees for each company. Order by company_code ascending.
--
-- Approach:
-- Join the Company table with subordinate hierarchy tables (or directly with Employee),
-- group by company_code and founder, and use COUNT(DISTINCT ...) to handle duplicates.
----------------------------------------------------------------------------------

select 
    c.company_code,
    c.founder,
    count(distinct e.lead_manager_code),
    count(distinct e.senior_manager_code),
    count(distinct e.manager_code),
    count(distinct e.employee_code)
from company as c
left join employee as e 
    on c.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code;
