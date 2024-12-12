use campeaonatobrasileiro;

delimiter $$

create function quadrado(num int)

returns int

deterministic

begin 
	return num * num ;
end $$

delimiter ;

select quadrado (4);


delimiter $$ 

create function eh_par(num INT)

returns varchar(10)

deterministic

begin 
	if num % 2 = 0 then
		return 'Par';
	else 
		return 'Impar';
	end if;
end $$

delimiter ;


select  eh_par(3);

select  eh_par(10);



delimiter $$

create function idade(dt date)
returns int
not deterministic
reads sql data
begin 
		return datediff(curdate(),dt) div 365.25;
end $$

delimiter ;


-- read sql data : indica qua a função lê dados (mesmo que apenas curdate()), sem modificá-los.
-- isso Aajuda a cumprir os rwquisitos do MySql para replicação

select idade(dt_nascimento) from jogador ;

delimiter $$

create function faixa_etaria(dt date)
returns varchar(20)
not deterministic
reads sql data
begin 
		declare fx_etaria int;
		set fx_etaria = (select idade(dt) div 10);
		return concat('entre ',fx_etaria, '0 e ', fx_etaria,'9');
end $$

delimiter ;

drop function faixa_etaria;

select faixa_etaria(dt_nascimento) from jogador;


-- create table 