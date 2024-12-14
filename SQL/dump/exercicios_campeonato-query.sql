use campeaonatobrasileiro;
SET SQL_SAFE_UPDATES=0; -- off
SET SQL_SAFE_UPDATES=1; -- on

-- 01. Atualize na tabela evento as descrições 
select * from evento;

-- DE "Substitution" PARA "Substituição"

update evento
set descricao = 'Substituição'
where descricao = 'Substitution';

-- DE "Woodwork" PARA "Bola na Trave"

update evento
set descricao = 'Bola na Trave'
where descricao = 'Woodwork';

-- DE "Cartão Vermelho (Second Yellow Card)" PARA "Cartão Vermelho (Segundo Cartão Amarelo)"

update evento
set descricao = 'Cartão Vermelho (Segundo Cartão Amarelo)'
where descricao = 'Cartão Vermelho (Second Yellow Card)';

-- 02. Atualize o resultado das partidas do brasileirão 
-- que já aconteceram e ainda não foi gravado o resultado.

select  id_partida, rodada, gol_mandante,tm.sigla, gol_visitante,tv.sigla from partida p
inner join time tm  on id_mandante = tm.id_time
inner join time tv on id_visitante = tv.id_time
where gol_mandante is null or rodada >= 35
order by id_partida;


update partida set gol_mandante = 1 ,gol_visitante = 1 where id_partida = 341;  
update partida set gol_mandante = 0 ,gol_visitante = 1 where id_partida = 342;
update partida set gol_mandante = 1 ,gol_visitante = 1 where id_partida = 343;
update partida set gol_mandante = 2 ,gol_visitante = 2 where id_partida = 344;
update partida set gol_mandante = 4 ,gol_visitante = 1 where id_partida = 345;
update partida set gol_mandante = 1 ,gol_visitante = 1 where id_partida = 346;
update partida set gol_mandante = 3 ,gol_visitante = 1 where id_partida = 347;
update partida set gol_mandante = 0 ,gol_visitante = 0 where id_partida = 348;
update partida set gol_mandante = 0 ,gol_visitante = 0 where id_partida = 349;
update partida set gol_mandante = 1 ,gol_visitante = 1 where id_partida = 350;

-- rodada 36

update partida set gol_mandante = 2 ,gol_visitante = 3 where id_partida = 351;
update partida set gol_mandante = 1 ,gol_visitante = 3 where id_partida = 352;
update partida set gol_mandante = 1 ,gol_visitante = 2 where id_partida = 353;
update partida set gol_mandante = 2 ,gol_visitante = 4 where id_partida = 354;
update partida set gol_mandante = 2 ,gol_visitante = 2 where id_partida = 355;
update partida set gol_mandante = 2 ,gol_visitante = 1 where id_partida = 356;
update partida set gol_mandante = 3 ,gol_visitante = 2 where id_partida = 357;
update partida set gol_mandante = 2 ,gol_visitante = 0 where id_partida = 358;
update partida set gol_mandante = 1 ,gol_visitante = 1 where id_partida = 359;
update partida set gol_mandante = 1 ,gol_visitante = 1 where id_partida = 360;

-- rodada 37
update partida set gol_mandante = 0 ,gol_visitante = 1 where id_partida = 361;
update partida set gol_mandante = 1 ,gol_visitante = 2 where id_partida = 362;
update partida set gol_mandante = 1 ,gol_visitante = 1 where id_partida = 363;
update partida set gol_mandante = 1 ,gol_visitante = 0 where id_partida = 364;
update partida set gol_mandante = 2 ,gol_visitante = 0 where id_partida = 365;
update partida set gol_mandante = 3 ,gol_visitante = 0 where id_partida = 366;
update partida set gol_mandante = 1 ,gol_visitante = 2 where id_partida = 367;
update partida set gol_mandante = 1 ,gol_visitante = 2 where id_partida = 368;
update partida set gol_mandante = 3 ,gol_visitante = 1 where id_partida = 369;
update partida set gol_mandante = 0 ,gol_visitante = 3 where id_partida = 370;

-- rodada 38
update partida set gol_mandante = 0, gol_visitante = 3 where id_partida = 371;
update partida set gol_mandante = 1, gol_visitante = 0 where id_partida = 372;
update partida set gol_mandante = 2, gol_visitante = 0 where id_partida = 373;
update partida set gol_mandante = 2, gol_visitante = 2 where id_partida = 374;
update partida set gol_mandante = 2, gol_visitante = 1 where id_partida = 375;
update partida set gol_mandante = 0, gol_visitante = 1 where id_partida = 376;
update partida set gol_mandante = 5, gol_visitante = 1 where id_partida = 377;
update partida set gol_mandante = 3, gol_visitante = 0 where id_partida = 378;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 379;
update partida set gol_mandante = 0, gol_visitante = 1 where id_partida = 380;

-- 03. Elabore um relatório por minuto e a quantidade de gols (não contar "Gol anulado (Var)")
-- e ordene pela quantidade do maior para o menor

select * from evento;
select  
	descricao , 
	count(*) 
	from 
		evento 
	group by 
		descricao;

select  
	minuto, 
	count(*) quantidade
	from 
		evento 
		where 
			descricao in ('Gol (Gol de campo)','Gol (Pênalti)','Gol (Gol Contra)')
			group by 
				minuto
				order by 
					quantidade desc;

-- 04. Elabore um relatório por idade e quantidade de jogadores
-- remover data numa e posições "Auxiliar técnico" e "Técnico"
-- ordene pela idade do mais velho ao mais novo
show tables;
select * from jogador;

