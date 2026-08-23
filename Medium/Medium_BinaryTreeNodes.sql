-- Problem: Binary Tree Nodes
-- Link: https://www.hackerrank.com/challenges/binary-search-tree-1/problem
-- Description:
-- Write a query to find the node type of Binary Tree ordered by the value of the node:
-- - Root: If node is root (P is NULL)
-- - Leaf: If node is leaf (not a parent to any node)
-- - Inner: If node is neither root nor leaf
--
-- Approach: Use CASE WHEN to check conditions in hierarchical order (Root -> Leaf -> Inner).
----------------------------------------------------------------------------------

select 
    n,
    case 
        when p is null then 'Root'
        when n not in (select p from bst where p is not null) then 'Leaf'
        else 'Inner'
    end
from bst
order by n;
