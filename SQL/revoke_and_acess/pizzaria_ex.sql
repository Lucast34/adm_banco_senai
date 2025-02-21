select user, Host from mysql.user;

create user 'luiz-maia'@'%' identified by 'senai@123' ;

create database pizzaria;
grant select, insert on pizzaria.pizza  to 'luiz-maia'@'%';

-- revoke create on pizzaria.* from 'novo-usuario'@'localhost';

use pizzaria;

create table pizza(
	id_pizza int auto_increment primary key,
    sabor varchar(250),
    ingredientes varchar(250));
    
create table au_pizza(
	id_aupizza int auto_increment primary key,
    id_pizza int,
    sabor varchar(250),
    ingredientes varchar(250)
);

delimiter $$
create trigger depois_insert_pizza 
after insert on pizza
for each row
begin
    insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values(new.id_pizza, new.sabor, new.ingredientes, user(), now(),'insert');
end$$
delimiter;

drop trigger depois_insert_pizza;
select trigger;

show grants for 'luiz-maia'@'%';
grant usage on *.* to `luiz-maia`@`%`;
