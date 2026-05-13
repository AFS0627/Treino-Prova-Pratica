/*CENÁRIO

Uma universidade deseja controlar:

alunos
cursos
matrículas
pagamentos

Considere que as tabelas já possuem dados cadastrados.

PARTE 1 — DDL PESADO
Questão 1

Crie a tabela CURSO:

Campo	Tipo
id_curso	inteiro
nome_curso	varchar(100)
carga_horaria	inteiro
valor_mensalidade	decimal(10,2)
status	varchar(20)

Regras:

chave primária
status aceita:
ATIVO
INATIVO
Questão 2

Crie a tabela ALUNO:

Campo	Tipo
id_aluno	inteiro
nome	varchar(100)
idade	inteiro
cidade	varchar(50)
id_curso	inteiro
bolsa	char(1)

Regras:

chave primária
chave estrangeira
bolsa aceita S/N
idade deve ser maior que 15
Questão 3

Crie a tabela PAGAMENTO:

Campo	Tipo
id_pagamento	inteiro
id_aluno	inteiro
valor_pago	decimal(10,2)
data_pagamento	date
status_pagamento	varchar(20)

Regras:

chave primária
chave estrangeira
status_pagamento:
PAGO
PENDENTE
ATRASADO
Questão 4

Adicione:

coluna email em ALUNO
Questão 5

Altere:

valor_mensalidade para decimal(12,2)
Questão 6

Remova:

coluna email
PARTE 2 — SELECT HARD
Questão 7

Liste:

nome do aluno
nome do curso

Ordene:

pelo nome do curso
depois nome do aluno
Questão 8

Liste:

cursos que possuem alunos matriculados

Utilize EXISTS.

Questão 9

Liste:

alunos cujo id_curso exista na tabela CURSO

Utilize IN.

Questão 10

Mostre:

quantidade de alunos por curso

Exiba:

nome do curso
total de alunos
Questão 11

Mostre:

média das mensalidades
apenas dos cursos ATIVOS
Questão 12

Liste:

cursos com MAIS DE 3 alunos

Utilize HAVING.

PARTE 3 — UPDATE CASCUDO
Questão 13

Atualize:

status_pagamento para ATRASADO
apenas pagamentos PENDENTES
cujo valor_pago seja menor que 500
Questão 14

Aumente:

valor_mensalidade em 10%
apenas cursos ATIVOS
Questão 15

Atualize:

bolsa para 'S'
alunos com idade maior que 60
Questão 16

Atualize:

cidade para 'BLUMENAU'
alunos cujo curso seja 'SISTEMAS DE INFORMAÇÃO'

Utilize subconsulta.

PARTE 4 — DELETE
Questão 17

Exclua:

pagamentos ATRASADOS
Questão 18

Exclua:

cursos INATIVOS
que NÃO possuem alunos matriculados

Utilize NOT EXISTS.

PARTE 5 — UNION / UNION ALL
Questão 19

Liste:

cidades dos alunos bolsistas
UNION
cidades dos não bolsistas
Questão 20

Repita usando UNION ALL.

Explique:

diferença prática entre UNION e UNION ALL.
PARTE 6 — SUBCONSULTA CORRELACIONADA (NÍVEL PROVA DIFÍCIL)
Questão 21

Liste:

nome do aluno
valor do pagamento

Mas apenas:

pagamentos acima da média geral dos pagamentos.
PARTE 7 — NÍVEL MALDADE
Questão 22

Mostre:

nome do curso
quantidade de alunos
média de idade

Exiba apenas:

cursos cuja média de idade seja maior que 30.
Questão 23

Liste:

alunos que NÃO possuem pagamento registrado.

Utilize NOT EXISTS.

Questão 24

Mostre:

o curso com maior quantidade de alunos.
Questão 25

Atualize:

status do curso para INATIVO
caso ele não tenha alunos vinculados.

Utilize subconsulta correlacionada.

DESAFIO FINAL — NÍVEL “ELIMINATÓRIO”
Questão 26

Crie UMA consulta que exiba:

nome do curso
quantidade de alunos
quantidade de pagamentos
soma total dos pagamentos

Mesmo cursos sem pagamentos devem aparecer.

Ordene:

pela soma total de pagamentos decrescente.

Dica:

LEFT JOIN
GROUP BY
SUM
COUNT
MINI SIMULADO TEÓRICO
Questão 27

Explique a diferença entre:

WHERE
HAVING
Questão 28

Explique:

UPDATE aluno
SET idade = idade + 1,
    cidade = UPPER(cidade);

As expressões utilizam:

valores antigos?
valores atualizados?
avaliação sequencial?
simultânea?
QUESTÃO PEGADINHA
Questão 29

O que acontece?

SELECT nome
FROM aluno
WHERE id_curso = NULL;

Como corrigir?

QUESTÃO MUITO COBRÁVEL
Questão 30

Diferença entre:

DELETE FROM aluno;

e

DROP TABLE aluno;*/


