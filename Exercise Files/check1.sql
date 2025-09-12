
select * from Activity;



select distinct a1.player_id, a1.device_id
from Activity a1
JOIN (select player_id,
min(event_date) as first_played
from Activity 
group by player_id
order by player_id) a2
ON a1.event_date = a2.first_played

