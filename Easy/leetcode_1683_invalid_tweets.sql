/*
================================================================================
Platform: LeetCode
Problem: 1683. Invalid Tweets
Difficulty: Easy
Category: String Manipulation & Length Functions
Link: https://leetcode.com/problems/invalid-tweets/
================================================================================

[Key Concept: CHAR_LENGTH() vs LENGTH()]
1. `CHAR_LENGTH(str)` / `CHARACTER_LENGTH(str)`:
   - Returns the length of the string measured in CHARACTERS.
   - Multibyte characters (e.g., Korean, Chinese, Japanese, emojis) count as 1 character.
   - Example: CHAR_LENGTH('데이터') -> 3

2. Why `CHAR_LENGTH()` is required here:
   - The problem explicitly defines an invalid tweet based on the "number of characters",
     not the byte size in storage.
   - Using `LENGTH()` can produce false positives if tweets contain non-ASCII characters.
================================================================================
*/

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;

