create table especialidade(
id_especialidade int primary key,
nome varchar(100) UNIQUE
);

create table medico(
id_medico int primary key,
nome varchar(100),
salario decimal(10,2),
id_especialidade int,
foreign key (id_especialidade) references especialidade(id_especialidade)
);

create table paciente(
id_paciente int primary KEY,
nome varchar(100),
idade int check(idade >= 0),
sexo char(1) check (sexo in('M', 'F'))
);

create table consulta(
id_consulta int primary key,
data_consulta date,
valor decimal(10,2) check (valor > 0),
id_medico int,
id_paciente int,
foreign key (id_medico) references medico(id_medico),
foreign key (id_paciente) references paciente(id_paciente)
);

alter table paciente add column telefone varchar(20);
alter table paciente add constraint uni_tel unique(telefone);
alter table medico alter column nome set data type varchar(150);
alter table consulta add column status_consulta varchar(10) check (status_consulta in('REALIZADA', 'CANCELADA'));

select m.nome, e.nome, p.nome, c.valor from medico m inner join consulta c on c.id_medico = m.id_medico
inner join paciente p on p.id_paciente = c.id_paciente inner join especialidade e on e.id_especialidade = m.id_especialidade;

select m.id_medico, m.nome, c.id_consulta from medico m left join consulta c on c.id_medico = m.id_medico;

select m.id_medico, m.nome, avg(c.valor) from medico m inner join consulta c on c.id_medico = m.id_medico group by m.id_medico, m.nome having avg(c.valor) > 500;

select p.id_paciente, p.nome, count(c.id_consulta) from paciente p inner join consulta c on c.id_paciente = p.id_paciente group by p.id_paciente, p.nome;

select m.id_medico, m.nome, sum(c.valor) from medico m inner join consulta c on c.id_medico = m.id_medico group by m.id_medico, m.nome;

select * from consulta where valor = (select max(valor) from consulta);

select p.id_paciente, p.nome from paciente p  where id_paciente in(select id_paciente from consulta where valor =(select max(valor) from consulta));

select * from medico where nome like '%ANA%';

select * from consulta where valor between 200 and 800;

select c.id_consulta,c.valor,p.nome from consulta c inner join paciente p on c.id_paciente = p.id_paciente order by c.valor desc, p.nome asc;

update medico set salario = salario * 1.10 where id_especialidade = (select id_especialidade from especialidade where nome = 'CARDIOLOGIA');

delete from consulta where status_consulta = 'CANCELADA';

alter table paciente drop column telefone;

