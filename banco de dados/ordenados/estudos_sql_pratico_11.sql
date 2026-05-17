create table livro(
id_livro int primary key,
titulo varchar(50),
autor varchar(20),
ano_publicacao date
);

create table emprestimo(
id_emprestimo int primary key,
id_livro int,
nome_usuario varchar(100),
data_emprestimo date,
foreign key (id_livro) references livro(id_livro)
);

insert into livro (id_livro,titulo,autor,ano_publicacao) 
values (1,'livro 1','autor 1',current_date);

insert into livro (id_livro,titulo,autor,ano_publicacao) 
values (2,'livro 2','autor 2',current_date);

insert into livro (id_livro,titulo,autor,ano_publicacao) 
values (3,'livro 3','autor 3',current_date);

insert into emprestimo (id_emprestimo,id_livro,nome_usuario,data_emprestimo) 
values (1,1,'fulano','2026-05-15');

insert into emprestimo (id_emprestimo,id_livro,nome_usuario,data_emprestimo) 
values (1,1,'ciclano','2026-05-15');

select l.titulo as titulo_livro,e.nome_usuario,e.data_emprestimo 
from livro l inner join emprestimo e on e.id_livro = l.id_livro;

update livro set autor = 'autor 4' where id_livro = 1;

delete from emprestimo where data_emprestimo < date '2025-01-01';