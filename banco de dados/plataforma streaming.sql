/*🔥 TAREFA 02 — SQL (NÍVEL TRAUMA)
📘 Cenário

Uma plataforma de streaming deseja controlar:

usuários
filmes
categorias
avaliações
📌 PARTE 1 — DDL
Tabela categoria

Campos:

id_categoria
nome

Restrições:

PK
UNIQUE
Tabela filme

Campos:

id_filme
titulo
duracao
ano_lancamento
id_categoria

Restrições:

PK
FK
duração > 0
ano >= 1950
Tabela usuario

Campos:

id_usuario
nome
idade
plano

Restrições:

idade >= 12
plano:
BASICO
PREMIUM

(use CHECK)

Tabela avaliacao

Campos:

id_usuario
id_filme
nota
comentario

Restrições:

PK composta
nota entre 1 e 10
🔥 PARTE 2 — INSERTS

Inserir:

4 categorias
6 filmes
5 usuários
10 avaliações
🔥 PARTE 3 — CONSULTAS
1) JOIN múltiplo

Mostrar:

usuário
filme
categoria
nota
2) AVG + GROUP BY

Mostrar:

média de nota por filme
3) HAVING

Mostrar:

filmes com média > 8
4) COUNT

Mostrar:

quantidade de avaliações por filme
5) LEFT JOIN

Mostrar:

filmes sem avaliação
6) Subquery

Mostrar:

filme(s) com maior média
7) LIKE

Mostrar usuários:

contendo “ANA”
8) BETWEEN

Mostrar filmes:

lançados entre 2000 e 2020
9) UPDATE

Alterar:

plano BASICO → PREMIUM
usuários com idade > 25
10) DELETE

Excluir:

avaliações com nota < 5
11) ORDER BY complexo

Ordenar filmes:

média desc
título asc
12) SUM

Mostrar:

soma total das durações dos filmes por categoria*/

create table categoria (
id_categoria int primary KEY,
nome varchar(100) unique
);

create table filme(
id_filme int primary key,
titulo varchar(50),
duracao int check (duracao > 0),
ano_lancamento int check (ano_lancamento >= 1950),
id_categoria int,
foreign key (id_categoria) references categoria(id_categoria)
);

create table usuario(
id_usuario int primary key,
nome varchar(100),
idade int check (idade >= 12),
plano varchar(10) check (plano in ('BASICO','PREMIUM'))
);

create table avaliacao(
id_usuario int,
id_filme int,
nota int check (nota > 1 and nota < 10),
comentario varchar(200),
foreign key (id_usuario) references usuario(id_usuario),
foreign key (id_filme) references filme(id_filme),
primary key (id_filme, id_usuario)
);

pule e anule a parte dos inserts pois já sei fazer

select u.id_usuario, u.nome, f.id_filme, f.titulo, c.id_categoria, c.nome, a.nota from usuario u inner join avaliacao a 
on u.id_usuario = a.id_usuario inner join filme f on f.id_filme = a.id_filme inner join categoria c on c.id_categoria = f.id_categoria;

select f.id_filme, f.titulo, avg(a.nota) from filme f inner join avalicao a on a.id_filme = f.id_filme group by f.id_filme, f.titulo;

select f.id_filme, f.titulo, avg(a.nota) from filme f inner join avalicao a on a.id_filme = f.id_filme group by f.id_filme, f.titulo having avg(a.nota) > 8;

select f.id_filme, f.titulo, count(a.id_usuario) from filme f inner join avalicao a on a.id_filme = f.id_filme group by f.id_filme, f.titulo;

select f.id_filme, f.titulo, a.nota from filme f left join avalicao a on a.id_filme = f.id_filme; 

select * from filme where id_filme in (select id_filme from avaliacao where nota =(select max(nota) from avaliacao));

select * from usuario where nome like '%ANA%';

select * from filme where ano_lancamento between 2000 and 2020;

update usuario set plano = 'PREMIUM' where idade > 25;

delete from avaliacao where nota < 5;

select f.id_filme, f.titulo, avg(a.nota) from filme f inner join avalicao a on a.id_filme = f.id_filme group by f.id_filme, f.titulo order by avg(a.nota) desc, f.titulo asc;

select c.id_categoria, c.nome, sum(f.duracao) from categoria c inner join filme f on f.id_categoria = c.id_categoria group by c.id_categoria, c.nome;