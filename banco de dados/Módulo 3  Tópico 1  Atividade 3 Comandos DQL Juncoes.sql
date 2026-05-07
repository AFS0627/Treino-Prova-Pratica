/*
Liste todos os funcionários e, caso existam, mostre também o nome de seus gerentes. Inclua os funcionários que não possuem gerente.
(Use LEFT JOIN entre a tabela EMPLOYEES e ela mesma, associando EMPLOYEES.MANAGER_ID com EMPLOYEES.EMPLOYEE_ID)

Liste todos os departamentos, incluindo aqueles que não possuem funcionários, e a quantidade de funcionários em cada um.
(Use LEFT JOIN entre DEPARTMENTS e EMPLOYEES com base no DEPARTMENT_ID)

Exiba todos os funcionários e, caso existam, os projetos (job_history) que eles participaram. Inclua os funcionários que nunca participaram de projetos anteriores.
(Use LEFT JOIN entre EMPLOYEES e JOB_HISTORY na coluna EMPLOYEE_ID)

Liste todos os países e, caso existam, seus locais cadastrados. Inclua os países que não possuem nenhum local registrado.
(Utilize LEFT JOIN entre COUNTRIES e LOCATIONS via COUNTRY_ID)

Liste todos os funcionários que trabalharam em algum departamento (registro na tabela JOB_HISTORY) e também os departamentos que nunca tiveram histórico de funcionários.
(Aqui o ideal é usar RIGHT JOIN entre JOB_HISTORY e DEPARTMENTS através do DEPARTMENT_ID para garantir que departamentos sem histórico também apareçam)
*/

1- SELECT e.first_name || ' ' || e.last_name AS funcionario, m.first_name || ' ' ||
m.last_name AS gerente FROM hr.employees e LEFT JOIN hr.employees m ON e.manager_id
= m.employee_id;

2 - SELECT d.department_name, COUNT(e.employee_id) AS total_funcionarios FROM
hr.departments d LEFT JOIN hr.employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

3- select e.employee_id,e.FIRST_NAME || ' ' || e.LAST_NAME as nome, h.job_id from
hr.employees e left join hr.JOB_HISTORY h on e.EMPLOYEE_ID = h.EMPLOYEE_ID

4- select c.country_name, l.street_address from hr.COUNTRIES c left join
hr.LOCATIONS l on c.country_id = l.country_id

5- SELECT j.employee_id, d.department_name FROM hr.job_history j RIGHT JOIN hr.departments d
ON j.department_id = d.department_id;