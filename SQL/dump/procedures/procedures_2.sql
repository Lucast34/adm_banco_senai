use campeaonatobrasileiro;

-- trigger before

delimiter $$

create trigger antes_de_inserir_usuario
before insert on usuarios
for each row 
begin 
	if new.nome is null or new.nome = '' then 
	set new.nome = 'Nome Padrão';
	end if;
end $$ -- sempre encerrar com $ 

delimiter ;

drop trigger antes_de_inserir_usuario;

select * from usuarios;

call adicionar_usuario('','teste@trigger.com');

select  * from usuarios; 

-- tabela nova
create table auditoria_usuarios(
	id int not null auto_increment,
	id_usuarios int not null,
	nome varchar(100) default null,
	email varchar(100) default null,
	opercao varchar(100),
	data_evento timestamp not null,
	primary key (id)
);

drop table auditoria_usuarios ;

show tables;

select * from auditoria_usuarios;  


-- trigger after 
delimiter $$ 

create trigger apos_atualizar_usuario
after update on usuarios
for each row
begin 
	insert into  auditoria_usuarios values(null, old.id, old.nome, old.email,'update',now());  -- ← não esqueça de termnar com ponto e virgula
end $$

delimiter ;

select * from usuarios; -- antes do update 

update usuarios set nome = 'Gabriel Almeida', email = 'gabriel.al@microsoftoutlook.com' where id = 4 ;
update usuarios set nome = 'Ana Santos de Andrade', email = 'anasan@microsoftoutlook.com' where id = 5 ;


select * from usuarios; -- depois do update 
select * from auditoria_usuarios;

-- proteção
delimiter $$

create trigger antes_de_excluir_usuario
before delete on usuarios
for each row
begin
	if old.id = 1 then
	signal sqlstate '45000'
	set message_text = 'Não é permitido excluir o usuário administrador';
	end if;
end $$

delimiter ;

delete from usuarios where id = 1;

-- update usuarios set id = 1 where id = 8;





