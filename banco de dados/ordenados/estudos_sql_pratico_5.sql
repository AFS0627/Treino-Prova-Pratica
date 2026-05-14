select distinct departamento from funcionarios;

select * from clientes where telefone is null;

 select c.*, p.* from clientes c left join pedidos p on p.id_cliente = c.id_cliente where id_pedido is null;
 
 select nome as nomeFuncionario from funcionarios 
 union 
 select nome as nomeCliente from clientes;
 
 select nome as nomeFuncionario from funcionarios 
 union ALL
 select nome as nomeCliente from clientes;
 
 select nome,salario, case when salario < 2500 then 'BAIXO' when salario between 2500 and 6000 then 'MEDIO' when salario > 6000 then 'ALTO' else 'SEM SALARIO' end as classificacao from funcionarios;
 
 
 select nome, salario, case when salario >= 5000 then 'BONUS' when salario < 5000 then 'SEM BONUS' else 'null' end as situacao from funcionarios order by salario asc;

create view  vw_pedidos_clientes as select c.nome as nome_cliente, p.valor as valor_pedido, p.status as status from clientes c inner join pedidos p on p.id_cliente = c.id_cliente
where p.valor > 1000;

create index nome_clientes on clientes(nome);
create index pedidos on pedidos(id_cliente,status);
 
 select c.nome, count(p.id_pedido) from clientes c left join pedidos p on p.id_cliente = c.id_cliente group by c.nome;
 
 select case when status = 'PAGO' then 'FINALIZADO' when status = 'PENDENTE' then 'AGUARDANDO' end as status, count(id_cliente) from pedidos group by status;
 
 select nome from clientes
 union 
 select nome from funcionarios order by nome asc;
 
 create view vw_funcionarios_salarios as select nome,salario, case when salario < 3000 then 'BAIXO' when salario between 3000 and 7000 then 'MEDIO' when salario > 7000 then 'ALTO' else 'SEM SALARIO' end as faixa_salarial from funcionarios;

 SELECT *
FROM clientes
WHERE telefone is NULL; = não funciona com null

union remove duplicatas union all não

select c.nome ,case when sum(p.valor) > 0 then sum(p.valor) else 'SEM PEDIDOS' end as total_gasto from clientes c left join pedidos p on p.id_cliente = c.id_cliente group by c.nome;