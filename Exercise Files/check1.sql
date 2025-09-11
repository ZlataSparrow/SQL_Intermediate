
select * from check1


SELECT id, num,
Dense_RANK() OVER (ORDER BY num) AS d_rank
  FROM check1 c
  order by id;

