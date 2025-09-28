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
