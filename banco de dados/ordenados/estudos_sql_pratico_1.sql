create table departamento(
id_departamento int primary key,
nome varchar(100) unique not null,
bloco char(1) check(bloco in('A','B','C'))
);
create table curso(
id_curso int primary key,
nome varchar(80) not null,
carga_horaria int check(carga_horaria > 0),
valor_mensalidade decimal(10,2) DEFAULT 0,
status varchar(15) default 'ATIVO',
id_departamento int,
foreign key (id_departamento) references departamento(id_departamento),
constraint statuschk check(status in('ATIVO','INATIVO','EM_ANALISE'))
);
create table aluno(
id_aluno int primary key,
nome varchar(100) not null,
idade int check(idade >= 16 and idade <= 100),
cidade varchar(50),
bolsa decimal(5,2) default 0,
email varchar(100) unique,
data_cadastro date default current_date
);
create table matricula(
id_matricula int primary key,
id_aluno int,
id_curso int,
data_matricula date not null,
situacao varchar(50) default 'ATIVA',
constraint situacaochk check(situacao in('ATIVA','TRANCADA','CANCELADA')),
foreign key (id_aluno) references aluno(id_aluno),
foreign key (id_curso) references curso(id_curso)
);

alter table curso add column vagas int default 30;
alter table curso add constraint vagaMaiorQue0 check(vagas >= 0);
alter table aluno drop column cidade;
alter table aluno rename column bolsa to percentual_bolsa;
alter table curso add constraint nomeUnico unique(nome);

INSERT INTO departamento (id_departamento, nome, bloco) VALUES
(1, 'Tecnologia da Informação', 'A'),
(2, 'Engenharia e Indústria', 'B'),
(3, 'Ciências Humanas', 'C');

INSERT INTO curso (id_curso, nome, carga_horaria, valor_mensalidade, status, id_departamento, vagas) VALUES
(10, 'Sistemas de Informação', 3000, 800.00, 'ATIVO', 1, 40),
(20, 'Análise de Dados', 2000, 650.00, 'INATIVO', 1, 20),
(30, 'Engenharia Mecânica', 4000, 1200.00, 'ATIVO', 2, 35),
(40, 'Design de Produto', 2400, 500.00, 'EM_ANALISE', 2, 15),
(50, 'Psicologia Cognitiva', 3600, 950.00, 'ATIVO', 3, 30);

INSERT INTO aluno (id_aluno, nome, idade, percentual_bolsa, email, data_cadastro) VALUES
(100, 'Ana Silva', 20, 60.00, 'ana@email.com', '2026-05-12'), -- Bolsa > 50
(101, 'Bruno Souza', 22, 0.00, 'bruno@email.com', '2026-05-12'), -- Bolsa = 0
(102, 'Carla Dias', 19, 25.00, 'carla@email.com', '2026-05-12'),
(103, 'Diego Ramos', 25, 0.00, 'diego@email.com', '2026-05-12'),
(104, 'Elena Pires', 30, 75.00, 'elena@email.com', '2026-05-12'),
(105, 'Fabio Lima', 21, 10.00, 'fabio@email.com', '2026-05-12');

INSERT INTO matricula (id_matricula, id_aluno, id_curso, data_matricula, situacao) VALUES
(1001, 100, 10, '2026-02-01', 'ATIVA'),
(1002, 101, 10, '2026-02-01', 'TRANCADA'),
(1003, 102, 30, '2026-02-05', 'CANCELADA'),
(1004, 103, 50, '2026-02-10', 'ATIVA'),
(1005, 104, 50, '2026-02-10', 'ATIVA'),
(1006, 105, 10, '2026-02-12', 'ATIVA'),
(1007, 100, 30, '2026-02-15', 'ATIVA'),
(1008, 102, 50, '2026-02-20', 'TRANCADA');

select a.nome,c.nome,m.situacao from aluno a inner join matricula m on m.id_aluno = a.id_aluno inner join curso c on c.id_curso = m.id_curso order by a.nome;
select id_curso, nome from curso where valor_mensalidade >= 500 and status = 'ATIVO';
select id_aluno, nome from aluno where percentual_bolsa >= 50;
select c.id_curso, c.nome, count(m.id_aluno) from curso c inner join matricula m on m.id_curso = c.id_curso group by c.id_curso,c.nome;
select c.id_curso, c.nome from curso c where not exists(select 1 from matricula m where m.id_curso = c.id_curso);
select id_aluno,nome from aluno where percentual_bolsa > 0
union 
select id_aluno,nome from aluno where percentual_bolsa = 0;
select  max(valor_mensalidade),min(valor_mensalidade),avg(valor_mensalidade) from curso;
select a.id_aluno, a.nome, d.bloco from aluno a inner join matricula m on m.id_aluno = a.id_aluno inner join curso c on c.id_curso = m.id_curso inner join departamento d 
on d.id_departamento = c.id_departamento where d.bloco = 'A';

update curso set valor_mensalidade = valor_mensalidade * 1.10 where status = 'ATIVO';
update curso set status = 'INATIVO' where id_curso not in(select id_curso from matricula);
update matricula set situacao = 'CANCELADA' where id_aluno in(select id_aluno from aluno where percentual_bolsa > 70);
delete from curso
where status = 'INATIVO'
and id_curso not in(
    select id_curso from matricula
);


select * from aluno where idade > (select avg(idade) from aluno);
select c.id_curso, c.nome,count(m.id_aluno) from curso c inner join matricula m on m.id_curso = c.id_curso group by c.id_curso,c.nome having count(m.id_aluno) > 2;
select a.id_aluno, a.nome, count(m.id_curso) from aluno a inner join matricula m on m.id_aluno = a.id_aluno group by a.id_aluno,a.nome having count(m.id_curso) > 1;
select * from curso where valor_mensalidade = (select max(valor_mensalidade) from curso);

create view vw_relatorio_matriculas as
select
a.nome as aluno,
c.nome as curso,
d.nome as departamento,
m.situacao
from matricula m
inner join aluno a
on a.id_aluno = m.id_aluno
inner join curso c
on c.id_curso = m.id_curso
inner join departamento d
on d.id_departamento = c.id_departamento;

create index idx_email_aluno
on aluno(email);

select c.id_curso,c.nome, sum(c.valor_mensalidade - (c.valor_mensalidade * (a.percentual_bolsa/100))) as total_arrecadado from curso c inner join matricula m on c.id_curso = m.id_curso 
inner join aluno a on m.id_aluno = a.id_aluno where m.situacao = 'ATIVA' group by c.id_curso,c.nome ;

select d.id_departamento, d.nome from departamento d where exists(select 1 from curso c where d.id_departamento = c.id_departamento and c.status = 'ATIVO');

select * from aluno where id_aluno not in (select id_aluno from matricula);

alter table aluno add constraint ck_idade_aluno check(idade >= 16 and idade <=100);

delete permite condicão e apaga linhas o truncate apaga todas as linhas e o drop apaga a tabela
