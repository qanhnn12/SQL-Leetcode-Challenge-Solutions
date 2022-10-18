--MySQL & MS SQL Server
---Method 1:
SELECT name AS Customers 
FROM Customers
WHERE id NOT IN (SELECT customerId  
                 FROM Orders);
                 
---Method 2:
SELECT name AS Customers
FROM Customers c
LEFT JOIN Orders o 
ON c.id = o.customerId
WHERE o.CustomerId IS NULL;

---Method 3:
SELECT name AS Customers 
FROM Customers c
WHERE NOT EXISTS (
    SELECT customerId 
    FROM Orders o
    WHERE c.id = o.customerId);
