create table analistas(
id_analista int primary key,
nome_analista varchar(50)
);

create table servidores(
id_servidor int primary key,
hostname varchar(50),
sistema_operacional varchar(30)
);

create table acessos_concedidos(
id_analista int,
id_servidor int,
data_concessao date,
foreign key (id_analista) references analistas (id_analista),
foreign key (id_servidor) references servidores(id_servidor),
primary key(id_analista, id_servidor)
);

insert into analistas (id_analista,nome_analista) values (1,'Alice');
insert into analistas (id_analista,nome_analista) values (2,'Bob');

insert into servidores (id_servidor,hostname,sistema_operacional) values (1,'SRV-WEB','LINUX');
insert into servidores (id_servidor,hostname,sistema_operacional) values (2,'SRV-BD','LINUX');

insert into acessos_concedidos(id_analista,id_servidor,data_concessao) values (1,2,CURRENT_DATE);
insert into acessos_concedidos(id_analista,id_servidor,data_concessao) values (1,1,CURRENT_DATE);
insert into acessos_concedidos(id_analista,id_servidor,data_concessao) values (2,2,CURRENT_DATE);

select a.nome_analista, s.hostname from analistas a inner join acessos_concedidos ac on ac.id_analista = a.id_analista inner join servidores s on s.id_servidor = ac.id_servidor;
select nome_analista from analistas where id_analista in (select ac.id_analista from acessos_concedidos ac where ac.id_servidor in(select id_servidor from servidores where hostname = 'SRV-BD');

alter table acessos_concedidos add column nivel_privilegio varchar(20);