-- (^-^)

select user, Host from mysql.user;

create user 'luiz-maia'@'%' identified by 'senai@123' ;

create database pizzaria;
grant select, insert, update, delete on  pizzaria.pizza  to 'luiz-maia'@'%';

revoke all privileges on pizzaria.* from 'luiz-maia'@'%';

use pizzaria;

create table pizza(
	id_pizza int auto_increment primary key,
    sabor varchar(250),
    ingredientes varchar(250));

drop table pizza;

create table au_pizza(
	id_aupizza int auto_increment primary key,
    id_pizza int,
    sabor varchar(250),
    ingredientes varchar(250),
    usuario varchar(250),
	data_hora date,
    operacao varchar(250)
);

drop table au_pizza;

delimiter $$
create trigger depois_insert_pizza 
after insert on pizza
for each row
begin
    insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values(new.id_pizza, new.sabor, new.ingredientes, user(), now(),'insert');
end$$
delimiter ;

drop trigger depois_insert_pizza;

delimiter $$ 
create trigger depois_update_pizza 
after update on pizza
for each row
begin
    insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values(old.id_pizza, old.sabor, old.ingredientes, user(), now(),'update');
end$$

delimiter ;

delimiter $$ 
create trigger antes_delete_pizza 
before delete on pizza
for each row
begin
    insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values(old.id_pizza, old.sabor, old.ingredientes, user(), now(),'delete');
end$$

delimiter ;

drop trigger depois_delete_pizza;

select * from pizza;

select * from au_pizza;


insert into pizza(sabor, ingredientes)
values
('À Moda', 'ingrediente3');

update pizza 
set ingredientes = 'bacon'
where  id_pizza = 22;

delete from pizza where id_pizza = 23;

show grants for 'luiz-maia'@'%';
grant usage on *.* to `luiz-maia`@`%`;
grant select on  pizzaria.au_pizza  to 'luiz-maia'@'%';