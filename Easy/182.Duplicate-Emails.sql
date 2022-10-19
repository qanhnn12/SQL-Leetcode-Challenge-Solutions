--MySQL & MS SQL Server
# Method 1:
SELECT email AS Email
FROM (
    SELECT email, COUNT(*) AS cnt
    FROM Person
    GROUP BY email
     ) t
WHERE cnt > 1;

# Method 2:
SELECT DISTINCT email
FROM (
    SELECT email,
           COUNT(*) OVER(PARTITION BY email) AS cnt
    FROM Person
    ) t
WHERE cnt > 1;

# Method 3:
SELECT DISTINCT p1.email
FROM Person p1, Person p2
WHERE p1.email = p2.email 
AND p1.id != p2.id;

# Method 4:
SELECT DISTINCT p1.email
FROM Person p1
JOIN Person p2
ON p1.email = p2.email 
AND p1.id != p2.id;
