SELECT count(*), min(salary) , max(salary)
FROM data_sci.employees

SELECT count(*), min(id) , max(id)
FROM data_sci.employees

SELECT *
FROM data_sci.employees
LIMIT 1000

SELECT department_id, SUM(salary), ROUND(AVG(SALARY),2)
FROM data_sci.employees
GROUP BY department_id

SELECT department_id, SUM(salary), 
ROUND(AVG(SALARY),2) AVG_SALARY, 
ROUND(VAR_POP(SALARY),2) VAR_SALARY,
round(stddev_pop(salary),2) stddev_salary
FROM data_sci.employees
GROUP BY department_id

SELECT last_name, department_id
FROM data_sci.employees
WHERE last_name = 'boyd'

SELECT last_name, department_id
FROM data_sci.employees
WHERE last_name LIKE 'b%'

SELECT last_name, department_id
FROM data_sci.employees
WHERE last_name LIKE 'b%d'

SELECT last_name, department_id
FROM data_sci.employees
where last_name LIKE 'bo%'

SELECT last_name, department_id
FROM data_sci.employees
WHERE last_name LIKE 'b%' AND salary > 100000

SELECT last_name, department_id
FROM data_sci.employees
where last_name LIKE 'b%' OR salary > 100000

SELECT sum(salary)
FROM data_sci.employees
WHERE salary > 100000

SELECT department_id, sum(salary)
FROM data_sci.employees
WHERE salary > 100000
GROUP BY department_id

SELECT e.*, cr.region_name, cr.country_name
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON cr.id = e.region_id

SELECT e.*, cr.region_name, cr.country_name
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON cr.id = e.region_id
WHERE cr.country_name = 'canada'

SELECT e.last_name, e.email, e.start_date, e.salary, e.job_title,
       cr.region_name, cr.country_name
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON cr.id = e.region_id
WHERE cr.country_name = 'canada'

SELECT e.last_name, e.email, cd.department_name
FROM data_sci.employees e
JOIN data_sci.company_departments cd
ON cd.id = e.department_id
WHERE e.salary > 120000

SELECT e.id, e.salary,
       rank() over(ORDER BY e.salary DESC) AS rank
FROM data_sci.employees as e
WHERE e.salary > 120000

create table check1 (
  id integer,
  name CHAR(50),
  salary integer,
  departmentId INTEGER,
  primary key (id)
  );

 create table check1 (
  id integer,
  num integer
  ); 

DROP TABLE check1;
INSERT INTO check1 (id, num) VALUES (1, 1);
INSERT INTO check1 (id, num) VALUES (2, 1);
INSERT INTO check1 (id, num) VALUES (3, 1);
INSERT INTO check1 (id, num) VALUES (4, 2);
INSERT INTO check1 (id, num) VALUES (5, 1);
INSERT INTO check1 (id, num) VALUES (6, 2);
INSERT INTO check1 (id, num) VALUES (7, 2);


insert into check1 values (1, '2015-12-14','3');
delete from check1 where id = 1;
insert into check1 values (2, '2015-12-16','5');
delete from check1 where id = 2;
insert into check1 values (1, '100');
insert into check1 values (2, '100');
insert into check1 values (2, '200');
insert into check1 values (3, '300');
insert into check1 values (4, '30');
delete from check1 where id = 4;


