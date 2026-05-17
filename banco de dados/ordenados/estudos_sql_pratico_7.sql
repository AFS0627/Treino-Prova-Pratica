create table Equipamentos(
id_equipamento int generated always as identity primary key,
nome_equip varchar(100) not null,
setor varchar(50),
data_compra date
);

insert into equipamentos (nome_equip, setor, data_compra) values ('Notebook Dell','Financeiro','2023-05-15');

select nome_equip, setor from equipamentos where data_compra > date '2022-01-01';

update equipamentos set setor = 'TI' where nome_equip like '%Notebook%';

delete from equipamentos where id_equipamento = 10;