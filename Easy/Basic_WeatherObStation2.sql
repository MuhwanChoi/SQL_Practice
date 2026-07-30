-- Problem: Weather Observation Station 2
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-2/problem
-- Description:
-- Query the following two values from the STATION table:
-- 1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
-- 2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.
--
-- Approach: Using 'SUM' aggregate function combined with 'ROUND'
----------------------------------------------------------------------------------

select round(sum(lat_n), 2), round(sum(long_w), 2)
from station;