create table curso(
id_curso int primary key,
nome varchar(100),
carga_horaria int,
valor_mensalidade decimal(10,2),
status varchar(20) check (status in('INATIVO', 'ATIVO'))
);

create table aluno(
id_aluno int primary key,
nome varchar(100),
idade int check (idade > 15),
cidade varchar(50),
id_curso int,
bolsa char(1) check (bolsa in('S','N')),
foreign key (id_curso) references curso(id_curso)
);

create table pagamento(
id_pagamento int primary key,
id_aluno int,
valor_pago decimal(10,2),
data_pagamento date,
status_pagamento varchar(20) check (status_pagamento in('PAGO','PENDENTE','ATRASADO')),
foreign key (id_aluno) references aluno(id_aluno)
);

alter table aluno add column email varchar(50);
alter table curso alter column valor_mensalidade set data type decimal(12,2);
alter table aluno drop column email;

select a.nome, c.nome from aluno a join curso c on a.id_curso = c.id_curso order by c.nome, a.nome;
select * from curso c where exists (select 1 from aluno a where c.id_curso = a.id_curso);
select * from aluno where id_curso in (select id_curso from curso);
select c.nome, count(a.id_aluno) from curso c inner join aluno a on a.id_curso = c.id_curso group by c.id_curso, c.nome;
select avg(p.valor_pago) from pagamento p inner join aluno a on p.id_aluno = a.id_aluno inner join curso c on c.id_curso = a.id_curso where c.status = 'ATIVO';
select c.nome, count(a.id_aluno) from curso c inner join aluno a on a.id_curso = c.id_curso group by c.id_curso, c.nome having sum(a.id_aluno) > 3;

update pagamento set status_pagamento = 'ATRASADO' where status_pagamento = 'PENDENTE' and valor_pago < 500;
update curso set valor_mensalidade = valor_mensalidade * 1.10 where status = 'ATIVO';
update aluno set bolsa = 'S' where idade > 60;
update aluno set cidade = 'BLUMENAU' where id_curso = (select id_curso from curso where nome = 'SISTEMAS DE INFORMAÇÃO');

delete from pagamento where status_pagamento = 'ATRASADO';
delete from cursos c where status = 'INATIVO' and not exists (select 1 from aluno a where c.id_curso = a.id_curso); 

select cidade from aluno where bolsa = 'S'
UNION
select cidade from alunos where bolsa = 'N';

select cidade from aluno where bolsa = 'S'
UNION all
select cidade from alunos where bolsa = 'N';
union all adiciona duplicatas

SELECT a.nome,
       p.valor_pago
FROM aluno a
INNER JOIN pagamento p
ON p.id_aluno = a.id_aluno
WHERE p.valor_pago > (
    SELECT AVG(valor_pago)
    FROM pagamento
);
select c.nome, count(a.id_aluno), avg(a.idade) from curso c inner join aluno a on a.id_curso = c.id_curso group by c.id_curso, c.nome having avg(a.idade) > 30;
select * from aluno where not exists (select 1 from pagamento WHERE p.id_aluno = a.id_aluno);
select c.id_curso, c.nome, count(a.id_aluno) from curso c inner join aluno a on a.id_curso = c.id_curso group by id_curso having count(a.id_aluno) = max(a.id_aluno);

update curso set status = 'INATIVO' where id_curso not in (select id_curso from aluno);

