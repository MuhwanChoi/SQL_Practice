-- Problem: Weather Observation Station 20
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-20/problem
-- Description:
-- A median is defined as a number separating the higher half of a data set from the lower half.
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
--
-- Approach: Assign row numbers ordered by LAT_N using ROW_NUMBER(), then pick the middle row.
----------------------------------------------------------------------------------

with ranked_station as (
    select 
        lat_n,
        row_number() over (order by lat_n) as row_num,
        count(*) over () as total_count
    from station
)
select round(lat_n, 4)
from ranked_station
where row_num = ceil(total_count / 2.0);
