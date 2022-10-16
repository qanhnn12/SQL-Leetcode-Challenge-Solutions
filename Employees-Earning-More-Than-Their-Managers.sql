--MySQL & MS SQL Server
# Method 1:
SELECT e1.name AS Employee 
FROM Employee e1, Employee e2
WHERE e1.managerId = e2.Id
AND e1.salary > e2.salary;

# Method 2:
SELECT e1.name AS Employee 
FROM Employee e1
JOIN Employee e2
ON e1.managerId = e2.Id
AND e1.salary > e2.salary;

# Method 3:
SELECT name AS Employee 
FROM Employee e1
WHERE salary > (SELECT salary 
               FROM Employee e2
               WHERE e2.id = e1.managerId);
