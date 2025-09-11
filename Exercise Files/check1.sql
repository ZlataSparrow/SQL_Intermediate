
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