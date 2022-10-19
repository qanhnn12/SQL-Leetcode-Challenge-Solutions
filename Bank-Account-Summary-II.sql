--MySQL & MS SQL Server
SELECT 
  name, 
  SUM(amount) AS balance    
FROM Users u, Transactions t 
WHERE u.account = t.account
GROUP BY name
HAVING balance > 10000;
