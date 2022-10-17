--MySQL & MS SQL Server
# Method 1:
SELECT Department, Employee, Salary
FROM (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK()OVER(PARTITION BY e.departmentId ORDER BY e.Salary DESC) AS rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
    ) t
WHERE rnk <= 3;

# Method 2:
SELECT 
    d.Name AS Department, 
    e1.Name AS Employee, 
    e1.Salary
FROM Employee e1
JOIN Department d ON e1.departmentId = d.id
WHERE 3 > (
    SELECT COUNT(DISTINCT e2.Salary
    FROM Employee e2
    WHERE e2.Salary > e1.Salary
    );  
