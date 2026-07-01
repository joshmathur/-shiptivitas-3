-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
SELECT
    date(login_timestamp, 'unixepoch')                        AS day,
    COUNT(DISTINCT user_id)                                   AS daily_active_users,
    CASE
        WHEN date(login_timestamp, 'unixepoch') < '2018-06-02'
        THEN 'Before Kanban'
        ELSE 'After Kanban'
    END                                                       AS period
FROM login_history
GROUP BY day
ORDER BY day;
 

-- PART 2: Create a SQL query that indicates the number of status changes by card

SELECT
    c.id                                    AS card_id,
    c.name                                  AS card_name,
    c.status                                AS current_status,
    COUNT(cch.id)                           AS total_status_changes
FROM card c
LEFT JOIN card_change_history cch
    ON c.id = cch.cardID
    AND cch.oldStatus IS NOT NULL
GROUP BY c.id, c.name, c.status
ORDER BY total_status_changes DESC;



