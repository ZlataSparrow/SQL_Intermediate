SELECT
  e.last_name,
  e.email,
  cd.department_name
  FROM
  data_sci.employees e
  JOIN
  data_sci.company_departments cd
ON
  e.department_id = cd.id
WHERE
  salary > 120000;
