--MySQL 
SELECT 
  user_id, 
  CONCAT(UPPER(LEFT(name, 1)), 
  LOWER(SUBSTR(name, 2, LENGTH(name)))) AS name
FROM Users
ORDER BY user_id;

--MS SQL Server
SELECT 
  user_id, 
  CONCAT(UPPER(LEFT(name, 1)), 
  LOWER(SUBSTRING(name, 2, LEN(name)))) AS name
FROM Users
ORDER BY user_id;

