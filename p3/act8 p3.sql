select s.user_id, ROUND(IFNULL(SUM(c.action = 'confirmed') / COUNT(c.user_id),0),2)
as confirmation_rate
from Signups as s
Left join Confirmations as c
on s.user_id = c.user_id
GROUP BY s.user_id