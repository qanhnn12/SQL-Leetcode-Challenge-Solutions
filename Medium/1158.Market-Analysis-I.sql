--MySQL & MS SQL Server
SELECT 
    u.user_id AS buyer_id,
    u.join_date,
    SUM(CASE WHEN YEAR(o.order_date) = 2019 THEN 1 ELSE 0 END) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.buyer_id
GROUP BY u.user_id, join_date;
