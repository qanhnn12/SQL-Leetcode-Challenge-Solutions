--MySQL & MS SQL Server
SELECT DISTINCT num AS ConsecutiveNums 
FROM (
  SELECT 
    num,
    LEAD(num) OVER(ORDER BY id) AS ld, 
    LAG(num) OVER (ORDER BY id) AS lg
  FROM logs
) t
WHERE num=ld AND num=lg;
