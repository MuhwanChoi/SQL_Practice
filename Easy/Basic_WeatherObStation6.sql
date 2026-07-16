-- Problem: Weather Observation Station 6
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-6/problem
-- Description: 
-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
-- Your result cannot contain duplicates.
--
-- Approach 1: Traditional 'LIKE' operators with OR logic
-- Approach 2: Utilizing 'LEFT' function for substring matching
-- Approach 3: Regular Expression (REGEXP) for clean querying
---------------------------------------------------------------------------------
select distinct city from station where
city like 'a%'
or city like 'e%'
or city like 'i%'
or city like 'o%'
or city like 'u%';

select distinct city from station
where left(city,1) in ('a','e','i','o','u');

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[AEIOU]';
