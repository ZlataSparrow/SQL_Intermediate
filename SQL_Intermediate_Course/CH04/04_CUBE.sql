SELECT 
    cr.country_name, 
    cr.region_name, 
    cd.department_name, 
    count(e.*)
FROM 
    data_sci.employees e
JOIN data_sci.company_regions cr 
    ON e.region_id = cr.id
JOIN data_sci.company_departments cd
    ON e.department_id = cd.id
GROUP BY CUBE(cr.country_name, cr.region_name, cd.department_name)
ORDER BY cr.country_name, cr.region_name, cd.department_name