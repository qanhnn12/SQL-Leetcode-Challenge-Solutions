--MySQL & MS SQL Server
UPDATE Salary 
SET sex = CASE sex WHEN 'm' THEN 'f'
                   ELSE 'm' END;
