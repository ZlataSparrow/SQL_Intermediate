WITH region_salaries AS
  (SELECT 
    region_id, 
    SUM(salary) as region_salary
  FROM data_sci.employees
  GROUP BY region_id),

top_region_salaries AS
  (SELECT
    region_id
   FROM region_salaries
   WHERE region_salary > (SELECT AVG(region_salary) FROM region_salaries))


SELECT * FROM top_region_salaries
WHERE region_id IN (SELECT region_id FROM region_salaries);

