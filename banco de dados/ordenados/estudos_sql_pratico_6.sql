1) aluno curso n:n 
curso professor 1:n 
curso matrico n;n 

create table professores (
id_professor int generated always as identity primary key,
nome varchar (100) not null,
area_atuacao varchar(100)
);
create table cursos(
id_curso int generated always as identity primary key,
nome varchar(100) not null,
carga_horaria int,
id_professor int,
foreign key (id_professor) references professores(id_professor)
);
create table alunos(
id_aluno int generated always as identity primary key,
nome varchar(100),
email varchar(100) unique,
data_nascimento date
);
create table matriculas(
id_matricula int generated always as identity primary key,
id_aluno int,
id_curso int,
data_matricula date,
situacao varchar(20) default 'ATIVA',
foreign key (id_aluno) references alunos(id_aluno),
foreign key (id_curso) references cursos(id_curso)
);

insert into professores (id_professor, nome, area_atucao) values (1,'HERCULANO','MATEMATICA'),
(2,'ROBSON','PORTUGUES');

INSERT INTO CURSOS (ID_CURSO,NOME,CARGA_HORARIA,ID_PROFESSOR) VALUES (1,'TI',60,1),
(2,'ADS',40,2);

INSERT INTO ALUNOS (ID_ALUNO,NOME,EMAIL,DATA_NASCIMENTO) VALUES (1,'ARTHUR','A@GMAIL.COM','2007-06-02'),
(2,'GUSTAVO','G@GMAIL.COM','2005-04-30'),
(3,'LETICIA','L@GMAIL.COM','2007-02-10');

INSERT INTO MATRICULAS (ID_MATRICULA,ID_ALUNO,ID_CURSO,data_matricula,SITUACAO) VALUES (1,1,1,'2026-05-15','ATIVA'),
(2,2,2,SYSDATE,'ATIVA'),
(3,1,2,SYSDATE,'ATIVA').

UPDATE CURSOS SET CARGA_HORARIA = 80 WHERE ID_CURSO = 1;
UPDATE MATRICULAS SET SITUACAO = 'TRANCADA' WHERE ID_MATRICULA = 1;
DELETE FROM ALUNOS WHERE ID_ALUNO = 1;

SELECT NOME,EMAIL FROM ALUNOS ORDER BY NOME ASC;
SELECT * FROM CURSOS WHERE CARGA_HORARIA > 40;
SELECT C.NOME AS NOME_CURSO,P.NOME AS NOME_PROFESSOR FROM CURSOS C INNER JOIN PROFESSORES P ON P.id_professor = C.id_professor;
SELECT A.NOME, C.NOME FROM ALUNOS A INNER JOIN MATRICULAS M ON M.id_aluno = A.ID_ALUNO INNER JOIN CURSOS C ON C.id_curso = M.id_curso;
SELECT COUNT(ID_ALUNO) AS TOTAL_ALUNOS FROM ALUNOS;
SELECT C.ID_CURSO, C.NOME, COUNT(M.ID_ALUNO) AS TOTAL_ALUNOS FROM CURSOS C INNER JOIN MATRICULAS M ON M.ID_CURSO = C.ID_CURSO GROUP BY C.ID_CURSO, C.NOME;

primary key é uma identificação unica de uma tabela e foreign key é a chave primaria de outra table para garantir integridae referencial

delete deleta registros drop deleta a tabela

where filtra resultados

