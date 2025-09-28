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


/* Leetcode 511. Game Play Analysis I */
select player_id,
min(event_date) as first_played
from Activity 
group by player_id
order by player_id


/*Leetcode 512.Game Play Analysis II*/
SELECT player_id, device_id
FROM (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS rn
FROM Activity
) ranked
WHERE rn =1


/*Leetcode 1321 Restaraunt Growth*/
SELECT visited_on, cum_sum as amount, round(cum_sum/7,2) as average_amount
FROM
    (SELECT DISTINCT visited_on,
    SUM(sum) OVER (ORDER BY visited_on ROWS BETWEEN 6 
                        PRECEDING AND CURRENT ROW) AS cum_sum,
    RANK() OVER (ORDER BY visited_on) AS rnk                    
    FROM    
        (SELECT visited_on, SUM(amount) AS sum
        FROM Customer
        GROUP BY visited_on
        ORDER BY visited_on) sub 
    ORDER BY visited_on) sub_s
WHERE rnk > 6       


/*Leetcode 585 Investemnt in 2016*/
select round(CAST(sum(tiv_2016) as numeric),2) as tiv_2016
from Insurance
where CONCAT(lat,lon) not in 
(SELECT CONCAT(lat,lon)
FROM Insurance
GROUP BY CONCAT(lat,lon)
HAVING COUNT(*) > 1) and 
tiv_2015 in (SELECT distinct tiv_2015
from Insurance
group by tiv_2015
HAVING COUNT(*) > 1
order by tiv_2015)


/*Leetcode 1398 Customers Who Bought Products A&B but Not C*/
SELECT o.customer_id, c.customer_name
FROM
(SELECT customer_id
FROM(
SELECT distinct customer_id, product_name
FROM Orders
ORDER by customer_id, product_name) sub
GROUP BY customer_id
HAVING STRING_AGG(product_name,'') LIKE 'AB%' and STRING_AGG(product_name,'') NOT LIKE '%C%'
order by customer_id) o
JOIN Customers c
ON o.customer_id=c.customer_id

