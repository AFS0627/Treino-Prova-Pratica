Create table departamento(
id_depto int primary key, 
nome_depto varchar(50) not null
);
create table servidor(
id_servidor int primary key,
nome_servidor varchar(100) not null,
salario decimal(10,2),
id_depto int,
foreign key (id_depto) references departamento(id_depto)
);
create table equipamento(
id_equipamento int primary key,
tipo varchar(30),
id_servidor int,
foreign key (id_servidor) references servidor(id_servidor)
);

alter table departamento add constraint uni_nomedpto unique(nome_depto);

alter table servidor add constraint cck check(salario >= 1412);

insert into departamento (id_depto, nome_depto) values (1,'TECNOLOGIA DA INFORMAÇÃO');

insert into servidor (id_servidor, nome_servidor, salario, id_depto) values (1,'ANA SILVA',4500,1);

update servidor set salario = salario *1.10 where id_depto in (select id_depto from departamento where nome_depto = 'Tecnologia da Informação');

delete from equipamento where tipo = 'Monitor CRT';

select nome_depto from departamento d  where exists (select 1 from servidor s where salario > 5000 and d.id_depto = s.id_depto);

select nome_depto as nomes_gerais from departamento
UNION
select nome_servidor from servidor; 