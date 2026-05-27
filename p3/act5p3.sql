SELECT round((COUNT(distinct a.player_id) / (SELECT COUNT(DISTINCT player_id) FROM activity)),2) AS fraction
FROM (
SELECT *, DATE_ADD(event_date, INTERVAL 1 DAY) AS new_date
FROM activity
) AS a
INNER JOIN activity AS b
ON a.new_date = b.event_date AND a.player_id = b.player_id;