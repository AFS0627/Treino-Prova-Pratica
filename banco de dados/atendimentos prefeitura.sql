/*CENÁRIO

Uma prefeitura deseja controlar os atendimentos realizados em postos de saúde do município.

Cada paciente pode realizar vários atendimentos.

Cada atendimento:

possui código
data
especialidade
tempo de espera
status
profissional responsável

A prefeitura deseja:

cadastrar pacientes
controlar atendimentos
atualizar status
identificar pacientes prioritários
gerar consultas estatísticas
PARTE 1 — DDL (Estrutura do Banco)
Tarefa 1

Crie a tabela PACIENTE com os seguintes campos:

Campo	Tipo
id_paciente	inteiro
nome	varchar(100)
idade	inteiro
sexo	char(1)
cidade	varchar(50)
prioridade	char(1)

Regras:

id_paciente = chave primária
prioridade aceita:
'S'
'N'
Tarefa 2

Crie a tabela ATENDIMENTO:

Campo	Tipo
id_atendimento	inteiro
id_paciente	inteiro
especialidade	varchar(50)
data_atendimento	date
tempo_espera	inteiro
status	varchar(20)
profissional	varchar(100)

Regras:

id_atendimento = chave primária
id_paciente = chave estrangeira
status deve aceitar:
'AGENDADO'
'FINALIZADO'
'CANCELADO'
Tarefa 3

Adicione na tabela PACIENTE uma coluna chamada telefone do tipo varchar(20).

Tarefa 4

Altere o tamanho da coluna profissional para varchar(150).

Tarefa 5

Remova a coluna telefone da tabela PACIENTE.

PARTE 2 — DML
Tarefa 6

Insira os seguintes pacientes:

id	nome	idade	sexo	cidade	prioridade
1	Carlos	70	M	Blumenau	S
2	Ana	25	F	Gaspar	N
3	Roberto	65	M	Indaial	S
4	Fernanda	40	F	Blumenau	N
5	Juliana	80	F	Gaspar	S
Tarefa 7

Insira os atendimentos:

id	paciente	especialidade	data	espera	status	profissional
101	1	Cardiologia	2026-05-01	40	FINALIZADO	Dr. Paulo
102	2	Pediatria	2026-05-01	15	AGENDADO	Dra. Lucia
103	3	Ortopedia	2026-05-02	90	FINALIZADO	Dr. Marcos
104	1	Neurologia	2026-05-03	30	CANCELADO	Dra. Carla
105	5	Cardiologia	2026-05-03	120	FINALIZADO	Dr. Paulo
PARTE 3 — CONSULTAS SQL
Tarefa 8

Liste:

nome do paciente
especialidade
status

Utilize INNER JOIN.

Tarefa 9

Exiba:

pacientes com idade maior que 60 anos
ordenados pela idade decrescente
Tarefa 10

Mostre:

quantidade de atendimentos por especialidade

Utilize GROUP BY.

Tarefa 11

Mostre:

média do tempo de espera dos atendimentos FINALIZADOS.
Tarefa 12

Atualize:

status do atendimento 102 para FINALIZADO.
Tarefa 13

Aumente em 10 minutos:

o tempo_espera
apenas dos atendimentos CANCELADOS.
Tarefa 14

Exclua:

todos os atendimentos com status CANCELADO.
PARTE 4 — SUBCONSULTAS / EXISTS / IN / UNION
Tarefa 15

Liste os nomes dos pacientes que possuem atendimento registrado.

Utilize EXISTS.

Tarefa 16

Liste os nomes dos pacientes cujo id esteja presente na tabela atendimento.

Utilize IN.

Tarefa 17

Liste:

cidades dos pacientes prioritários
UNION
cidades dos pacientes não prioritários
Tarefa 18

Liste:

todas as cidades dos pacientes prioritários
UNION ALL
todas as cidades dos pacientes não prioritários

Explique a diferença entre UNION e UNION ALL.

PARTE 5 — QUESTÃO TEÓRICA ESTILO OBJETIVA
Tarefa 19

Considere:

UPDATE paciente
SET cidade = 'Gaspar',
    prioridade = 'S'
WHERE id_paciente = 2;

Explique:

quais colunas serão alteradas
se a atualização ocorre simultaneamente ou sequencialmente segundo o padrão SQL ANSI.
PARTE 6 — DESAFIO HARD
Tarefa 20

Crie uma consulta que mostre:

nome do paciente
quantidade de atendimentos realizados

Exibindo apenas pacientes que possuem MAIS DE 1 atendimento.

Ordene:

da maior quantidade para a menor.*/

