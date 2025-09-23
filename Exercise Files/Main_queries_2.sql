SELECT ltrim(rtrim(' Kelly ')) = 'Kelly'

SELECT (' Kelly') = 'Kelly'


SELECT
    job_title ||'_' || last_name
    FROM data_sci.employees

SELECT
    job_title ||'_' || NULL
    FROM data_sci.employees

