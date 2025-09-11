
select * from check1

-- Write your PostgreSQL query statement below
select 
d.name as DEPARTMENT,
e.name as EMPLOYEE, 
e.salary
from Employee e
JOIN Department d
on e.departmentId=d.id
where e.salary =
(select max(salary)
from employee
group by departmentId)