select 
		(year(curdate()) -year(dt_nascimento)) idade,
		count(id_jogador) jogadores
where
	not posicao = "Auxiliar técnico" and not poscisao = "Técnico"
from 
	jogador
group by 1;

-- 05. Elabore um relatório por jogador e quantidade de cartões, 
-- detalhar também a quantidade de Cartões Vermelho e Amarelo
-- ordene pela quantidade total de Cartões'

select  * from evento;
select  * from jogador;

select 
	j.jogador,
	case 
		when e.descricao = "Cartões Vermelho" then count (*)
	end
from 
	evento as e
inner join 
	jogador as j
on 
	e.id_jogador = j.id_jogador
;

--correção 
select j.numero, j.nome, 
		sum(if(e.descricao like "%Amarelo%", 1, 0)) as "Cartões Amarelos",
		sum(if(e.descricao like "%Vermelho%", 1, 0)) as "Cartões Vermelhos",
		sum(if(e.descricao like "%Vermelho%" and e.descricao like "%Amarelo%", 2, 1)) as "Cartões Recebidos"
	from jogador j
		inner join evento e 
			on e.id_jogador = j.id_jogador
				where descricao like "Cartao%"
		group by numero, nome
	order by 5 desc;

-- outro método 
select tb.*,
		qt_amarelo + qt_vermelho as total
	from (
	select 
		numero,
	    nome,
	    sum(if(descricao like '%Amarelo%' , 1 , 0)) qt_amarelo,
	    sum(if(descricao like '%Vermelho%' , 1 , 0)) qt_vermelho
	from jogador as j
	inner join evento as e on j.id_jogador = e.id_jogador
	where descricao like 'Cartão%'
	group by numero, nome) as tb order by total desc;

-- 06. Deseja-se saber qual a quantidade de jogos que aconteceram por dia
/* exemplo:
dia		quantidade
sábado	98
domingo	121
terça	11
quarta	64
quinta	29
segunda	11
sexta	8
*/

select * from partida;
set lc_time_names=pt_BR;

select dayname(horario) dia, count(*) quantidade
	from partida
group by 1;

-- 07. Desejase saber a quantidade total de cada evento 
-- e quantos aconteceram ate os 45min e depois dos 45min
/*exemplo:
descricao									total	ate_45		depois_45
Gol (Gol de campo)							734		327			407
Cartão Amarelo								1806	658			1148
Substituição								3256	112			3144
Bola na Trave								217		93			124
Pênalti Perdido								23		12			11
Cartão Vermelho								80		25			55
Gol anulado (Var)							39		17			22
Cartão Vermelho (Segundo Cartão Amarelo)	44		7			37
Gol (Pênalti)								71		37			34
Gol (Gol Contra)							14		5			9
*/
select descricao, 
	count(*) as total, 
	sum(if(minuto <= 45, 1, 0)) as "1° tempo",
	sum(if(minuto > 45, 1, 0)) as "2° tempo"
	from evento
group by 1;

-- 08. Deseja-se saber a quantidade dos eventos:
-- "Bola na Trave", "Pênalti Perdido" , "Gol anulado (Var)" pelos clubes
/*exemplo:
sigla 	Bola na Trave 	Pênalti Perdido Gol anulado (Var)
ACG		4				2				2
CAP		12				1				1
CAM		16				1				3
BAH		12				0				1
BOT		10				2				1
.
.
*/
select t.sigla, 
			sum(if(e.descricao = "Bola na Trave", 1, 0)) as "Bola na Trave", 
			sum(if(e.descricao = "Pênalti Perdido", 1, 0)) as "Pênalti Perdido", 
			sum(if(e.descricao = "Gol anulado (Var)", 1, 0)) as "Gol anulado (Var)"
	from time as t
		inner join jogador as j
			on j.id_time = t.id_time
		inner join evento as e
			on j.id_jogador = e.id_jogador
		group by t.sigla;
		
-- 09. Deseja-se saber a quantidade de jogador por faixa etária
/*exemplo:
faixa_etaria	qt
Entre 30 e39	191
Entre 20 e29	405
Entre 10 e19	30
Entre 40 e49	4
*/
	
select 
	count(if(2024 - year(dt_nascimento) between 30 and 39, 1, null)) as "Entre 30 e 39",
	count(if(2024 - year(dt_nascimento) between 20 and 29, 1, null)) as "Entre 20 e 29",
	count(if(2024 - year(dt_nascimento) between 10 and 19, 1, null)) as "Entre 10 e 19",
	count(if(2024 - year(dt_nascimento) between 40 and 49, 1, null)) as "Entre 40 e 49"
from jogador;


select 
	concat('Entre ',idade,'0 e ',idade,'9') faixa_etaria,
	jogadores
from 
(select (2024 - year(dt_nascimento)) div 10 as idade, 
		count(id_jogador) jogadores 
	from jogador 
		where dt_nascimento is not null and posicao not in ('Auxiliar técnico','Técnico')
	group by 1
order by idade desc) tb;

-- 10. Deseja-se saber o total de gols em cada estádio
/*exemplo:
nome_estadio									quantidade
Mineirão (Estádio Governador Magalhães Pinto)	87
Morumbi (Estádio Cícero Pompeu de Toledo)		80
Maracanã										77
Neo Química Arena								48
Estádio Alfredo Jaconi							48
*/
select descricao from evento;
select es.nome, count(ev.descricao) as Gols
	from estadio as es
		inner join partida as p
			on p.id_estadio = es.id_estadio
		inner join evento as ev
			on ev.id_partida = p.id_partida
				where ev.descricao = "Gol (Gol de campo)"
			group by 1;
	--	order by 2 desc;



