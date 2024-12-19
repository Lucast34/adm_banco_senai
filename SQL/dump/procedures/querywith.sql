use campeaonatobrasileiro;


show tables;


delimiter $$

create procedure classificacao_rodada(nuRodada int)
begin
	
	with partidas as(
select 
	rodada,
	id_mandante as id_time,
	gol_mandante as gol_feito,
	gol_visitante as gol_sofrido
from partida
union all
select
	rodada,
	id_visitante,
	gol_visitante,
	gol_mandante
from partida),
resultados as(
select 
	rodada,
	sigla,
	nome,
	gol_feito,
	gol_sofrido,
	gol_feito - gol_sofrido saldo_gols,
	if (gol_feito > gol_sofrido,3, if (gol_feito = gol_sofrido,1,0)) pontos,
	if (gol_feito > gol_sofrido,1,0) V,
	if (gol_feito = gol_sofrido,1,0)E,
	if (gol_feito < gol_sofrido,1,0)D
from partidas as p
inner join time as t on t.id_time = p.id_time)
select row_number() over() C, tb.* from (
select 	
    sigla, 
    nome, 
    sum(gol_feito) gol_feito, 
    sum(gol_sofrido) gol_sofrido, 
    sum(saldo_gols) saldo_gols,
    sum(pontos) pontos,
    sum(V) V, 
    sum(E) E, 
    sum(D) D,
    count(*) qt_partidas
from resultados where rodada <= nuRodada and gol_feito is not null
group by 
	sigla,
    nome
   order by pontos desc, V desc, saldo_gols desc, gol_feito desc) tb;

end $$

delimiter ;

-- drop procedure classificacao

call classificacao_rodada(19)


--

delimiter $$

create trigger antes_inserir_evento
before insert on evento
for each row
begin 
	declare  stJogador boolean default false ;
	select true into stJogador from partida as p
	inner join jogador as j on p.id_mandante = j.id_time or p.id_visitante = j.id_time
	where id_partida = new.id_partida and id_jogador = new.id_jogador;	

	if not stJogador then
		signal sqlstate '45000'
		set message_text = 'Não é permitido gravar um jogador nessa partida';
	end if;
end $$

delimiter ;

select * from evento where id_partida  = 1;

insert into evento(minuto,descricao,id_partida,id_jogador) values(0,'test',1,1);
insert into evento(minuto,descricao,id_partida,id_jogador) values(0,'test',1,140);