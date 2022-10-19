--MySQL
SELECT  
  sell_date, 
  COUNT(DISTINCT product) AS num_sold,
  GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
from Activities
GROUP BY sell_date
ORDER BY sell_date;

--MS SQL Server
SELECT 
  sell_date,
  COUNT(product) AS num_sold,
  STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (SELECT DISTINCT * FROM Activities) T
GROUP BY sell_date
ORDER BY sell_date;
