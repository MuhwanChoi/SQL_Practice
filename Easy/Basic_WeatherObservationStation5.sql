-- Problem: Weather Observation Station 5
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-5/problem
-- Description:
-- Query the two cities in STATION with the shortest and longest CITY names,
-- as well as their respective lengths (i.e.: number of characters in the name).
-- If there is more than one smallest or largest city, choose the one that comes
-- first when ordered alphabetically.
--
-- Approach:
-- 1. Query shortest: ORDER BY LENGTH(city) ASC, city ASC LIMIT 1.
-- 2. Query longest: ORDER BY LENGTH(city) DESC, city ASC LIMIT 1.
-- 3. Combine with UNION ALL or execute as two separate queries.
----------------------------------------------------------------------------------

-- Solution 1: Separate Queries (Supported in MySQL)
select city, length(city) 
from station
order by length(city) asc, city asc
limit 1;

select city, length(city) 
from station
order by length(city) desc, city asc
limit 1;


-- Solution 2: Single Query using UNION ALL
/*
(
    select city, length(city) 
    from station 
    order by length(city) asc, city asc 
    limit 1
)
union all
(
    select city, length(city) 
    from station 
    order by length(city) desc, city asc 
    limit 1
);
*/
