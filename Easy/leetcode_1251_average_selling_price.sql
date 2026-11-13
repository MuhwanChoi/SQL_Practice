/*
================================================================================
Platform: LeetCode
Problem: 1251. Average Selling Price
Difficulty: Easy
Category: Range-Based LEFT JOIN / Weighted Average / NULL Handling (IFNULL)
Link: https://leetcode.com/problems/average-selling-price/
================================================================================

[Problem Summary]
- Find the average selling price for each product.
- `average_price` should be rounded to 2 decimal places.
- If a product does not have any sold units, its average selling price is assumed to be 0.
- Return the result table in any order.

[Key Concept & Retrospective: Range Joins, Unsold Products & Division by NULL]
1. The Mental Traps (First Attempt Review):
   - Trap A: Missing the primary entity join key (`p.product_id = u.product_id`):
     - Matching ONLY on `u.purchase_date BETWEEN p.start_date AND p.end_date` causes
       a cartesian product on weird combination.
   - Trap B: Using `INNER JOIN` instead of `LEFT JOIN`:
     - Products registered in `Prices` with zero sales in `UnitsSold` get dropped
       completely during an `INNER JOIN`, violating the "0 if unsold" requirement.
   - Trap C: Unhandled `NULL` in Weighted Average Arithmetic:
     - With `LEFT JOIN`, unsold products yield `u.units = NULL`.
     - `SUM(p.price * u.units) / SUM(u.units)` evaluates to `NULL / NULL = NULL`.
     - Must wrap the expression with `IFNULL(..., 0)` or `COALESCE(..., 0)`.

2. Architecture of the Solution:
   - Join `Prices` (left) with `UnitsSold` (right) on BOTH `product_id` equality AND
     date range inclusion (`u.purchase_date BETWEEN p.start_date AND p.end_date`).
   - Group by `p.product_id` to compute the weighted average:
     `SUM(price * units) / SUM(units)`.
   - Round to 2 decimal places and coalesce `NULL` outcomes to `0`.
================================================================================
*/

-- [Solution 1] LEFT JOIN + Range Condition + IFNULL
SELECT 
    p.product_id,
    IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;


-- [Solution 2] Alternative: ANSI SQL COALESCE()
SELECT 
    p.product_id,
    COALESCE(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
    ON p.product_id = u.product_id
   AND u.purchase_date >= p.start_date
   AND u.purchase_date <= p.end_date
GROUP BY p.product_id;
