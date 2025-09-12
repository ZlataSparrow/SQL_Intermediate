
select * from Trips;
select * from Users;





/* Ready for cancelled */
select table_c.request_at, count(*) as Number_cancelled 
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
    where t.status IN ('cancelled_by_driver', 'cancelled_by_client') and u.banned = 'No' and u2.banned = 'No'
) table_c
group by table_c.request_at


/*Ready for requests*/
select table_n.request_at, count(*) as Number_requests
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
    where u.banned = 'No' and u2.banned = 'No') table_n
group by table_n.request_at



select * from Trips 
where client_id not in (2,5)
order by request_at

///Final Query

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
 join 
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
    where t.status IN ('cancelled_by_driver', 'cancelled_by_client') and u.banned = 'No' and u2.banned = 'No' AND 
    t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
) table_c
group by table_c.request_at) table_2
on table_1.request_at=table_2.request_at