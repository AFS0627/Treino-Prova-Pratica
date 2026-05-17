create table colaboradores(
id_colab int primary key,
nome varchar(100) not null,
departamento varchar(50) not null
);

create table chamados(
id_chamado int primary key,
descricao varchar(255) not null,
status_chamado varchar(20) check(status_chamado in('Aberto','Fechado')),
id_colab_fk int,
foreign key (id_colab_fk) references colaboradores(id_colab) on delete CASCADE
);

insert into colaboradores (id_colab,nome,departamento) values (1,'João','RH');

insert into chamados (id_chamado,descricao,status_chamado,id_colab_fk) values (1,'computador nao liga','Aberto',1);
insert into chamados (id_chamado,descricao,status_chamado,id_colab_fk) values (2,'impressora nao liga','Fechado',1);

select co.nome, ch.descricao from colaboradores co inner join chamados ch on ch.id_colab_fk = co.id_colab where ch.status_chamado = 'Aberto';

update chamados set status_chamado = 'Fechado' where id_chamado = 1;

delete from colaboradores where id_colab = 1;
 