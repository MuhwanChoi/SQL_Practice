-- Problem: Population Census (Asian Population)
-- Link: https://www.hackerrank.com/challenges/asian-population/problem
-- Description:
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
--
-- Approach: Join CITY and COUNTRY tables using INNER JOIN, filter by CONTINENT = 'Asia', and aggregate with SUM.
----------------------------------------------------------------------------------

select sum(city.population)
from city
join country on city.countrycode = country.code
where country.continent = 'Asia';
