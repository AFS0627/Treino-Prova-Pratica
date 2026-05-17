create table clientes(
id_cliente int primary key,
nome varchar(100),
telefone varchar(20)
);

create table produto(
id_produto int primary key,
nome varchar(50),
preco decimal(10,2),
qntd_estoque int
);

create table pedido(
id_pedido int primary key,
data date,
valor_total decimal(10,2),
id_cliente int,
foreign key (id_cliente) references clientes(id_cliente)
);

create table pedido_produto(
id_pedido_produto int primary key,
id_pedido int,
id_produto int,
qntd_comprada int,
preco_unitario decimal(10,2),
foreign key (id_pedido) references pedido (id_pedido),
foreign key (id_produto) references produto(id_produto)
);

pule a parte dos inserts

select c.nome, p.id_pedido, p.data, p.valor_total from clientes c inner join pedido p on p.id_cliente = c.id_cliente;
select p.nome, sum(pp.qntd_comprada) from produto p inner join pedido_produto pp on pp.id_produto = p.id_produto group by p.nome order by sum(pp.qntd_comprada) desc;
select * from produto where qntd_estoque < 10;

update produto set preco = preco * 1.10;
delete from pedido where data < date '2025-01-01';