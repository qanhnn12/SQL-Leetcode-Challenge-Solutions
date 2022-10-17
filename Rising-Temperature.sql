--MySQL 
# Method 1:
SELECT id 
FROM (
    SELECT id, temperature, recordDate,
    LAG(temperature) OVER (ORDER BY recordDate) AS pre_temperature,
    LAG(recordDate) OVER (ORDER BY recordDate) AS pre_date
    FROM Weather) temp
WHERE temperature > pre_temperature
  AND DATEDIFF(recordDate, pre_date) = 1;
  
# Method 2:
SELECT w1.id 
FROM Weather w1, Weather w2
WHERE w1.temperature > w2.temperature
AND DATEDIFF(w1.recordDate, w2.recordDate) = 1;


--MS SQL Server
# Method 1:
SELECT id 
FROM (
    SELECT id, temperature, recordDate,
    LAG(temperature) OVER (ORDER BY recordDate) AS pre_temperature,
    LAG(recordDate) OVER (ORDER BY recordDate) AS pre_date
    FROM Weather) temp
WHERE temperature > pre_temperature
  AND DATEDIFF(d, pre_date, recordDate) = 1;
  
# Method 2:
SELECT w1.id 
FROM Weather w1, Weather w2
WHERE w1.temperature > w2.temperature
AND DATEDIFF(d, w2.recordDate, w1.recordDate) = 1;
