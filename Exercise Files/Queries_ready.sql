/* LeetCode 183: Duplicate Emails */
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



/* LeetCode 177. Nth Highest Salary */
CREATE OR REPLACE FUNCTION NthHighestSalary(n INT)
RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY
SELECT ranked.salary
FROM (
  SELECT c.salary, RANK() OVER (ORDER BY c.salary DESC) AS s_rank
  FROM check1 c
) ranked
WHERE ranked.s_rank = n
LIMIT 1;
END;
$$ LANGUAGE plpgsql;
SELECT * FROM NthHighestSalary(88);


/* 180. Consecutive Numbers */
SELECT distinct(num) as ConsecutiveNums 
FROM (
    SELECT 
        num,
        id,
        LAG(num, 1) OVER (ORDER BY id) AS p_1,
        LAG(num, 2) OVER (ORDER BY id) AS p_2
    FROM Logs
) sub
WHERE num = p_1 AND num = p_2;



/*184 Leetcode Department Highest Salary*/
select 
d.name as DEPARTMENT,
e.name as EMPLOYEE, 
e.salary
from (
select *,
dense_rank() over (
    PARTITION by departmentid
    order by salary desc) as rank 
from employee) e
JOIN Department d
on e.departmentId=d.id
where rank = 1
order by d.name


/* Leetcode 262.Trips and Users */
Select table_1.request_at as Day,  
case
  when round((cast(table_2.Number_cancelled as numeric) / cast(table_1.Number_requests as numeric)), 2) is null then 0
  else round((cast(table_2.Number_cancelled as numeric) / cast(table_1.Number_requests as numeric)), 2)
end as "Cancellation Rate"
from
(select table_n.request_at, count(*) as Number_requests
from(
    select t.id, t.request_at, t.client_id, t.driver_id, t.status,
     CASE 
       WHEN u.banned = 'Yes' OR u2.banned = 'Yes' THEN 'Yes'
       ELSE  'No'
      END as banned
    from Users u
    join Trips t 
    ON u.users_id = t.driver_id
    join Users u2
    ON u2.users_id = t.client_id
    where u.banned = 'No' and u2.banned = 'No' and t.request_at BETWEEN '2013-10-01' AND '2013-10-03') table_n
group by table_n.request_at) table_1
left join 
(select table_c.request_at, count(*) as Number_cancelled 
from(
    select t.id, t.request_at, t.client_id, t.driver_id, t.status,
     CASE 
       WHEN u.banned = 'Yes' OR u2.banned = 'Yes' THEN 'Yes'
       ELSE  'No'
      END as banned
    from Users u
    join Trips t 
    ON u.users_id = t.driver_id
    join Users u2
    ON u2.users_id = t.client_id
    where t.status IN ('cancelled_by_driver', 'cancelled_by_client') and u.banned = 'No' and u2.banned = 'No' and  t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
) table_c
group by table_c.request_at) table_2
on table_1.request_at=table_2.request_at