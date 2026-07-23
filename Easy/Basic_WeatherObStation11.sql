-- Problem: Weather Observation Station 11
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-11/problem
-- Description:
-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
-- Your result cannot contain duplicates.
--
-- Approach 1: Combining 'LEFT' and 'RIGHT' functions with OR logic
-- Approach 2: Regular Expression (REGEXP) with OR pattern '|'
-- Approach 3: Logical NOT with 'AND' condition (De Morgan's Laws)
----------------------------------------------------------------------------------

select distinct city from station
where left(city, 1) not in ('a', 'e', 'i', 'o', 'u')
   or right(city, 1) not in ('a', 'e', 'i', 'o', 'u');

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[^AEIOU]|[^AEIOU]$';

select distinct city from station
where not (
  left(city, 1) in ('a', 'e', 'i', 'o', 'u') 
  and right(city, 1) in ('a', 'e', 'i', 'o', 'u')
);
