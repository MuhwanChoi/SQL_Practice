-- Problem: Type of Triangle
-- Link: https://www.hackerrank.com/challenges/what-type-of-triangle/problem
-- Description:
-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
-- Output one of the following statements for each record in the table:
-- Equilateral, Isosceles, Scalene, or Not A Triangle.
--
-- Approach: Conditional logic using CASE WHEN statements
----------------------------------------------------------------------------------

select 
  case 
    when a + b <= c or a + c <= b or b + c <= a then 'Not A Triangle'
    when a = b and b = c then 'Equilateral'
    when a = b or b = c or a = c then 'Isosceles'
    else 'Scalene'
  end
from triangles;
