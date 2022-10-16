--MySQL
SELECT 
  d.name AS Department, 
  e.name AS Employee, 
  e.salary AS Salary
FROM Employee e
JOIN Department d ON e.DepartmentId = d.id
WHERE (e.DepartmentId, e.salary) IN (
  SELECT 
    DepartmentId, 
    MAX(salary)
  FROM Employee 
  GROUP BY DepartmentId
  );


--MS SQL Server
SELECT Deparment, Employee, Salary
FROM (
  SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.salary AS Salary,
    DENSE_RANK()OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
  FROM Employee e
  JOIN Department d ON e.DepartmentId = d
  ) t
WHERE rnk = 1;
