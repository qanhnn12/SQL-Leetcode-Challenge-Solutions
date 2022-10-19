--MySQL & MS SQL Server
# Method 1:
SELECT name
FROM Customer
WHERE referee_id != 2
  OR referee_id IS NULL;

# Method 2:
SELECT name
FROM Customer c1
WHERE NOT EXISTS (
  SELECT name
  FROM Customer c2
  WHERE referee_id = 2
    AND c2.id = c1.id);
