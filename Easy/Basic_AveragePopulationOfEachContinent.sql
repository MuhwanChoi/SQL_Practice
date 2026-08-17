-- Problem: Average Population of Each Continent
-- Link: https://www.hackerrank.com/challenges/average-population-of-each-continent/problem
-- Description:
-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
-- and their respective average city populations (CITY.Population) rounded down to the nearest integer.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
--
-- Approach: Join CITY and COUNTRY tables, group by CONTINENT, and calculate FLOOR(AVG(CITY.Population)).
----------------------------------------------------------------------------------

select 
    country.continent, 
    floor(avg(city.population))
from city
join country on city.countrycode = country.code
group by country.continent;
