SELECT 
    cr.country_name,cr.region_name,count(e.*)
FROM data_sci.employees e 
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
GROUP BY cr.country_name, cr.region_name;

SELECT 
    cr.country_name,cr.region_name,count(e.*)
FROM data_sci.employees e 
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
GROUP BY ROLLUP(cr.country_name, cr.region_name)
ORDER BY cr.country_name, cr.region_name;

