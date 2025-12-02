SELECT 
    SUM(salary),
    round(avg(salary),2)
FROM data_sci.employees e2
WHERE e2.region_id IN 
    (SELECT id 
    FROM data_sci.company_regions cr 
    WHERE cr.region_name LIKE '%east%');



WITH east AS
(   SELECT id 
    FROM data_sci.company_regions cr 
    WHERE cr.region_name LIKE '%east%')

SELECT SUM(salary),
    round(avg(salary),2)
FROM data_sci.employees e
WHERE e.region_id IN (SELECT id FROM east)
