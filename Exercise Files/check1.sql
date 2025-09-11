
select * from check1





select id, temperature, recorddate,
 lead(recorddate) over (partition by pair_number order by id) as next_recorddate
from (select id, temperature, recorddate,
 ((ROW_NUMBER() OVER (ORDER BY id) - 1) / 2) + 1 AS pair_number
from check1) r

SELECT
    id,
    temperature,
    recordDate,
    LAG(recordDate,1) OVER (PARTITION BY pair_number ORDER BY id) AS next_recorddate,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    CASE 
      WHEN temperature - LAG(temperature) OVER (ORDER BY recordDate) > 1 THEN id
      ELSE NULL
    END AS result
  FROM check1

SELECT id
FROM (
  SELECT
    id,
    temperature,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    CASE 
      WHEN temperature - LAG(temperature) OVER (ORDER BY recordDate) > 1 THEN id
      ELSE NULL
    END AS result
  FROM check1
) sub
WHERE result IS NOT NULL;




select id 
from(
select 
t.id, t.recorddate as tod, t.cur_temp, t.prev_temp,
    CASE 
      WHEN t.cur_temp - t.prev_temp > 1 THEN t.id
      ELSE NULL
    END AS result
from 
(SELECT
    id,
    recorddate,
    temperature as cur_temp,
    recorddate - 1 as yest,
    LAG(temperature) OVER (ORDER BY (recorddate - 1)) AS prev_temp
  FROM check1) t
  left JOIN check1 c ON t.yest = c.recorddate) s
where s.result is not null

SELECT w1.id, w1.recorddate as today, w1.temperature as cur_temp,
       w2.temperature as prev_temp
FROM check1 w1
JOIN check1 w2 
ON w1.recorddate = w2.recorddate + INTERVAL '1 month'
where w1.temperature > w2.temperature



/* LeetCode 183: Duplicate Emails */
delete from check1 
where id NOT IN (
SELECT c1.id
FROM check1 c1
JOIN (
    SELECT email, MIN(id) as min_id
    FROM check1
    GROUP BY email
    HAVING COUNT(*) > 0
) dup ON c1.email = dup.email AND c1.id = dup.min_id)


