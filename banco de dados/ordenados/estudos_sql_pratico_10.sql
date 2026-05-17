create table loja(
cnpj varchar(100) primary key,
nome varchar(100)
);

create table produto(
cod int primary key,
nome varcha(100),
cnpj_loja varchar(100),
preco decimal(10,2),
foreign key (cnpj_loja) references loja(cnpj)
);
create table cliente(
cod int primary key,
nome varchar(100)
);

create table venda(
nota_fiscal varchar(100) primary key,
data_venda date,
cod_produto int,
cod_cliente int,
qntd int,
preco decimal(10,2),
nome varchar(100),
foreign key (cod_produto) references produto(cod),
foreign key (cod_cliente) references cliente(cod)
);
select p.cod,p.nome, count(v.cod_produto) from produto p inner join venda v on v.cod_produto = p.cod group by p.cod,p.nome order by count(v.cod_produto) desc fetch first 1 rows;
