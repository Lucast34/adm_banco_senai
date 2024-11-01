create database dbmaternidade;
use dbmaternidade;

create table mae (
	id_mae int auto_increment not null,
    rg varchar(10),
    endereco varchar(200),
    telefone varchar(20),
	dt_nascimento date,
    constraint Pk_mae primary key(id_mae)
);


create table bebe(
	id_bebe int auto_increment not null,
    nome varchar(100),
    dt_nascimento date,
    peso float (5.2),
    altura int,
    crm int not null,
    id_mae int not null,
    constraint Pk_bebe  primary key(id_bebe),
	constraint Fk_crm foreign key (crm) references medico(crm),
    constraint Fk_mae foreign key (id_mae) references mae(id_mae) 
);

show create table bebe;

create table medico(
	crm int not null,
    nome varchar(120),
    telefone varchar(20),
    especialidade varchar(100),
    constraint Pk_crm primary key (crm)
);