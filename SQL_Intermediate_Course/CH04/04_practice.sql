SELECT
cd.department_name,
count(*)
from data_sci.employees e
join data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
having count(*) > 50
ORDER BY cd.department_name 