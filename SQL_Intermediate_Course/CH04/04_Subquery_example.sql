-- Subquery in the SELECT clause

SELECT 
    e1.last_name, 
    e1.salary, 
    e1.department_id,
    (SELECT ROUND(AVG(salary), 2)
    FROM data_sci.employees e2
    WHERE e2.department_id = e1.department_id)

FROM data_sci.employees e1