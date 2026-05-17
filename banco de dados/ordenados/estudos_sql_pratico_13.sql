create table medico(
id_medico int primary key,
nome varchar(100),
especialidade varchar(50),
crm varchar(50),
telefone varchar(20)
);

create table paciente(
id_paciente int primary key,
nome varchar(100),
telefone varchar(20),
data_nasc date
);

create table consulta(
id_consulta int primary key,
id_medico int,
id_paciente int,
data_consulta date,
horario time,
valor decimal(10,2),
status varchar(20),
foreign key (id_medico) references medico(id_medico),
foreign key (id_paciente) references paciente(id_paciente)
);

create table medicamento(
id_medicamento int primary key,
nome varchar(100),
laboratorio varchar(100),
valor_unitario decimal(10,2)
);

create table medicamento_consulta(
id_medicamento_consulta int primary key,
id_medicamento int,
id_consulta int,
qntd int,
observacao varchar(200),
foreign key (id_medicamento) references medicamento(id_medicamento),
foreign key (id_consulta) references consulta(id_consulta)
);

pule os inserts

select p.nome as nome_paciente, c.data_consulta, m.nome as nome_medico from paciente p inner join consulta c on c.id_paciente = p.id_paciente inner join medico m on 
m.id_medico = c.id_medico;

select * from consulta where valor > 200;

select c.id_consulta, m.nome from consulta c inner join medicamento_consulta mc on mc.id_consulta = c.id_consulta inner join medicamento m on m.id_medicamento = mc.id_medicamento;

select * from paciente where id_paciente not in(select id_paciente from consulta);

select m.nome as nome_medico, count(c.id_consulta) as qntd_consultas from medico m inner join consulta c on c.id_medico = m.id_medico group by m.nome;

update consulta set valor = valor * 1.10 where status = 'REALIZADA';

update paciente set telefone = '33239090' where id_paciente = 1;

delete from consulta where status = 'CANCELADA';

delete from medicamento where id_medicamento not in(select id_medicamento from medicamento_consulta);

update consulta c set valor = (select avg(valor) from consulta co where c.id_medico = co.id_medico group by co.id_medico);

select m.nome as nome_medico, count(c.id_consulta), avg(c.valor) from medico m inner join consulta c on c.id_medico = m.id_medico group by m.nome order by count(c.id_consulta) desc;

select * from paciente where id_paciente in(select id_paciente from consulta where id_medico in(select id_medico from medico where especialidade = 'Cardiologia'));
