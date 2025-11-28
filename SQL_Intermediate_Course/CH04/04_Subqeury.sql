SELECT round(AVG(salary), 2)
FROM 
(SELECT * FROM data_sci.employees
WHERE salary > 100000) e1


/*SELECT round(AVG(salary), 2)
FROM data_sci.employees
WHERE salary > 100000*/