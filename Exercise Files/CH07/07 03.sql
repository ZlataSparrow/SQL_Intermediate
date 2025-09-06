
insert into data_sci.company_regions values (8, 'london', 'uk');
commit;


SELECT
 e.*,
 cr.*
FROM
  data_sci.employees e
RIGHT OUTER JOIN 
  data_sci.company_regions cr 
on 
  e.region_id = cr.id