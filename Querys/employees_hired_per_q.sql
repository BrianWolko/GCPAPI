SELECT * FROM(
SELECT
  d.department,
  j.jobs,
  count(distinct e.id)                              as employees_per_q,
  CEIL(CAST(substr(e.datetime, 6,2) AS NUMERIC) /4) as q
from `HRDB.hired_employees` e 
inner join `HRDB.department` d 
on e.department_id = d.id
inner join `HRDB.jobs` j
on j.id = e.job_id
group by CEIL(CAST(substr(datetime, 6,2) AS NUMERIC) /4), d.department, j.jobs
)
PIVOT
(
  sum(employees_per_q) as Q
FOR q in (1, 2, 3, 4)
)