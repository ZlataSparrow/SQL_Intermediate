SELECT 
e.*,
cd.*
FROM data_sci.employees e
FULL OUTER JOIN data_sci.company_departments cd
ON e.department_id = cd.id;