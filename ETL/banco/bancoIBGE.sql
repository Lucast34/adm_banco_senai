create database test_pythonIbge;

use test_pythonIbge;

SELECT * FROM macroregiao;

create table macroregiao(
	id_regiao int auto_increment primary key,
    sigla varchar(10),
    nome varchar(50)
);

drop table macroregiao;

-- microregiao

select * from microregiao;

create table microregiao(
	id_estado int auto_increment primary key,
    sigla varchar(10),
    nome varchar(250),
    id_regiaoES int,
    
    foreign key(id_regiaoES) references macroregiao(id_regiao)
);

drop table microregiao;
 
-- municipio

select count(id_municipio) n_municipio from municipio ;

create table municipio(
	id_municipio int auto_increment primary key,
    nome varchar(250),
    id_estadoMU int,
    
    foreign key (id_estadoMU) references microregiao(id_estado)
);	

drop table municipio;