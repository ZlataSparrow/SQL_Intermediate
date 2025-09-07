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
ROUND(VAR_POP(SALARY),2) VAR_SALARY
FROM data_sci.employees
GROUP BY department_id
