--MySQL & MS SQL Server
# Method 1:
SELECT 
    id, 
    CASE WHEN p_id IS NULL THEN 'Root'
         WHEN id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
    ELSE 'Inner' END AS type
FROM Tree;

# Method 2:
SELECT 
    id, 
    CASE WHEN p_id IS NULL THEN 'Root'
         WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
    ELSE 'Leaf' END AS type
FROM Tree;
