/*Criar tabela departamento

Campos:

id_departamento
nome
orçamento

Restrições:

PK
orçamento > 0
nome UNIQUE
Criar tabela funcionario

Campos:

id_funcionario
nome
salario
idade
id_departamento

Restrições:

PK
FK
salario > 0
idade >= 18
Criar tabela projeto

Campos:

id_projeto
nome
duração_meses

Restrições:

PK
duração > 0
Criar tabela funcionario_projeto

Tabela associativa.

Campos:

id_funcionario
id_projeto
horas_trabalhadas

Restrições:

PK composta
FKs
horas > 0
🔥 PARTE 2 — DML
A) INSERTS

Inserir:

3 departamentos
6 funcionários
4 projetos
10 relações funcionário_projeto
🔥 PARTE 3 — CONSULTAS
1) INNER JOIN triplo

Listar:

funcionário
departamento
projeto
2) LEFT JOIN

Mostrar:

todos departamentos
mesmo os sem funcionários
3) GROUP BY

Mostrar:

média salarial por departamento
4) HAVING

Mostrar departamentos:

com média salarial > 4000
5) COUNT + GROUP BY

Mostrar:

quantidade de funcionários por projeto
6) SUM

Mostrar:

total de horas trabalhadas por projeto
7) Subquery pesada

Mostrar:

funcionário(s) com maior salário
8) Subquery com IN

Mostrar:

funcionários que trabalham em projetos com duração > 12 meses
9) UPDATE com condição

Aumentar em:

10%

o salário dos funcionários:

do departamento de TI
10) DELETE com subquery

Remover:

funcionários sem participação em projetos
🔥 PARTE 4 — CONSULTAS AVANÇADAS
11) LIKE

Mostrar funcionários:

cujo nome começa com “A”
12) BETWEEN

Mostrar:

funcionários com salário entre 3000 e 6000
13) ORDER BY múltiplo

Ordenar:

salário desc
nome asc
14) AVG + MAX + MIN

Mostrar:

maior salário
menor salário
média salarial*/

create table departamento(
id_departamento int primary KEY,
nome varchar(100) unique,
orcamento decimal(10,2) check (orcamento > 0)
);

create table funcionario(
id_funcionario int primary key,
nome varchar(100),
salario decimal(10,2) check (salario > 0),
idade int check (idade >= 18),
id_departamento int,
foreign key (id_departamento) references departamento(id_departamento)
);

create table projeto(
id_projeto int primary key,
nome varchar(100),
duracao_meses int check (duracao_meses > 0)
);

create table funcionario_projeto(
id_funcionario int,
id_projeto int,
horas_trabalhadas int check (horas_trabalhadas > 0),
foreign key (id_funcionario) references funcionario(id_funcionario),
foreign key (id_projeto) references projeto(id_projeto),
primary key (id_funcionario, id_projeto)
);

INSERT INTO departamento
(id_departamento, nome, orcamento)
VALUES
(1, 'TI', 150000.00),
(2, 'RH', 80000.00),
(3, 'Financeiro', 120000.00);

INSERT INTO funcionario
(id_funcionario, nome, salario, idade, id_departamento)
VALUES
(1, 'Arthur', 5500.00, 20, 1),
(2, 'Amanda', 4200.00, 22, 1),
(3, 'Leticia', 3500.00, 25, 2),
(4, 'Eduarda', 6100.00, 30, 3),
(5, 'Sofia', 4700.00, 27, 1),
(6, 'Carlos', 2800.00, 19, 2);

INSERT INTO projeto
(id_projeto, nome, duracao_meses)
VALUES
(1, 'Sistema Hospitalar', 18),
(2, 'Portal RH', 8),
(3, 'Controle Financeiro', 24),
(4, 'Aplicativo Mobile', 10);

INSERT INTO funcionario_projeto
(id_funcionario, id_projeto, horas_trabalhadas)
VALUES
(1, 1, 120),
(1, 3, 80),
(2, 1, 60),
(2, 4, 50),
(3, 2, 90),
(4, 3, 140),
(5, 1, 100),
(5, 4, 40),
(6, 2, 70),
(6, 4, 30);

select d.nome, p.nome, f.nome from departamento d join funcionario f on d.id_departamento = f.id_departamento join funcionario_projeto fp on fp.id_funcionario = f.id_funcionario 
join projeto p on p.id_projeto = fp.id_projeto;

select d.nome, f.nome from departamento d left join funcionario f on f.id_departamento = d.id_departamento;

select d.nome, avg(f.salario) from departamento d join funcionario f on f.id_departamento = d.id_departamento group by d.nome;
select d.nome, avg(f.salario) from departamento d join funcionario f on f.id_departamento = d.id_departamento group by d.nome having avg(f.salario) > 4000;
select p.nome, count(pf.id_funcionario) from projeto p join funcionario_projeto pf on p.id_projeto = pf.id_projeto group by(p.nome);
select p.nome, sum(pf.horas_trabalhadas) from projeto p join funcionario_projeto pf on pf.id_projeto = p.id_projeto group by(p.nome);
select * from funcionario where salario = (select max(salario) from funcionario);
select * from funcionario where id_funcionario in (select f.id_funcionario from funcionario f join funcionario_projeto fp on fp.id_funcionario = f.id_funcionario
join projeto p on p.id_projeto = fp.id_projeto where p.duracao_meses > 12);

update funcionario set salario = salario * 1.10 where id_departamento = 1;
delete from funcionario where id_funcionario not in (select id_funcionario from funcionario_projeto);

select * from funcionario where nome like 'A%';
select * from funcionario where salario between 3000 and 6000;
select * from funcionario order by salario desc, nome asc; 
select max(salario),min(salario), avg(salario) from funcionario;



