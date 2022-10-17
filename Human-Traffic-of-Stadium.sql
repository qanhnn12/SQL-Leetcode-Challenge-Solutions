--MySQL & MS SQL Server
--- Method 1:
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
     
     
--- Method 2:
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


--- Method 3:
SELECT DISTINCT t1.*
FROM stadium t1, stadium t2, stadium t3
WHERE t1.people >= 100 AND t2.people >= 100 AND t3.people >= 100
AND
(
    (t1.id - t2.id = 1 AND t1.id - t3.id = 2 AND t2.id - t3.id =1)  -- t1, t2, t3
    OR
    (t2.id - t1.id = 1 AND t2.id - t3.id = 2 AND t1.id - t3.id =1) -- t2, t1, t3
    OR
    (t3.id - t2.id = 1 AND t2.id - t1.id = 1 AND t3.id - t1.id = 2) -- t3, t2, t1
)
ORDER BY t1.id;
