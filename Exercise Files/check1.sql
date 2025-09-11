
select * from check1



/* LeetCode 183: Duplicate Emails */
select id, temperature, recorddate,
recorddate+1 as qw,
((ROW_NUMBER() OVER (ORDER BY id) - 1) / 2) + 1 AS pair_number
from check1

select id, temporature,

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

SELECT
    id,
    recorddate,
    recorddate - 1 as yest,
    temperature,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    CASE 
      WHEN temperature - LAG(temperature) OVER (ORDER BY recordDate) > 1 THEN id
      ELSE NULL
    END AS result
  FROM check1  


select 
id,
from 
(SELECT
    id,
    recorddate,
    recorddate - 1 as yest,
    temperature
  FROM check1) t





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


