create table setores(
id_setor int generated always as identity primary key,
nome varchar(80) not null unique,
andar int check(andar > 0)
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
constraint chk_status check(status in('AGENDADA','REALIZADA','CANCELADA')),
constraint fk_medicos_consultas foreign key (id_medico) references medicos (id_medico),
constraint fk_paciente_consultas foreign key (id_paciente) references pacientes(id_paciente)
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

select * from medicos m where m.salario > (select avg(me.salario) from medicos me where me.id_setor = m.id_setor);

select s.nome,count(m.id_medico) as qntd_medicos from setores inner join medicos m on m.id_setor = s.id_setor group by s.nome having count(m.id_medico) > 3;

update medicos set salario = salario * 1.15 where id_setor in(select id_setor from setores where andar > 5);

delete from setores s where not exists(select 1 from medicos m where s.id_setor = m.id_setor);

select p.nome as nome_paciente,m.nome as nome_medico,c.data_consulta from pacientes p inner join consultas c on c.id_paciente = p.id_paciente inner join medicos m on m.id_medico = c.id_medico;

select  m.*, c.id_consulta from medicos m left join consultas c on c.id_medico = m.id_medico;

select m.id_medico,m.nome as nome_medico,s.* from medicos m right join setores s on m.id_setor = s.id_setor;

create view vw_consultas_medicas as select p.nome as nome_paciente,m.nome as nome_medico,m.area_atuacao,c.data_consulta 
from pacientes p inner join consultas c on c.id_paciente = p.id_paciente inner join medicos m on m.id_medico = c.id_medico where c.data_consulta > '2025-01-01';

select max(salario) as maior_salario,min(salario) as menor_salario,avg(salario) as media_salario from medicos;

select nome,salario, case when salario < 5000 then 'BAIXO' when salario between 5000 and 9000 then 'MEDIO' when salario > 9000 then 'ALTO' else 'SEM SALARIO' end as Classificacao
from medicos;

create view paciente_medico_status as select p.nome as nome_paciente,m.nome as nome_medico, c.status from pacientes p inner join consultas c on c.id_paciente = p.id_paciente
inner join medicos m on m.id_medico = c.id_medico;

select * from pacientes p where not exists (select 1 from consultas c where p.id_paciente = c.id_paciente);

nome está fora do group by 

update sem where atualiza tudo

select m.nome as nome_medico, count(c.id_consulta) as numero_consultas from medicos m inner join consultas c on c.id_medico = m.id_medico group by m.nome having count(c.id_consulta) > 10;




