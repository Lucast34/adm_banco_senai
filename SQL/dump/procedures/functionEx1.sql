use campeaonatobrasileiro;

## 01. function valor_aleatorio
/* Implemente uma função no MySQL chamada valor_aleatorio que receba dois parâmetros inteiros: min (valor mínimo) e max (valor máximo). 
A função deve retornar um número inteiro aleatório dentro do intervalo fechado definido pelos parâmetros fornecidos, ou seja, o valor retornado deve estar entre min e max (inclusive).
Requisitos:
- A função deve ser not determinística, pois cada execução pode gerar um valor diferente.
- Utilize a função interna RAND() do MySQL para gerar números aleatórios.
- Garanta que o número retornado seja arredondado para o inteiro mais próximo, sem casas decimais.
- Valide os cálculos de modo que o número gerado esteja adequadamente dentro do intervalo fornecido pelos parâmetros.
```sql
select valor_aleatorio(5,15);
select valor_aleatorio(5,15);
select valor_aleatorio(5,15);
select valor_aleatorio(5,15);
select valor_aleatorio(5,15);
select valor_aleatorio(5,15);
select valor_aleatorio(5,15);
```
*/ 


delimiter $$

create function valor_aleatorio(valorMin int,valorMax int)
returns int
not deterministic
reads sql data -- necessario com not deterministc
begin
	select round(rand() * (valorMax - valorMin)) + valorMin; 
end $$

delimiter ;


select valor_aleatorio(8,15);



/*
 * ## 02. function data_br
Implemente uma função no MySQL chamada data_br que receba como entrada um valor do tipo DATE e retorne uma string no formato brasileiro de data, ou seja, dd/mm/yyyy.
Requisitos:
- A função deve ser determinística.
- Utilize a função interna DATE_FORMAT do MySQL para formatar a data.
- Certifique-se de que o retorno seja do tipo VARCHAR com comprimento adequado para suportar o formato brasileiro.
```sql
SELECT data_br('2024-12-25'), data_br(curdate());
```
*/

delimiter $$
 
create  function  dt_br(data_ins date)
returns varchar(20)
deterministic
begin
	return date_format(data_ins,'%d/%m/%Y'); 
end $$

delimiter ;

drop function dt_br;

select dt_br(curdate());

SELECT dt_br('2024-12-25');

/*
## 03. function signo
Implemente uma função no MySQL chamada signo que receba como entrada uma data do tipo DATE e retorne o signo do zodíaco correspondente àquela data.
Requisitos:
- A função deve ser determinística.
- Utilize a função interna DATE_FORMAT para extrair o mês e o dia da data, no formato MMDD, para facilitar as comparações.
- O retorno deve ser uma string do tipo VARCHAR(20) contendo o nome do signo em português.
- Considere as seguintes faixas de datas para cada signo:
> - Áries: 21/03 a 19/04
> - Touro: 20/04 a 20/05
> - Gêmeos: 21/05 a 20/06
> - Câncer: 21/06 a 22/07
> - Leão: 23/07 a 22/08
> - Virgem: 23/08 a 22/09
> - Libra: 23/09 a 22/10
> - Escorpião: 23/10 a 21/11
> - Sagitário: 22/11 a 21/12
> - Capricórnio: 22/12 a 19/01
> - Aquário: 20/01 a 18/02
> - Peixes: 19/02 a 20/03
*/

delimiter $$

create  function  signo(data_nasc date)
returns varchar(20)
deterministic
begin
	if date_format(data_nasc,'%m%d%') between '0321' and '0419' then
		return 'Áries';
	end if;
	if date_format(data_nasc,'%m%d%') between '0420' and '0520' then
		return 'Touro';
	end if;
	if date_format(data_nasc,'%m%d%') between '0521' and '0620' then
		return 'Gêmeos';
	end if;
	if date_format(data_nasc,'%m%d%') between '0621' and '0722' then
		return 'Câncer';
	end if;
	if date_format(data_nasc,'%m%d%') between '0723' and '0822' then
		return 'Leão';
	end if;
	if date_format(data_nasc,'%m%d%') between '0823' and '0922' then
		return 'Virgem';
	end if;
	if date_format(data_nasc,'%m%d%') between '0923' and '1022' then
		return 'Libra';
	end if;
	if date_format(data_nasc,'%m%d%') between '1023' and '1121' then
		return 'Escorpião';
	end if;
	if date_format(data_nasc,'%m%d%') between '1122' and '1221' then
		return 'Sagitário';
	end if;
	if date_format(data_nasc,'%m%d%') between '1222' and '0119' then
		return 'Capricórnio';
	end if;
	if date_format(data_nasc,'%m%d%') between '0120' and '0218' then
		return 'Aquário';
	end if;
	if date_format(data_nasc,'%m%d%') between '0219' and '0320' then
		return 'Peixes';
	end if;
end $$

delimiter ;




