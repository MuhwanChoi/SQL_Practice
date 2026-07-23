-- Problem: Weather Observation Station 10
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-10/problem
-- Description:
-- Query the list of CITY names from STATION that do not end with vowels.
-- Your result cannot contain duplicates.
--
-- Approach 1: Utilizing 'RIGHT' function with NOT IN operator
-- Approach 2: Regular Expression (REGEXP) with negation '[^...]$'
-- Approach 3: Traditional 'NOT LIKE' operators with AND logic
----------------------------------------------------------------------------------

select distinct city from station
where right(city, 1) not in ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '[^AEIOU]$';

select distinct city from station where
city not like '%a' and city not like '%e' and city not like '%i' and city not like '%o' and city not like '%u';
