-- Active: 1757188276987@@localhost@5432

select * from Activity;



select *,
 (
    select 
    lag(event_date) over (PARTITION BY player_id order by event_date) as prev_event_date
    from Activity) as q,
CASE 
    WHEN  q.prev_event_date is null THEN  games_played
    ELSE  game_played - lag(games_played) over (PARTITION BY player_id order by event_date)
END as w
from Activity a1


select *, 
lag(event_date) over (PARTITION BY player_id order by event_date) as prev_event_date,
lag(games_played) over (PARTITION BY player_id order by event_date) as prev_games_played
from Activity
 
select *, 
rank() over (partition by player_id order by event_date) as player_rank,
case
lag(games_played) over (PARTITION BY player_id order by event_date) as prev_games_played
from Activity

select *,
SUM(games_played) over (PARTITION BY player_id order by event_date ROWS)
from (select *, rank() over (partition by player_id order by event_date) as pg_rank
from activity) full_table


select player_id, event_date, 
SUM(games_played) over (PARTITION BY player_id order by event_date) as games_played_so_far
from Activity

Select 
upper(department_name)
from data_sci.company_departments