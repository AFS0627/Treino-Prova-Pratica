create table departamento(
id_departamento int primary key,
nome varchar(50) unique,
bloco char(1)
);

create table professor(
id_professor int primary key,
nome varchar(100),
salario decimal(10,2) check(salario > 0),
id_departamento int,
foreign key (id_departamento) references departamento(id_departamento)
);

create table disciplina(
id_disciplina int primary key,
nome varchar(50),
carga_horaria int check(carga_horaria > 0),
id_professor int,
foreign key (id_professor) references professor(id_professor)
);

create table aluno(
id_aluno int primary key,
nome varchar(100),
idade int check (idade >= 16),
sexo char(1) check (sexo in('M', 'F'))
);

create table matricula(
id_aluno int,
id_disciplina int,
nota float check (nota >= 0 and nota <= 10),
faltas int check (faltas >= 0),
foreign key (id_aluno) references aluno(id_aluno),
foreign key (id_disciplina) references disciplina(id_disciplina),
primary key (id_aluno, id_disciplina)
);

alter table aluno add column email varchar(50) unique;
alter table disciplina add column turno varchar(10) check (turno in('MATUTINO','NOTURNO'));
alter table professor alter column nome set data type varchar(150);
alter table departamento drop column bloco;

select a.nome, d.nome,p.nome, m.nota from aluno a inner join matricula m on a.id_aluno = m.id_aluno inner join disciplina d on d.id_disciplina = m.id_disciplina 
inner join professor p on p.id_professor = d.id_professor inner join departamento de on de.id_departamento = p.id_departamento;

select d.id_disciplina, d.nome, avg(m.nota) from disciplina d inner join matricula m on m.id_disciplina = d.id_disciplina group by d.id_disciplina, d.nome;

select d.id_disciplina, d.nome, avg(m.nota) from disciplina d inner join matricula m on m.id_disciplina = d.id_disciplina group by d.id_disciplina, d.nome having avg(m.nota) > 7;

select d.id_disciplina, d.nome, count (m.id_aluno) from disciplina d inner join matricula m on m.id_disciplina = d.id_disciplina group by d.id_disciplina, d.nome;

select d.id_disciplina, d.nome, sum (m.faltas) from disciplina d inner join matricula m on m.id_disciplina = d.id_disciplina group by d.id_disciplina, d.nome;

select id_aluno, nome from aluno where id_aluno in(select id_aluno from matricula where nota = (select max(nota) from matricula));

select p.id_professor, p.nome from professor p where p.id_professor in (select id_professor from disciplina where carga_horaria > (select avg(carga_horaria) from disciplina));

select a.id_aluno, a.nome from aluno a where exists (select 1 from matricula m where a.id_aluno = m.id_aluno);

select p.id_professor, p.nome from professor p left join disciplina d on d.id_professor = p.id_professor where d.id_disciplina is null;

select * from disciplina where nome like '%BANCO%';

select * from aluno where idade between 18 and 25;

select a.nome, m.nota from aluno a inner join matricula m on m.id_aluno = a.id_aluno order by m.nota desc, a.nome asc;

update professor set salario = salario * 1.15 where id_professor in (select d.id_professor from disciplina d inner join matricula m on d.id_disciplina = m.id_disciplina group by d.id_professor having avg(m.nota > 8));

delete from matricula where nota < (select avg(nota) from matricula);

select d.id_disciplina, d.nome, count(m.id_aluno) from disciplina d left join matricula m on d.id_disciplina = m.id_disciplina group by d.id_disciplina, d.nome;

select nome from aluno
union 
select nome from professor;

select nome from aluno
union all
select nome from professor;

select nome, 'ALUNO' as tipo  from aluno  
union all
select  nome, 'PROFESSOR' as tipo from professor;


select nome, 'ALUNO' as tipo  from aluno
union all
select  nome, 'PROFESSOR' as tipo from professor order by nome;

select * from aluno where id_aluno in (select a.id_aluno from matricula a inner join disciplina p on p.id_disciplina = a.id_disciplina where p.turno = 'NOTURNO');

select p.id_professor, p.nome
from professor p
where exists
(
   select 1
   from disciplina d
   inner join matricula m
      on m.id_disciplina = d.id_disciplina
   where d.id_professor = p.id_professor
   group by d.id_disciplina
   having count(m.id_aluno) > 5
);