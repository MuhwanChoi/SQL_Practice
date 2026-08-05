-- Problem: Weather Observation Station 19
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-19/problem
-- Description:
-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane:
-- a = MIN(LAT_N), b = MIN(LONG_W), c = MAX(LAT_N), d = MAX(LONG_W).
-- Query the Euclidean Distance between P1 and P2 and format your answer to display 4 decimal places.
--
-- Approach: Euclidean Distance = SQRT( POWER(c - a, 2) + POWER(d - b, 2) )
----------------------------------------------------------------------------------

select round(
    sqrt(
        power(max(lat_n) - min(lat_n), 2) + 
        power(max(long_w) - min(long_w), 2)
    ), 
    4
)
from station;
