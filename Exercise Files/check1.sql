
select * from Trips;
select * from Users;

canc_rate = Number_cancelled/Number_requests

select request_at, count(*)
from trips 
GROUP BY request_at

select t.request_at, count(*) as Number_cancelled 
from Trips t
JOIN Users u
ON t.client_id = u.users_id or t.driver_id=u.users_id
WHERE u.banned='No' AND (t.status IN ('cancelled_by_driver', 'cancelled_by_client'))
GROUP BY t.request_at



select w.request_at, count(*) as Number_requests 
FROM(
    SELECT t.request_at, t.id
    FROM Trips t
    JOIN Users u
    ON t.client_id = u.users_id OR t.driver_id=u.users_id
    WHERE u.banned = 'No'
    GROUP BY t.request_at, t.id
    ) w
GROUP BY w.request_at


SELECT t.request_at, t.id, u.banned
    FROM Trips t
    JOIN Users u
    ON t.client_id = u.users_id OR t.driver_id=u.users_id
    WHERE u.banned = 'No'
    GROUP BY t.request_at, t.id, u.banned

select t.request_at, count(*) as Number_cancelled 
from Trips t
JOIN Users u
ON t.client_id = u.users_id or t.driver_id=u.users_id
WHERE u.banned='No' AND (t.status IN ('cancelled_by_driver', 'cancelled_by_client'))
GROUP BY t.request_at