use campeaonatobrasileiro;

/*
## Exemplo Procedure com While
```sql
DELIMITER $$
CREATE PROCEDURE exemplo_while()
BEGIN
    DECLARE contador INT DEFAULT 1;  
    WHILE contador <= 5 DO
        SELECT CONCAT('Contador: ', contador);
        SET contador = contador + 1;
    END WHILE;
END$$
DELIMITER ;
call exemplo_while();
```
## 01. procedure gerar_resultado_aleatorio
Crie uma Stored Procedure chamada gerar_resultado_aleatorio que preencha aleatoriamente os campos de gols em uma tabela chamada partida. A procedure deve:
- Iterar por todos os registros da tabela partida, utilizando um contador para identificar o campo id_partida.
- Gerar valores aleatórios para os campos:
  - gol_mandante: Um número inteiro aleatório entre 0 e 6.
  - gol_visitante: Um número inteiro aleatório entre 0 e 6.
- Atualizar os valores gerados para cada registro identificado pelo id_partida.
- Parar a execução ao atingir o último registro (ou quando o contador chegar a 380, que representa o número total de partidas no contexto fornecido).
```sql
call gerar_resultado_aleatorio();
select * from classificacao;
```
*/

-- valor aleatorio
DELIMITER $$
CREATE FUNCTION valor_aleatorio(min INT, max INT)
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    RETURN ROUND(RAND()*(max-min))+min;
END$$
DELIMITER ;

-- gerar resultado

delimiter $$

create procedure gerar_resultado_al()
deterministic
begin
	declare contador int default 1;
	while contador <= 380 do
		update partida set gol_mandante = valor_aleatorio(0,6),
			gol_visitante = valor_aleatorio(0,6)
			where id_partida = contador;
		set contador = contador + 1 ;
	end while;
end $$

delimiter ;

drop procedure gerar_resultado_al;
-- show tables;

select * from classificação;

call gerar_resultado_al();

-- EX3


select * from classificação;

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
from partida)
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
inner join time as t on t.id_time = p.id_time;