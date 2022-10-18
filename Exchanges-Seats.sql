--MySQL & MS SQL Server
SELECT
    (CASE
        WHEN id%2 != 0 AND counts != id THEN id + 1   -- odd number, not the last id
        WHEN id%2 != 0 AND counts = id THEN id        -- odd number, the last id
        ELSE id - 1                                   -- even number
     END) AS id,
    student
FROM seat, (SELECT COUNT(*) AS counts FROM seat) AS seat_counts
ORDER BY id ASC;
