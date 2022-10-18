--MySQL & MS SQL Server
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (SELECT o.sales_id 
                       FROM orders o
                       JOIN company c ON c.com_id = o.com_id
                       WHERE c.name ='RED');
