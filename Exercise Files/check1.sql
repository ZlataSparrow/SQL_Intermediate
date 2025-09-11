
select * from check1


select count(d_rank), d_rank 
from 
(SELECT id, num,
Dense_RANK() OVER (ORDER BY id) AS d_rank
  FROM check1
  order by id) as t
  GROUP BY d_rank;


SELECT id, num,
Dense_RANK() OVER (ORDER BY num) AS d_rank
  FROM check1
  order by id


SELECT id
FROM (
    SELECT 
        num,
        id,
        LAG(num, 1) OVER (ORDER BY id) AS p_1,
        LAG(num, 2) OVER (ORDER BY id) AS p_2
    FROM check1
) sub
WHERE num = p_1 AND num = p_2;

SELECT 
        num,
        id,
        LAG(num, 1) OVER (ORDER BY id) AS p_1,
        LAG(num, 2) OVER (ORDER BY id) AS p_2
    FROM check1