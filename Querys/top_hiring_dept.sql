SELECT  
  d.id,
  d.department,
  count(e.id) as hired
FROM `laboratory-385919.HRDB.department` d 
inner join `HRDB.hired_employees` e
on d.id = e.department_id
group by d.id, d.department
having count(e.id) >= avg(e.id)