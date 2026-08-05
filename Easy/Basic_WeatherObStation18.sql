-- Problem: Weather Observation Station 18
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-18/problem
-- Description:
-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane:
-- a = MIN(LAT_N), b = MIN(LONG_W), c = MAX(LAT_N), d = MAX(LONG_W).
-- Query the Manhattan Distance between P1 and P2 and round it to 4 decimal places.
--
-- Approach: Manhattan Distance = |a - c| + |b - d| = (MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W))
----------------------------------------------------------------------------------

select round(
    (max(lat_n) - min(lat_n)) + (max(long_w) - min(long_w)), 
    4
)
from station;
