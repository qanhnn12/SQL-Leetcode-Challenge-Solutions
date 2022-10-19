--MySQL & MS SQL Server
SELECT COALESCE(MAX(salary), null) AS SecondHighestSalary 
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee); 
