create table aluno(
id_aluno int primary key,
nome varchar(100),
curso varchar(50),
periodo varchar(20)
);

create table livro(
id_livro int primary key,
titulo varchar(40),
autor varchar(100),
ano_publicacao int,
qntd_estoque int
);

create table funcionario(
id_funcionario int primary key,
nome varchar(100),
cargo varchar(50)
);

create table emprestimo(
id_emprestimo int primary key,
id_aluno int,
id_funcionario int,
data_emprestimo date,
data_devolucao date,
status varchar(20),
foreign key (id_aluno) references aluno(id_aluno),
foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table emprestimo_livro(
id_livro int,
id_emprestimo int,
quantidade int,
observacao varchar(100),
foreign key (id_livro) references livro(id_livro),
foreign key (id_emprestimo) references emprestimo(id_emprestimo),
primary key(id_livro,id_emprestimo)
);

insert into aluno (id_aluno,nome,curso,periodo) values (1,'fulano 2','curso 1','vespertino');
insert into aluno (id_aluno,nome,curso,periodo) values (2,'fulano 2','curso 2','vespertino');
insert into aluno (id_aluno,nome,curso,periodo) values (3,'fulano 3','curso 3','vespertino');

insert into livro (id_livro,titulo,autor,ano_publicacao,qntd_estoque) values (1,'livro 1','autor 1',2019,1);
insert into livro (id_livro,titulo,autor,ano_publicacao,qntd_estoque) values (2,'livro 2','autor 2',2019,1);
insert into livro (id_livro,titulo,autor,ano_publicacao,qntd_estoque) values (3,'livro 3','autor 3',2019,1);
insert into livro (id_livro,titulo,autor,ano_publicacao,qntd_estoque) values (4,'livro 4','autor 4',2019,1);

insert into funcionario(id_funcionario,nome,cargo) values (1,'funcionario 1','cargo 1');
insert into funcionario(id_funcionario,nome,cargo) values (2,'funcionario 2','cargo 2');

insert into emprestimo(id_emprestimo,id_aluno,id_funcionario,data_emprestimo,data_devolucao,status) values (1,1,1,'2025-05-13','2025-05-16','Devolvido');
insert into emprestimo(id_emprestimo,id_aluno,id_funcionario,data_emprestimo,data_devolucao,status) values (2,1,2,'2025-05-12','2025-05-16','Devolvido');
insert into emprestimo(id_emprestimo,id_aluno,id_funcionario,data_emprestimo,data_devolucao,status) values (3,2,1,'2025-05-11','2025-05-16','Devolvido');
insert into emprestimo(id_emprestimo,id_aluno,id_funcionario,data_emprestimo,data_devolucao,status) values (4,2,2,'2025-05-10',null,'Pendente');

insert into emprestimo_livro(id_livro,id_emprestimo,quantidade,observacao) values (1,1,2,'observacao 1');
insert into emprestimo_livro(id_livro,id_emprestimo,quantidade,observacao) values (2,2,1,'observacao 1');
insert into emprestimo_livro(id_livro,id_emprestimo,quantidade,observacao) values (3,3,2,'observacao 1');
insert into emprestimo_livro(id_livro,id_emprestimo,quantidade,observacao) values (4,4,5,'observacao 1');


select a.nome as nome_aluno,e.id_emprestimo,f.nome as nome_funcionario from aluno a inner join emprestimo e on e.id_aluno = a.id_aluno 
inner join funcionario f on f.id_funcionario = e.id_funcionario;

select * from livro where qntd_estoque < 5;

select e.id_emprestimo, l.titulo from emprestimo e inner join emprestimo_livro el on el.id_emprestimo = e.id_emprestimo inner join livro l on l.id_livro = el.id_livro;

select * from aluno a where exists (select 1 from emprestimo e where e.id_aluno = a.id_aluno);

select * from aluno a where not exists (select 1 from emprestimo e where e.id_aluno = a.id_aluno);

select f.nome as nome_funcionario,count(e.id_emprestimo) as qntd_emprestimos from funcionario f inner join emprestimo e on e.id_funcionario = f.id_funcionario group by f.nome having count(e.id_emprestimo) > 2;

select e.id_emprestimo, avg(el.quantidade) from emprestimo e inner join emprestimo_livro el on el.id_emprestimo = e.id_emprestimo group by e.id_emprestimo;

update livro set qntd_estoque = qntd_estoque * 1.15 where ano_publicacao < 2010;

update emprestimo set status = 'ATRASADO' where status = 'atrasados';

delete from livro l where not exists (select 1 from emprestimo_livro el where el.id_livro = l.id_livro);
delete from emprestimo where status = 'CANCELADO';

update livro l set qntd_estoque = (select avg(quantidade) from emprestimo_livro el where el.id_livro = l.id_livro group by id_livro);

select * from livro where id_livro in(select id_livro from emprestimo_livro group by id_livro having avg(quantidade) > (select avg(quantidade) from emprestimo_livro));