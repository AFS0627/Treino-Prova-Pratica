create table cliente(
id_cliente int primary key,
nome varchar(100),
cidade varchar(50),
telefone varchar(20)
);

create table vendedor(
id_vendedor int primary key,
nome varchar(20),
comissao float,
setor varchar(20)
);
create table produto(
id_produto int primary key,
nome varchar(100),
categoria varchar(50),
preco decimal(10,2),
qntd_estoque int
);

create table pedido(
id_pedido int primary key,
id_cliente int,
id_vendedor int,
data_pedido date,
valor_total decimal(10,2),
status varchar(20),
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_vendedor) references vendedor(id_vendedor)
);

create table pedido_produto(
id_pedido int,
id_produto int,
qntd int,
valor_unitario decimal(10,2),
desconto float,
foreign key(id_pedido) references pedido(id_pedido),
foreign key(id_produto) references produto(id_produto),
primary key(id_pedido,id_produto)
);

alter table produto add constraint chk_preco check(preco >= 0);
alter table produto add constraint chk_estoque check(qntd_estoque >= 0);
alter table pedido add constraint chk_status check(status in('ABERTO','PAGO','CANCELADO'));

pule os inserts

select p.id_pedido,v.nome as nome_vendedor ,c.nome as nome_cliente ,p.status
from pedido p inner join vendedor v on v.id_vendedor = p.id_vendedor 
inner join cliente c on c.id_cliente = p.id_cliente;

select * from produto where qntd_estoque = 0;

select p.nome, sum(pp.qntd) 
from pedido p inner join pedido_produto pp 
on pp.id_produto = p.id_produto group by p.nome 
order by sum(pp.qntd) desc;

select c.id_cliente,c.nome,p.pedido 
from cliente c left join pedido p 
on p.id_cliente = c.id_cliente;

select id_pedido,valor_total,case when valor_total > 1000 then 'ALTO VALOR' when valor_total between 500 and 1000 then 'MEDIO VALOR' else 'BAIXO VALOR' end as situacao from pedido;

select v.id_vendedor,v.nome,count(p.id_produto)
from vendedor v inner join pedido p on p.id_vendedor = v.id_vendedor
group by v.id_vendedor,v.nome having count(p.id_produto) > 3;

select * from produto order by preco desc fetch first 1 rows;

select id_pedido,coalesce(desconto, 0) as desconto from pedido_produto;

update produto set preco = preco * 1.12 where categoria = 'INFORMÁTICA';
update pedido set status = 'CANCELADO' where valor_total = 0;
update produto set qntd_estoque = qntd_estoque - 1 where id_produto in(select id_produto from pedido_produto);

delete from produto p where not exists(select 1 from pedido_produto pp where pp.id_produto = p.id_produto);
delete from pedido where status = 'CANCELADO' and data_pedido < date '2025-01-01';

select * from cliente where id_cliente in(select id_cliente from pedido where valor_total >(select avg(valor_total) from pedido));
select * from produto where preco > (select avg(preco) from produto);
select * from produto where preco > all(select preco from produto where categoria = 'PAPELARIA');
select * from produto where preco > any(select preco from produto where categoria = 'LIMPEZA'); 