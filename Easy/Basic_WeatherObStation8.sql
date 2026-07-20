-- Problem: Weather Observation Station 8
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-8/problem
-- Description:
-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, or u) as both their first and last characters.
-- Your result cannot contain duplicates.
--
-- Approach 1: Combining 'LEFT' and 'RIGHT' functions with AND logic
-- Approach 2: Regular Expression (REGEXP) for pattern matching
-- Approach 3: Traditional 'LIKE' operators with OR and AND logic
----------------------------------------------------------------------------------

select distinct city from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u')
  and right(city, 1) in ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[AEIOU].*[AEIOU]$';

select distinct city from station where
(city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%')
and
(city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u');
