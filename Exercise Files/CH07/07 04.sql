SELECT
 e.*,
 cr.*
FROM
  data_sci.employees e
LEFT OUTER JOIN 
  data_sci.company_regions cr 
on 
  e.region_id = cr.id