use campeaonatobrasileiro;

select  * from estadio;
select  * from time;
select  * from partida;
select  * from jogador;
select  * from evento;

-- select tabela
select * from vw_mandante;
select * from vw_visitante;


-- criando tabela
create view vw_visitante as(
select
	 sigla,
     sum(pontos) pontos,
     count(*) qt_partidas,
     sum(if(pontos = 3 , 1 , 0)) vitoria ,
     sum(if(pontos = 1 , 1 , 0)) empate,
     sum(if(pontos = 0 , 1 , 0 )) derrota,
     sum(gol_visitante) gols,
     sum(gol_mandante) gols_sofridos,
     sum(gol_visitante - gol_mandante) saldo_gols
from (
	select 
		sigla, 
		gol_mandante, 
		gol_visitante,
		if( gol_visitante > gol_mandante, 3, 
		if( gol_visitante = gol_mandante, 1, 0)) as pontos 
	from 
		partida as p 
	inner join 
		time as t 
	on 
		p.id_visitante = t.id_time
	where gol_mandante is not null and gol_visitante is not null 
) as tb
group by sigla);

-- união de ambas as tabelas
create view classificação as(
select 
sigla,
sum(pontos) pontos,
sum(qt_partidas) J,
sum(vitoria) V,
sum(saldo_vitoria) SG,
concat(sum(gols), ':',sum(gols_sofridos)) Gol,
sum(empate) E,
sum(derrotada) D
from(
	select * from vw_mandante
		union all
	select * from vw_visitante) as tb
group by sigla
order by pontos desc, V desc, sum(gols) desc);
select * from classificação