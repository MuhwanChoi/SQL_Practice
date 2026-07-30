-- Problem: Weather Observation Station 13
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-13/problem
-- Description:
-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345.
-- Truncate/Round your answer to 4 decimal places.
--
-- Approach: Filtering range with 'WHERE' clause and aggregating with 'SUM' & 'TRUNCATE'
----------------------------------------------------------------------------------

select truncate(sum(lat_n), 4)
from station
where lat_n between 38.7880 and 137.2345;
