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

