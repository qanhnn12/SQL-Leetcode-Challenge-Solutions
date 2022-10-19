--MySQL & MS SQL Server
SELECT
    name,
    COALESCE(sum_distance, 0) AS travelled_distance 
FROM Users u
LEFT JOIN (
    SELECT 
        user_id,
        SUM(distance) AS sum_distance
    FROM Rides
    GROUP BY user_id
    ) r
ON u.id = r.user_id
ORDER BY travelled_distance DESC, name;
