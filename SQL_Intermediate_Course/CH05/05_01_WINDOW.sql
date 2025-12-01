select
   department_id,
   last_name,
   salary,
   first_value(salary) 
   OVER (PARTITION BY department_id ORDER BY salary) as min
from
   data_sci.employees;


select distinct department_id, min
from
(select
   department_id,
   last_name,
   salary,
   first_value(salary) 
   OVER (PARTITION BY department_id ORDER BY salary) as min
from
   data_sci.employees) sub
order by department_id
