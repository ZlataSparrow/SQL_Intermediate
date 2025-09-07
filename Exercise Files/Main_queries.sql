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
    salary integer,
    primary key (id)
  );

insert into check1 values (1, 100);
insert into check1 values (2, 100);
insert into check1 values (3, 50);


select * from check1;

SELECT 
  MAX(CASE WHEN salary_rank = 2 THEN salary ELSE NULL END) AS SecondHighestSalary,
FROM (
  SELECT 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
  FROM check1
) ranked;


SELECT 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
  FROM check1
