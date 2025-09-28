03_02


select
   'abcdefghijk'  test_string;


select
   substring('abcdefghijk', 1,3) test_string;


select
   substring('abcdefghijk' from 1 for 3) test_string;


select
   substring('abcdefghijk' from 5) test_string;


select
  *
from
  data_sci.employees;




select
  *
from
  data_sci.employees
where
   job_title like '%assistant%';



select
   job_title, (job_title like '%assistant%') is_assistant
from
  data_sci.employees
where
   job_title like '%assistant%';

