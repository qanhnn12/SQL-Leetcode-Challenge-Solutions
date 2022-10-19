--MySQL
SELECT 
    t.request_at AS 'Day',
    ROUND(
      SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*)
    , 2) AS 'Cancellation Rate'
FROM Trips t
JOIN Users u1 ON t.client_id = u1.users_id AND u1.banned = 'No'
JOIN Users u2 ON t.driver_id = u2.users_id AND u2.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;


--MS SQL Server
SELECT 
    t.request_at AS 'Day',
    ROUND(
      SUM(1.00*CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) / COUNT(*)
    , 2) AS 'Cancellation Rate'
FROM Trips t
JOIN Users u1 ON t.client_id = u1.users_id AND u1.banned = 'No'
JOIN Users u2 ON t.driver_id = u2.users_id AND u2.banned = 'No'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;
