create database dbconsultorio;
use dbconsultorio;

create table sala(
	crm int not null,
	numero_sala int not null unique check(numero_sala > 1 and numero_sala < 50),
    andar int not null check(andar <12),
    constraint Fk_medico foreign key (crm) references medico(crm)
);

create table medico(
	crm int not null,
    nome varchar(40) not null,
    idade int check(idade > 23),
    telefone varchar(20),
    especialidade varchar(100)not null default('Ortopedia'),
    CPF varchar(15) unique not null,
    constraint Pk_crm primary key (crm)
);

create table paciente(
	id_paciente int not null auto_increment,
	CPF varchar(15) unique not null,
    nome varchar(40) not null,
    data_nascimento date,
    cidade char(30) default('Taguatinga'),
    doenca varchar(40) not null,
    plano_saude varchar(40) not null default('SUS'),
    crm int not null,
    constraint Pk_paciente primary key(id_paciente),
    constraint Fk_crm foreign key(crm) references medico(crm)
);

create table funcionarios(
	matricula int not null unique auto_increment,
    nome varchar(40) not null,
    data_nascimento date not null,
    data_admissaodate date not null,
    cargo varchar(20) not null default('Assistente Médico'),
    salario decimal not null default('1.510,00'),
    constraint Pk_matricula primary key(matricula)
);

create table consultas(
	crm int not null,
    id_paciente int not null,
	codigo_consulta int not null auto_increment unique,
    data_horario datetime,
    constraint Pk_consulta primary key (codigo_consulta),
    constraint Fk_consultamedico foreign key (crm) references medico(crm),
    constraint Fk_consultapaciente foreign key (id_paciente) references paciente(id_paciente)
);

show tables;