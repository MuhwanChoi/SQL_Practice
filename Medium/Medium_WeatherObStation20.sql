-- Problem: Weather Observation Station 20
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-20/problem
-- Description:
-- A median is defined as a number separating the higher half of a data sample from the lower half.
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
--
-- Approach:
-- 1. Use ROW_NUMBER() to index ordered LAT_N values.
-- 2. Use COUNT(*) OVER () to retrieve the total row count.
-- 3. Filter for middle row(s) using FLOOR and CEIL on (total_count + 1) / 2.
-- 4. Calculate AVG(lat_n) to handle both odd and even datasets, and round to 4 decimal places.
----------------------------------------------------------------------------------

with ranked_stations as (
    select 
        lat_n,
        row_number() over (order by lat_n asc) as rn,
        count(*) over () as total_count
    from station
)
select 
    round(avg(lat_n), 4) as median_lat_n
from ranked_stations
where rn in (
    floor((total_count + 1) / 2), 
    ceil((total_count + 1) / 2)
);
