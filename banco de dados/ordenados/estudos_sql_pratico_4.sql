create table setores(
id_setor int generated always as identity primary key,
nome varchar(80) not null unique,
andar int check(andar > 0);
);

create table medicos(
id_medico int generated always as identity primary key,
nome varchar(20) not null,
especialidade varchar(50) not null,
salario decimal(10,2) check(salario > 4000),
id_setor int,
constraint chk_especialidade check(especialidade in('CARDIOLOGIA','PEDIATRIA','ORTOPEDIA','NEUROLOGIA')),
constraint fk_id_setor foreign key (id_setor) references setores(id_setor)
);

create table pacientes(
id_paciente int generated always as identity,
nome varchar(120),
sexo char(1),
data_nascimento date,
email varchar(120),
constraint pk_paciente primary key(id_paciente),
constraint chk_sexo check(sexo in('M','F')),
constraint un_email unique(email)
);

create table consultas (
id_consulta int generated always as identity primary key,
id_medico int,
id_paciente int,
data_consulta date not null,
status varchar(20) default 'AGENDADA',
constraint chk_status check(status in('AGENDADA','REALIZADA','CANCELADA'))
);

alter table pacientes add column telefone varchar(20);
alter table medicos rename column especialidade to area_atuacao;
alter table pacientes add constraint un_tel unique(telefone);
alter table pacientes alter column nome set data type varchar(150);

create index nome_paciente on pacientes(nome);
create index consutas_id_data on consultas(id_medico,data_consulta);

select * from medicos where id_setor in (select id_setor from setores where andar > 3);

select * from pacientes p where exists (select 1 from consultas c where p.id_paciente = c.id_paciente);

select * from medicos m where not exists (select 1 from consultas c where m.id_medico = c.id_medico);




