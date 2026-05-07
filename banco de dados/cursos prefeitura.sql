/*Escreva os scripts SQL para:

1. DDL (Definição de Dados):
Crie três tabelas para suportar esse relacionamento:

Curso: id_curso (PK, int), nome_curso (varchar 50).

Aluno: id_aluno (PK, int), nome_aluno (varchar 100).

Matricula (Tabela Associativa): id_curso (FK), id_aluno (FK), nota_final (decimal).

Restrições: A Chave Primária de Matricula deve ser composta pelos dois IDs. Adicione uma constraint (CHECK) garantindo que a nota_final esteja entre 0 e 10.

2. DML (Consultas Nível Hard):

Consulta A (A armadilha do JOIN): Escreva uma consulta que retorne o nome de TODOS os cursos e a quantidade de alunos matriculados neles. Se um curso não tiver nenhum aluno matriculado, ele deve aparecer na lista com a contagem "0".

Consulta B (Subquery/IN/NOT IN): Escreva uma consulta para listar o nome dos alunos que NÃO estão matriculados em nenhum curso. (Use subconsulta para resolver isso).*/

create table curso(
id_curso int primary key,
nome_curso varchar(50) not NULL
);

create table aluno(
id_aluno int primary key,
nome_aluno varchar(100) not null
);

create table matricula(
id_curso int,
id_aluno int,
nota_final decimal(2,2) check (nota_final >= 0 and nota_final <= 10),
foreign key (id_curso) references curso(id_curso),
foreign key (id_aluno) references aluno(id_aluno),
primary key (id_aluno, id_curso)
);

select c.nome_curso, count(m.id_aluno) as total_Alunos from curso c left join matricula m on m.id_curso = c.id_curso group by c.nome_curso;

SELECT nome_aluno 
FROM aluno 
WHERE id_aluno NOT IN (SELECT id_aluno FROM matricula);