SELECT e1.department_id, SUM(salary), count(*)
FROM data_sci.employees e1
GROUP BY e1.department_id
HAVING SUM(salary) > 5000000
ORDER BY SUM(salary) DESC
