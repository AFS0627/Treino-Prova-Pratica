create table departamento(
id_departamento int primary key,
nome varchar(100) unique not null,
bloco char(1) check(bloco in('A','B','C'))
);
create table curso(
id_curso int primary key,
nome varchar(80) not null,
carga_horaria int check(carga_horaria > 0),
valor_mensalidade decimal(10,2) DEFAULT 0,
status varchar(15) default 'ATIVO',
id_departamento int,
foreign key (id_departamento) references departamento(id_departamento),
constraint statuschk check(status in('ATIVO','INATIVO','EM_ANALISE'))
);
create table aluno(
id_aluno int primary key,
nome varchar(100) not null,
idade int check(idade >= 16 and idade <= 100),
cidade varchar(50),
bolsa decimal(5,2) default 0,
email varchar(100) unique,
data_cadastro date default current_date
);
create table matricula(
id_matricula int primary key,
id_aluno int,
id_curso int,
data_matricula date not null,
situacao varchar(50) default 'ATIVA',
constraint situacaochk check(situacao in('ATIVA','TRANCADA','CANCELADA')),
foreign key (id_aluno) references aluno(id_aluno),
foreign key (id_curso) references curso(id_curso)
);

alter table curso add column vagas int default 30;
alter table curso add constraint vagaMaiorQue0 check(vagas >= 0);
alter table aluno drop column cidade;
alter table aluno rename column bolsa to percentual_bolsa;
alter table curso add constraint nomeUnico unique(nome);

INSERT INTO departamento (id_departamento, nome, bloco) VALUES
(1, 'Tecnologia da Informação', 'A'),
(2, 'Engenharia e Indústria', 'B'),
(3, 'Ciências Humanas', 'C');

INSERT INTO curso (id_curso, nome, carga_horaria, valor_mensalidade, status, id_departamento, vagas) VALUES
(10, 'Sistemas de Informação', 3000, 800.00, 'ATIVO', 1, 40),
(20, 'Análise de Dados', 2000, 650.00, 'INATIVO', 1, 20),
(30, 'Engenharia Mecânica', 4000, 1200.00, 'ATIVO', 2, 35),
(40, 'Design de Produto', 2400, 500.00, 'EM_ANALISE', 2, 15),
(50, 'Psicologia Cognitiva', 3600, 950.00, 'ATIVO', 3, 30);

INSERT INTO aluno (id_aluno, nome, idade, percentual_bolsa, email, data_cadastro) VALUES
(100, 'Ana Silva', 20, 60.00, 'ana@email.com', '2026-05-12'), -- Bolsa > 50
(101, 'Bruno Souza', 22, 0.00, 'bruno@email.com', '2026-05-12'), -- Bolsa = 0
(102, 'Carla Dias', 19, 25.00, 'carla@email.com', '2026-05-12'),
(103, 'Diego Ramos', 25, 0.00, 'diego@email.com', '2026-05-12'),
(104, 'Elena Pires', 30, 75.00, 'elena@email.com', '2026-05-12'),
(105, 'Fabio Lima', 21, 10.00, 'fabio@email.com', '2026-05-12');

INSERT INTO matricula (id_matricula, id_aluno, id_curso, data_matricula, situacao) VALUES
(1001, 100, 10, '2026-02-01', 'ATIVA'),
(1002, 101, 10, '2026-02-01', 'TRANCADA'),
(1003, 102, 30, '2026-02-05', 'CANCELADA'),
(1004, 103, 50, '2026-02-10', 'ATIVA'),
(1005, 104, 50, '2026-02-10', 'ATIVA'),
(1006, 105, 10, '2026-02-12', 'ATIVA'),
(1007, 100, 30, '2026-02-15', 'ATIVA'),
(1008, 102, 50, '2026-02-20', 'TRANCADA');



