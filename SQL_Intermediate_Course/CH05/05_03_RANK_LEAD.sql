select
   last_name,
   salary,
   rank() over (order by salary desc)
from
   data_sci.employees;


select
   department_id,
   last_name,
   salary,
   rank() over (partition by department_id order by salary desc)
from
   data_sci.employees;


select
   department_id,
   last_name,
   salary,
   dense_rank() over (partition by department_id order by salary desc) as rank_dense
from
   data_sci.employees;


select
   department_id,
   last_name,
   salary,
   row_number() over (partition by department_id order by salary desc) as row_number
from
   data_sci.employees;


select
   department_id,
   last_name,
   salary,
   lead(salary) over (partition by department_id order by salary desc)
from
   data_sci.employees;




select
   department_id,
   last_name,
   salary,
   lead(salary,3) over (partition by department_id order by salary desc)
from
   data_sci.employees;


select
   department_id,
   last_name,
   salary,
   lag(salary,3) over (partition by department_id order by salary desc)
from
   data_sci.employees;


select
   department_id,
   last_name,
   salary,
   lag(salary) over (partition by department_id order by salary desc)
from
   data_sci.employees;