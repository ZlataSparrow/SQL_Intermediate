SELECT department_id, salary
FROM data_sci.employees e1
WHERE 
(SELECT MAX(salary) FROM data_sci.employees e2) = e1.salary
