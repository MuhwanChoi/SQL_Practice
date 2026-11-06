/*
================================================================================
Platform: LeetCode
Problem: 1068. Product Sales Analysis I
Difficulty: Easy
Category: Basic JOIN vs. GROUP BY Decision Rule
Link: https://leetcode.com/problems/product-sales-analysis-i/
================================================================================

[Key Concept: When to Use GROUP BY vs. Simple JOIN]
1. The Mental Trap:
   - Reading "~ per ~" or "for each sale_id" in the problem prompt instinctively triggers
     adding `GROUP BY s.sale_id`.
   - Result: Passed initial test cases (e.g. 1/1), but failed hidden submission tests (12/13 passed).

2. Why `GROUP BY s.sale_id` Fails on Edge Cases:
   - In the Sales table schema, the primary key is a COMPOSITE KEY: `(sale_id, year)`.
   - A single `sale_id` can span multiple distinct transaction rows (e.g., across different years).
   - Applying `GROUP BY s.sale_id` compresses multiple year records into a single row,
     silently dropping valid transaction data and causing row-count mismatches.

3. The Golden Decision Rule for GROUP BY:
   - Ask yourself: "Am I aggregating multiple rows into a single scalar summary metric?"
     - YES (calculating SUM, AVG, COUNT, MIN, MAX per entity) -> 'MUST' use `GROUP BY`.
     - NO  (simply retrieving, mapping, or enriching row-level attributes) -> DO NOT use `GROUP BY`.
   - If there is NO aggregate function in the SELECT clause, `GROUP BY` is virtually never needed.
================================================================================
*/


SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales AS s
JOIN Product AS p
    ON s.product_id = p.product_id;


-- [Anti-Pattern: Unwarranted Aggregation (Failed 12/13 Tests)]
-- SELECT 
--     p.product_name, 
--     s.year, 
--     s.price 
-- FROM Sales AS s
-- JOIN Product AS p
--     ON s.product_id = p.product_id
-- GROUP BY s.sale_id;
-- -> Causes unintended deduplication because (sale_id, year) is the true composite PK!
