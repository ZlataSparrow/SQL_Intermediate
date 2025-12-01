SELECT 
    department_id,
    last_name,
    salary,
    SUM(salary) OVER (PARTITION BY department_id) as total_salary_by_departemnt
FROM data_sci.employees;


SELECT department_id, 
SUM(salary) as total_salary_by_departemnt
FROM data_sci.employees
GROUP BY department_id