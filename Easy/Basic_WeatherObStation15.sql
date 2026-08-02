-- Problem: Weather Observation Station 15
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-15/problem
-- Description:
-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345.
-- Round your answer to 4 decimal places.
--
-- Approach 1: Using ORDER BY and LIMIT 1
-- Approach 2: Using Subquery with MAX() function
----------------------------------------------------------------------------------

-- Approach 1: Sort LAT_N in descending order and fetch top 1
select round(long_w, 4)
from station
where lat_n < 137.2345
order by lat_n desc
limit 1;

-- Approach 2: Using Subquery to find MAX(LAT_N)
select round(long_w, 4)
from station
where lat_n = (
    select max(lat_n) 
    from station 
    where lat_n < 137.2345
);