INSERT INTO check1 (id, salary) VALUES (12, 761);
INSERT INTO check1 (id, salary) VALUES (6, 1037);
INSERT INTO check1 (id, salary) VALUES (87, 38);
INSERT INTO check1 (id, salary) VALUES (1, 786);
INSERT INTO check1 (id, salary) VALUES (39, 1762);
INSERT INTO check1 (id, salary) VALUES (65, 133);
INSERT INTO check1 (id, salary) VALUES (25, 2529);
INSERT INTO check1 (id, salary) VALUES (96, 403);
INSERT INTO check1 (id, salary) VALUES (8, 4333);
INSERT INTO check1 (id, salary) VALUES (11, 3164);
INSERT INTO check1 (id, salary) VALUES (5, 831);
INSERT INTO check1 (id, salary) VALUES (18, 3579);
INSERT INTO check1 (id, salary) VALUES (66, 4778);
INSERT INTO check1 (id, salary) VALUES (26, 4826);
INSERT INTO check1 (id, salary) VALUES (82, 4957);
INSERT INTO check1 (id, salary) VALUES (63, 1288);
INSERT INTO check1 (id, salary) VALUES (64, 2711);
INSERT INTO check1 (id, salary) VALUES (73, 1842);
INSERT INTO check1 (id, salary) VALUES (2, 2627);
INSERT INTO check1 (id, salary) VALUES (78, 1908);
INSERT INTO check1 (id, salary) VALUES (22, 4667);
INSERT INTO check1 (id, salary) VALUES (77, 199);
INSERT INTO check1 (id, salary) VALUES (69, 576);
INSERT INTO check1 (id, salary) VALUES (32, 2638);
INSERT INTO check1 (id, salary) VALUES (79, 510);
INSERT INTO check1 (id, salary) VALUES (23, 622);
INSERT INTO check1 (id, salary) VALUES (43, 2491);
INSERT INTO check1 (id, salary) VALUES (44, 4435);
INSERT INTO check1 (id, salary) VALUES (28, 4552);
INSERT INTO check1 (id, salary) VALUES (86, 4646);
INSERT INTO check1 (id, salary) VALUES (57, 451);
INSERT INTO check1 (id, salary) VALUES (13, 1852);
INSERT INTO check1 (id, salary) VALUES (62, 2835);
INSERT INTO check1 (id, salary) VALUES (72, 544);
INSERT INTO check1 (id, salary) VALUES (37, 2896);
INSERT INTO check1 (id, salary) VALUES (89, 4699);
INSERT INTO check1 (id, salary) VALUES (71, 220);
INSERT INTO check1 (id, salary) VALUES (46, 2333);
INSERT INTO check1 (id, salary) VALUES (95, 2261);
INSERT INTO check1 (id, salary) VALUES (48, 3210);
INSERT INTO check1 (id, salary) VALUES (17, 398);
INSERT INTO check1 (id, salary) VALUES (20, 57);
INSERT INTO check1 (id, salary) VALUES (74, 176);
INSERT INTO check1 (id, salary) VALUES (54, 4272);
INSERT INTO check1 (id, salary) VALUES (35, 2172);
INSERT INTO check1 (id, salary) VALUES (84, 4686);
INSERT INTO check1 (id, salary) VALUES (42, 2595);
INSERT INTO check1 (id, salary) VALUES (76, 3631);
INSERT INTO check1 (id, salary) VALUES (45, 4022);
INSERT INTO check1 (id, salary) VALUES (68, 3248);
INSERT INTO check1 (id, salary) VALUES (40, 571);
INSERT INTO check1 (id, salary) VALUES (14, 4094);
INSERT INTO check1 (id, salary) VALUES (51, 3272);
INSERT INTO check1 (id, salary) VALUES (97, 2057);
INSERT INTO check1 (id, salary) VALUES (30, 2505);
INSERT INTO check1 (id, salary) VALUES (88, 3805);
INSERT INTO check1 (id, salary) VALUES (55, 4926);
INSERT INTO check1 (id, salary) VALUES (81, 3423);
INSERT INTO check1 (id, salary) VALUES (7, 811);
INSERT INTO check1 (id, salary) VALUES (52, 4664);
INSERT INTO check1 (id, salary) VALUES (33, 1842);
INSERT INTO check1 (id, salary) VALUES (41, 4645);
INSERT INTO check1 (id, salary) VALUES (50, 1490);
INSERT INTO check1 (id, salary) VALUES (24, 3361);
INSERT INTO check1 (id, salary) VALUES (59, 4504);
INSERT INTO check1 (id, salary) VALUES (99, 805);
INSERT INTO check1 (id, salary) VALUES (67, 4561);
INSERT INTO check1 (id, salary) VALUES (61, 4641);
INSERT INTO check1 (id, salary) VALUES (38, 2542);
INSERT INTO check1 (id, salary) VALUES (94, 4361);
INSERT INTO check1 (id, salary) VALUES (15, 1652);
INSERT INTO check1 (id, salary) VALUES (70, 1903);
INSERT INTO check1 (id, salary) VALUES (10, 2109);
INSERT INTO check1 (id, salary) VALUES (49, 1428);
INSERT INTO check1 (id, salary) VALUES (29, 558);
INSERT INTO check1 (id, salary) VALUES (60, 708);
INSERT INTO check1 (id, salary) VALUES (3, 1717);
INSERT INTO check1 (id, salary) VALUES (0, 3162);
INSERT INTO check1 (id, salary) VALUES (75, 1450);
INSERT INTO check1 (id, salary) VALUES (83, 2333);
INSERT INTO check1 (id, salary) VALUES (47, 455);
INSERT INTO check1 (id, salary) VALUES (9, 2360);
INSERT INTO check1 (id, salary) VALUES (56, 1570);
INSERT INTO check1 (id, salary) VALUES (80, 1677);
INSERT INTO check1 (id, salary) VALUES (27, 508);
INSERT INTO check1 (id, salary) VALUES (21, 3994);
INSERT INTO check1 (id, salary) VALUES (85, 2276);
INSERT INTO check1 (id, salary) VALUES (91, 1606);
INSERT INTO check1 (id, salary) VALUES (90, 2269);
INSERT INTO check1 (id, salary) VALUES (58, 1954);
INSERT INTO check1 (id, salary) VALUES (19, 774);
INSERT INTO check1 (id, salary) VALUES (4, 655);
INSERT INTO check1 (id, salary) VALUES (92, 3274);
INSERT INTO check1 (id, salary) VALUES (16, 333);
INSERT INTO check1 (id, salary) VALUES (36, 1744);
INSERT INTO check1 (id, salary) VALUES (53, 2262);
INSERT INTO check1 (id, salary) VALUES (93, 3887);
INSERT INTO check1 (id, salary) VALUES (31, 3521);
INSERT INTO check1 (id, salary) VALUES (34, 1415);
INSERT INTO check1 (id, salary) VALUES (98, 2490);


