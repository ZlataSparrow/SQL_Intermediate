with east_regions AS
(select id
from data_sci.company_regions cr
where region_name like '%east%')
select sum(salary),
  round(avg(salary),2)
  from data_sci.employees e2
where e2.region_id in (select id from east_regions)