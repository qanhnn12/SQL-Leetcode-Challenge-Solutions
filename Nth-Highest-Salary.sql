--MySQL
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT DISTINCT salary
      FROM (
        SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) as rnk
        FROM Employee
          ) t
      WHERE rnk = N
  );
END


--MS SQL Server
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT DISTINCT salary
        FROM (
        SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
        FROM Employee
            ) t
        WHERE rnk = @N
    );
END