insert into check1 values (5, '2015-01-05','max@example.com');
insert into check1 values (6, '2015-01-06','max@example.com');
delete from check1 where id=6;


CREATE TABLE Trips (
  id INTEGER PRIMARY KEY,
  client_id INTEGER,
  driver_id INTEGER,
  city_id INTEGER,
  status VARCHAR(30),
  request_at DATE
);

INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'cancelled_by_client', '2013-10-04')


///

INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');



INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03'),
(11, 3, 10, 6, 'cancelled_by_driver', '2013-10-02'),
(12, 5, 12, 12, 'cancelled_by_client', '2013-10-01'),
(13, 4, 13, 1, 'cancelled_by_driver', '2013-10-03');


CREATE TABLE Users (
  users_id INTEGER PRIMARY KEY,
  banned VARCHAR(10),
  role VARCHAR(10)
);

INSERT INTO Users (users_id, banned, role) VALUES 
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');


INSERT INTO Users (users_id, banned, role) VALUES 
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(5, 'Yes', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

INSERT INTO Users (users_id, banned, role) VALUES 
(1, 'No', 'client'),
(10, 'No', 'driver');

DROP TABLE Users;
DROP TABLE Trips;

DELETE FROM check1
WHERE id in (1,2,3);

select * from check1;
select * from check2;

-- Write your PostgreSQL query statement below
select d.name as Department, e.name as Employee, e.salary as Salary
from check1 e
join check2 d
on e.departmentId=d.id
where Salary in (select max(salary) 
from check1 e
group by e.departmentId
)


select e.name as Employee, e.salary as Salary
from check1 e
where (e.salary, e.name) in (
  select max(e.salary), e.name
  from check1 e
  group by e.departmentId
)



select max(e.salary) 
from check1 e
group by e.departmentId;


SELECT 
  MAX(CASE WHEN salary_rank = 2 THEN salary ELSE NULL END) AS SecondHighestSalary
FROM (
  SELECT 
    salary,
    RANK() OVER (ORDER BY  salary DESC, id DESC) AS salary_rank
  FROM check1
) ranked;


SELECT 
salary, 
COUNT(*) AS count,
RANK() OVER (ORDER BY  salary DESC) AS salary_rank
FROM check1
GROUP BY salary
HAVING COUNT(*) > 1;



SELECT 
  MAX(
    CASE 
      WHEN salary_rank = 1 AND count = 1 THEN Null
      WHEN salary_rank = 1 AND count = 2 THEN next_salary
      WHEN salary_rank = 2 AND count = 2 THEN salary
      WHEN salary_rank = 2 AND count = 1 THEN salary
      ELSE NULL
    END
  ) AS SecondHighestSalary
FROM (
  SELECT 
    salary, 
    COUNT(*) AS count,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank,
    LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
  FROM check1
  GROUP BY salary
) sub;


SELECT 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank,
    COUNT(*) AS count,
    LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
  FROM check1
  GROUP BY salary




SELECT 
  salary,
  ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_rank
FROM check1;

SELECT *
FROM check1
WHERE id IN (
  SELECT id
  FROM check1
  GROUP BY id
  HAVING COUNT(*) > 1
);
