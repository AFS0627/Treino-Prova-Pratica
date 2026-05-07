/*Um sistema acadêmico precisa armazenar informações de alunos e cursos.

📌 Parte 1 – DDL (1,0 ponto)

Crie as tabelas:

Tabela: Curso
id_curso (INT, PK)
nome (VARCHAR, NOT NULL)
carga_horaria (INT, CHECK > 0)
Tabela: Aluno
id_aluno (INT, PK)
nome (VARCHAR, NOT NULL)
idade (INT, CHECK >= 16)
id_curso (FK → Curso)
📌 Parte 2 – DML (4,0 pontos)
1) Inserção
Insira:
3 cursos
5 alunos
2) SELECT com JOIN

Liste:

nome do aluno
nome do curso
3) Filtro com condição

Liste alunos:

com idade entre 18 e 25
4) Agregação (GROUP BY)

Mostre:

quantidade de alunos por curso
5) HAVING (nível alto)

Liste cursos que possuem:

mais de 1 aluno
6) Subquery (nível pesado)

Liste alunos que estão no curso com:

maior carga horária
7) UPDATE
Aumente a idade de todos os alunos em +1
8) DELETE
Remova alunos com idade menor que 18 */



create table curso(
id_curso int primary key,
nome varchar(100) not NULL,
carga_horaria int check (carga_horaria > 0)
);

create table aluno(
id_aluno int primary key,
nome varchar(100) not null,
idade int check (idade >= 16),
id_curso INT,
foreign key (id_curso) references curso(id_curso)
);

insert into curso (id_curso, nome, carga_horaria) values (1, 'TI', 40),
(2,'ADM',30),
(3,'ADS',50);

insert into aluno (id_aluno, nome, idade, id_curso) values (1,'Arthur',19,3),
(2,'Amanda',20,2),
(3,'Leticia',19,3),
(4,'Eduarda',20,1),
(5,'Sofia',19,3);

select a.nome, c.nome from curso c join aluno a on a.id_curso = c.id_curso;
select * from aluno where idade > 18 and idade < 25;
select c.id_curso, c.nome, count(a.id_aluno) as totalAlunos from curso c join aluno a on a.id_curso = c.id_curso group by c.id_curso, c.nome; 
select c.id_curso, c.nome, count(a.id_aluno) as totalAlunos from curso c join aluno a on a.id_curso = c.id_curso group by c.id_curso, c.nome having count(a.id_aluno) > 1;
select a.id_aluno, a.nome, c.id_curso, c.nome, c.carga_horaria from aluno a join curso c on a.id_curso = c.id_curso where c.carga_horaria = (select max(carga_horaria) from curso);

update aluno set idade = idade + 1;

delete from aluno where idade < 18;  

  