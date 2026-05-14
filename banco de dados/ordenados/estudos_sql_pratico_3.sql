create table departamentos(
id_departamento int,
nome varchar(80) not null,
bloco char(1),
constraint un_nome unique(nome),
constraint chck_bloco check(bloco in('A','B','C')),
constraint pk_departamentos primary key(id_departamento)
);

create table professores(
id_professor int,
nome varchar(100) not null,
salario decimal(10,2),
titulacao varchar(20),
id_departamento int,
constraint pk_professores primary key(id_professor),
constraint salarioPositivo check(salario > 0),
constraint chk_titulacao check(titulacao in('GRADUACAO','MESTRADO','DOUTORADO')),
constraint fk_departamento foreign key (id_departamento) references departamentos(id_departamento)
);

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT CHECK (carga_horaria > 0),
    id_departamento INT,

    CONSTRAINT fk_curso_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES departamentos(id_departamento)
);
CREATE TABLE alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(120) UNIQUE
);
CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_matricula DATE NOT NULL,
    situacao VARCHAR(20) DEFAULT 'ATIVA',

    CONSTRAINT chk_situacao
        CHECK (situacao IN ('ATIVA', 'TRANCADA', 'CANCELADA')),

    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (id_aluno)
        REFERENCES alunos(id_aluno),

    CONSTRAINT fk_matricula_curso
        FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
);



alter table professores add column email varchar(120);
alter table professores add constraint Un_Email unique(email);
alter table professores rename column titulacao to nivel_academico;
alter table professores alter column nome type varchar(150);

create index nome_aluno on alunos(nome);
create index id_situacao on matriculas(id_curso,situacao);

create view vw_professores_departamentos as select p.nome as nome_professor, p.salario, d.nome as nome_departamento from professores p inner join departamentos d on p.id_departamento = d.id_departamento where p.salario > 5000;

select p.id_professor, p.nome from professores p where p.id_departamento in (select id_departamento from departamentos where bloco = 'A');
select * from cursos c where exists (select 1 from matriculas m where m.id_curso = c.id_curso and m.situacao = 'ATIVA');
select * from alunos a where not exists (select 1 from matriculas m where m.id_aluno = a.id_aluno and m.situacao = 'ATIVA');
select * from professores p where salario > (select avg(salario) from professores pr where p.id_departamento = pr.id_departamento group by pr.id_departamento);
select d.nome, count(p.id_professor) from departamentos d inner join professores p on p.id_departamento = d.id_departamento group by d.nome having count(p.id_professor) > 5;

update professores set salario = salario * 1.10 where id_departamento in(select id_departamento from departamentos where bloco = 'C');
delete from cursos c where not exists (select 1 from matriculas m where c.id_curso = m.id_curso);

select a.nome, c.nome, m.situacao from matriculas m inner join alunos a on a.id_aluno = m.id_aluno inner join cursos c on c.id_curso = m.id_curso;
select c.id_curso,c.nome,m.id_matricula from cursos c left join matriculas m on c.id_curso = m.id_curso;
select d.id_departamento, d.nome, p.id_professor, p.nome from professores p right join departamentos d on d.id_departamento = p.id_departamento;

select * from professores where salario between 3000 and 8000;
select * from alunos where nome like 'A%';
select max(salario),min(salario),avg(salario) from professores;
select c.id_curso,c.nome,count(m.id_aluno) from cursos c inner join matriculas m on c.id_curso = m.id_curso group by c.id_curso,c.nome;

 select nome, case when salario < 3000 then 'BAIXO' when salario between 3000 and 7000 then 'MÉDIO' when salario > 7000 then 'ALTO' else 'Sem salario' end as classificacao from professores;
 