create table paciente(
id_paciente int primary key,
nome varchar(100),
idade int check (idade >= 0),
sexo char(1) check (sexo in('F','M')),
cidade varchar(50),
prioridade char(1) check (prioridade in('S', 'N'))
);

create table atendimento (
id_atendimento int primary key,
id_paciente int,
especialidade varchar(50),
data_atendimento date,
tempo_espera int,
status varchar(20) check (status in ('AGENDADO','FINALIZADO','CANCELADO')),
profissional varchar(100),
foreign key (id_paciente) references paciente(id_paciente)
);

alter table paciente add column telefone varchar(20);
alter table atendimento alter column profissional varchar(150);
alter table paciente drop column telefone;

INSERT INTO paciente (id_paciente, nome, idade, sexo, cidade, prioridade) VALUES
(1, 'Carlos', 70, 'M', 'Blumenau', 'S'),
(2, 'Ana', 25, 'F', 'Gaspar', 'N'),
(3, 'Roberto', 65, 'M', 'Indaial', 'S'),
(4, 'Fernanda', 40, 'F', 'Blumenau', 'N'),
(5, 'Juliana', 80, 'F', 'Gaspar', 'S');

INSERT INTO atendimento (id_atendimento, id_paciente, especialidade, data_atendimento, tempo_espera, status, profissional) VALUES
(101, 1, 'Cardiologia', '2026-05-01', 40, 'FINALIZADO', 'Dr. Paulo'),
(102, 2, 'Pediatria', '2026-05-01', 15, 'AGENDADO', 'Dra. Lucia'),
(103, 3, 'Ortopedia', '2026-05-02', 90, 'FINALIZADO', 'Dr. Marcos'),
(104, 1, 'Neurologia', '2026-05-03', 30, 'CANCELADO', 'Dra. Carla'),
(105, 5, 'Cardiologia', '2026-05-03', 120, 'FINALIZADO', 'Dr. Paulo');


select p.nome, a.especialidade, a.status from paciente p inner join atendimento a on a.id_paciente = p.id_paciente;
select * from paciente where idade > 60 order by idade desc;
select especialidade, count(id_atendimento) from atendimento group by especialidade;
select status, avg(tempo_espera) from atendimento where status = 'FINALIZADO' group by status;
update atendimento set status = 'FINALIZADO' where id_atendimento = 102;
update atendimento set tempo_espera = tempo_espera + 10 where status = 'CANCELADO';
delete from atendimento where status = 'CANCELADO';


SELECT *
FROM paciente p
WHERE EXISTS (
    SELECT 1
    FROM atendimento a
    WHERE a.id_paciente = p.id_paciente
);
select nome from paciente where id_paciente in (select id_paciente from atendimento);
select cidade, nome from paciente where prioridade = 'S'
UNION
select cidade, nome from paciente where prioridade = 'N';
select cidade, nome from paciente where prioridade = 'S'
UNION all
select cidade, nome from paciente where prioridade = 'N';
union remove duplicatas e union all deixa

serão afetada as colunas cidades e prioridade em que o id_paciente é = a 5 a atualização ocorre simultaneamente

select p.nome, count(a.id_atendimento) from paciente p inner join atendimento a on a.id_paciente = p.id_paciente group by p.id_paciente, p.nome having count(a.id_atendimento) > 1
order by count(a.id_atendimento) desc;

