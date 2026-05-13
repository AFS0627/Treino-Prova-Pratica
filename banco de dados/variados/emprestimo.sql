create table equipamento(
id_equipamento int primary key,
nome varchar(100),
tipo varchar(20),
status char(1) check (status in('E', 'D')),
patrimonio varchar(50)
);

create table servidor(
id_servidor int primary key,
nome varchar(100),
idade int
);

create table emprestimo(
id_emprestimo int primary key,
id_equipamento int,
id_servidor int,
data_emprestimo date,
data_devolicao_prevista date,
data_devolucao date,
status char(1) check(status in('D', 'E')),
foreign key (id_equipamento) references equipamento(id_equipamento),
foreign key (id_servidor) references servidor(id_servidor)
);

pule a parte dos inserts e anule pois já estou bom 

select e.nome, s.nome, em.data_emprestimo, em.status from equipamento e inner join emprestimo em on e.id_equipamento = em.id_equipamento inner join servidor s on s.id_servidor = em.id_servidor;