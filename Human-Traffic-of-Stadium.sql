--MySQL & MS SQL Server
# Method 1:
SELECT id, visit_date, people
FROM stadium
WHERE people>=100
AND 
(
    (id+1 IN (SELECT id FROM stadium WHERE people>=100)     -- first row
    AND id+2 IN (SELECT id FROM stadium WHERE people>=100))
OR 
    (id+1 IN (SELECT id FROM stadium WHERE people>=100)     -- middle row
    AND id-1 IN (SELECT id FROM stadium WHERE people>=100))
OR
    (id-1 IN (SELECT id FROM stadium WHERE people>=100)     -- last row
     AND id-2 IN (SELECT id FROM stadium WHERE people>=100)));
     
# Method 2:
WITH cte AS (
    SELECT *,
          id - ROW_NUMBER() OVER(ORDER BY visit_date) AS grp 
    FROM stadium 
    WHERE people >=  100)
,
valuecount AS (
    SELECT *,
    COUNT(*) OVER(PARTITION BY grp) AS consecutiveValueCount 
    FROM cte)

SELECT id, visit_date, people 
FROM valuecount 
WHERE consecutiveValueCount >= 3;
