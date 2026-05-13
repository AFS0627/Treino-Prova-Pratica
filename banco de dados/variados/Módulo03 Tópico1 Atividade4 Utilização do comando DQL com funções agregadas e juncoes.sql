/*Exiba o salário médio dos funcionários por departamento. Mostre o nome do departamento (DEPARTMENT_NAME) no resultado, além do salário médio .


Liste o maior e o menor salário para cada cargo. Mostre o título da função/cargo (JOB_TITLE) no resultado, além dos valores de menor e maior salário.


Mostre a quantidade de funcionários por cidade. Mostre o nome da cidade (CITY) no resultado, além da quantidade.


Apresente a soma total dos salários por país. Mostre o nome do país (COUNTRY_NAME) no resultado, além da soma de salários.


Exiba a média dos salários dos funcionários por região. Mostre o nome da região (REGION_NAME) no resultado, além da média de salários. Filtre o resultado apresentando apenas as regiões que tenha média de salário menor ou igual a 5000.


Liste quantos funcionários existem em cada departamento e exiba também o nome do departamento.


Mostre a média de salário dos funcionários que trabalham em cada país. Mostre o nome do país e a média de salários no resultado. Filtre o resultado apresentando apenas os países que tenham média de salário superior a 6000.


Apresente, por função/cargo (JOB_TITLE), quantos funcionários recebem comissão (COMMISSION_PCT não nulo).


Mostre, para cada departamento (DEPARTMENT_NAME), o total de salários pagos, o salário médio e a quantidade de funcionários.

Exiba, para cada cidade (CITY), o maior salário, o menor salário e a média dos salários dos funcionários.
*/


1 - select d.department_name, avg(e.salary)
from hr.departments d join hr.employees e on d.department_id = e.department_id
group by d.department_name


2 - select job_title as title, min(min_salary), max(max_salary)
from hr.jobs group by job_title


3 - select l.city, count(e.employee_id)
from hr.locations l
join hr.DEPARTMENTS d
on l.location_id = d.location_id
join hr.employees e
on e.DEPARTMENT_ID = d.department_id
group by l.city

4- select c.country_name, sum(e.salary)
from hr.COUNTRIES c join hr.LOCATIONS l
on l.COUNTRY_ID = c.COUNTRY_ID
join hr.DEPARTMENTS d on d.LOCATION_ID = l.LOCATION_ID
join hr.employees e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
group by c.country_name

5- select r.region_name, avg(e.salary)
from hr.regions r join hr.COUNTRIES c
on r.region_id = c.region_id
join hr.locations l on l.COUNTRY_ID = c.COUNTRY_ID
join hr.DEPARTMENTS d on d.LOCATION_ID = l.LOCATION_ID
join hr.EMPLOYEES e on e.DEPARTMENT_ID = d.DEPARTMENT_ID
group by r.region_name having avg(e.salary) <= 5000

6- select d.department_id, d.department_name, count(e.employee_id) from hr.departments d 
join hr.employees e on d.department_id = e.department_id group by d.department_id, d.department_name;

7- select c.country_id, c.country_name, avg(e.salary) from hr.countries c
join hr.locations l on c.country_id = l.country_id
join hr.departments d on l.location_id = d.LOCATION_ID
join hr.employees e on d.department_id = e.department_id
group by c.country_id,c.country_name having avg(e.salary) > 6000

8- select j.job_id ,j.job_title, count(e.commission_pct) from hr.jobs j 
join hr.employees e on e.job_id = j.job_id group by j.job_id ,j.job_title having count(e.commission_pct) > 0

9- select d.department_id, d.department_name, sum(e.salary), avg(e.salary), count(e.employee_id)
from hr.departments d join hr.employees e on d.department_id = e.department_id
group by d.department_id, d.department_name

10- select l.city, max(e.salary), min(e.salary), avg(e.salary) from hr.locations l
join hr.departments d on l.location_id = d.location_id 
join hr.employees e on d.department_id = e.department_id 
group by l.city 