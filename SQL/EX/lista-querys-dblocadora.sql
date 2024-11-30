/*LISTA DE BANCO DE DADOS COM SAKILA TRADUZIDO PARA PORTUGUÊS*/

use locadora;

/*1. Quais os países cadastrados?*/

select pais from pais;

/*2. Quantos países estão cadastrados?*/

select count(pais) from pais;

/*3. Quantos países que terminam com a letra "A" estão cadastrados?*/

select count(pais) from pais where pais like '%a' ;

/*4. Listar, sem repetição, os anos que houveram lançamento de filme.*/

select distinct ano_de_lancamento from filme;

/*5. Alterar o ano de lançamento igual 2007 para filmes que iniciem com a Letra "B".*/

update filme set ano_de_lancamento = 2007 where titulo like 'b%'; 
select * from filme;

/*6. Listar os filmes que possuem duração do filme maior que 100 e classificação igual a "G". */

select * from filme where duracao_do_filme > 100 and classificacao = 'G'; 

/*7. Alterar o ano de lançamento igual 2008 para filmes que possuem duração da locação menor que 4 e classificação igual a "PG". */
-- update filme set ano_de_lancamento = '2008' -- where filme_id in (
select * from filme 
where duracao_da_locacao < 4 and classificacao = 'PG';
-- );
 
-- SET SQL_SAFE_UPDATES = 1;

/*8. Listar a quantidade de filmes que estejam classificados como "PG-13" e preço da locação maior que 2.40.*/

select count(filme_id) from filme where classificacao = 'PG-13' and preco_da_locacao > 2.40;

/*9. Quais os idiomas que possuem filmes cadastrados? */
select * from filme;

select idioma.nome, filme.titulo from idioma
inner join filme on filme.idioma_id;

-- Refatorado:
-- select * from idioma where idioma_id in (select idioma_id  from filmes);
-- select i.nome, f.titulo from filme as f
-- inner join idioma as i on f.idioma_id = i.idioma_id;

/*10. Alterar o idioma para "GERMAN" dos filmes que possuem preço da locação maior que 4.*/

update filme set
idioma_id= 6
where preco_da_locacao > 4;
set sql_safe_updates = 1;

/*11. Alterar o idioma para "JAPANESE" dos filmes que possuem preço da locação igual 0.99.*/
set sql_safe_updates = 1;

select * from idioma;

update filme set 
idioma_id = 3
where preco_da_locacao = 0.99;

select * from filme where preco_da_locacao = 0.99;

/*12. Listar a quantidade de filmes por classificação.*/

-- select distinct
-- classificacao from filme;

select classificacao, count(filme_id) as filmes from filme group by classificacao;

/*13. Listar, sem repetição, os preços de locação dos filmes cadastrados.*/

select distinct preco_da_locacao from filme;

/*14. Listar a quantidade de filmes por preço da locação.*/

select preco_da_locacao, count(filme_id) as filmes from filme group by preco_da_locacao;

/*15. Listar os precos da locação que possuam mais de 340 filmes.*/

SELECT 
    preco_da_locacao, COUNT(filme_id) AS filmes
FROM
    filme
GROUP BY preco_da_locacao
HAVING filmes > 340;

/*16. Listar a quantidade de atores por filme ordenando por quantidade de atores crescente.*/

select 
	-- contagem da ator e renomeação da tabela
	f.titulo, count(a.ator_id) as atores 
from 
	-- apelido pode ser declarado sem o AS
	filme f
inner join
	filme_ator fa 
on 
	-- juntando
	f.filme_id = fa.filme_id
inner join
	ator a 
on 
	-- juntando 
	a.ator_id = fa.ator_id
group by 
	f.titulo
order by
	count(a.ator_id);
	
/*17. Listar a quantidade de atores para os filmes que possuem mais de 5 atores ordenando por quantidade de atores decrescente.*/


select
	f.titulo, count(a.ator_id) as atores 
from 
	filme f
inner join
	filme_ator fa 
on 
	f.filme_id = fa.filme_id
inner join
	ator a 
on 
	a.ator_id = fa.ator_id 
group by 
	f.titulo
having
	count(a.ator_id) > 5
order by
	f.titulo asc;
    
/*18. Listar o título e a quantidade de atores para os filmes que possuem o idioma "JAPANESE" e mais de 10 atores ordenando por ordem alfabética de título e ordem crescente de quantidade de atores.*/

select
	f.titulo as Filmes, count(*) as Atores
from 
	filme f
inner join	
	filme_ator fa 
on 
	f.filme_id = fa.filme_id
inner join
	idioma i
on
	f.idioma_id = i.idioma_id
where
	i.nome = 'Japanese'
group by
	f.titulo
having
	count(*) > 10
order by 
	titulo asc, count(*)desc;
	

/*19. Qual a maior duração da locação dentre os filmes?*/

select 
	titulo as filmes, duracao_da_locacao as duração_locação 
from 
    filme 
where 
	duracao_da_locacao > 6;

/*20. Quantos filmes possuem a maior duração de locação?*/

select 
	count(titulo) as filmes, duracao_da_locacao as duração_locação 
from 
    filme 
-- where duracao_da_locacao  >  6
group by
	duração_locação
order by
	count(titulo) desc;
    

/*21. Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de locação?*/

select
	count(f.titulo) as filmes, i.nome as idioma
from
	filme f
inner join
	idioma  i
on 
	f.idioma_id = i.idioma_id
where
	duracao_da_locacao = (select max(duracao_da_locacao) from filme) and
    (i.nome ='Japanese' or
    i.nome ='German')
group by
	i.nome;
    
/*22. Qual a quantidade de filmes por classificação e preço da locação?*/

select 
	classificacao, preco_da_locacao, count(*) qt 
from 
	filme 
group by 
	classificacao , preco_da_locacao
order by 
	classificacao , preco_da_locacao asc;

/*23. Qual o maior tempo de duração de filme por categoria?*/

select
	c.nome, max(f.duracao_do_filme) as duracao
from 
	filme as f
inner join 
	filme_categoria as fc on f.filme_id = fc.filme_id
inner join 
	categoria as c on fc.categoria_id = c.categoria_id
group by 
	c.categoria_id, c.nome;

/*24. Listar a quantidade de filmes por categoria.*/

select 
	c.nome , count(*) as qt_filme
from
	categoria as c
inner join
	filme_categoria as fc
on
	c.categoria_id = fc.categoria_id
inner join 
	filme as f 
on
	f.filme_id = fc.filme_id
group by 
	c.nome;

/*25. Listar a quantidade de filmes classificados como "G" por categoria.*/

select 
	c.nome as nome, count(f.titulo) as filmes ,f.classificacao as classificação
from 
	categoria as c
inner join
	filme_categoria as fc
on
	c.categoria_id = fc.categoria_id
inner join 
	filme as f
on -- on usa somente o id, e cruze as dua tabelas 
	fc.filme_id = f.filme_id
where 
	f.classificacao = 'G'
group by -- group by tem que ter o mesmo numero de colunas que o select, agrupar linhas com o mesmo valor 
	c.nome, f.classificacao
order by -- ordenar ou classificar 
	c.nome, f.classificacao;
    
/*26. Listar a quantidade de filmes classificados como "G" OU "PG" por categoria.*/

select 
	c.nome as nome, count(f.titulo) as filmes ,f.classificacao as classificação
from 
	categoria as c
inner join
	filme_categoria as fc
on
	c.categoria_id = fc.categoria_id
inner join 
	filme as f
on -- on usa somente o id, e cruze as dua tabelas 
	fc.filme_id = f.filme_id
where 
	f.classificacao in ('G','PG') -- uso do in 
	-- f.classificacao = 'G' or f.classificacao ='PG'
group by -- group by tem que ter o mesmo numero de colunas que o select, agrupar linhas com o mesmo valor 
	c.nome, f.classificacao
order by -- ordenar ou classificar 
	c.nome, f.classificacao;

/*27. Listar a quantidade de filmes por categoria e classificação.*/

select 
	c.nome, count(f.titulo), f.classificacao
from 
	filme as f
inner join 
	filme_categoria as fc
on 
	f.filme_id = fc.filme_id
inner join 
	categoria as c
on
	c.categoria_id = fc.categoria_id
group by 
	c.nome, f.classificacao;
	

/*28. Qual a quantidade de filmes por Ator ordenando decrescente por quantidade?*/

select 
	count(f.titulo) as filmes, concat(a.primeiro_nome,' ', a.ultimo_nome) -- concatenanado 
	as autores
from 
	filme as f
inner join 
	filme_ator as fa
on 
	f.filme_id = fa.filme_id
inner join 
	ator as a
on 
	a.ator_id = fa.ator_id 
group by 
	autores
order by 
	autores desc;
/*29. Qual a quantidade de filmes por ano de lançamento ordenando por quantidade crescente?*/
select ano_de_lancamento from filme;

select 
	count(titulo) as filmes , ano_de_lancamento as Ano 
from 
	filme
group by -- sempre necessario quando usar uma função 
	Ano
order by 
	Ano asc;

/*30. Listar os anos de lançamento que possuem mais de 400 filmes?*/

select 
	count(titulo) as filmes , ano_de_lancamento as Ano 
from 
	filme
group by -- sempre necessario quando usar uma função 
	Ano
having 
	filmes > 400
order by 
	Ano asc;

/*31. Listar os anos de lançamento dos filmes que possuem mais de 100 filmes com preço da locação maior que a média do preço da locação dos filmes da categoria "Children"?*/

    select ano_de_lancamento, count(*) qt_filme from filme 
    where preco_da_locacao > (
        select avg(preco_da_locacao) from filme as f 
        inner join filme_categoria as fc on f.filme_id = fc.filme_id
        inner join categoria as c on c.categoria_id = fc.categoria_id
        where c.nome = 'Children'
    )
    group by ano_de_lancamento
    having count(*) > 100
    ;
/*32. Quais as cidades e seu pais correspondente que pertencem a um país que inicie com a Letra “E”?*/

 select 
	c.cidade, p.pais 
from 
	cidade as c
 inner join 
	pais as p
on
	p.pais_id = c.cidade_id
group by
	c.cidade, p.pais
having
	pais like 'E%' 
 ;

/*33. Qual a quantidade de cidades por pais em ordem decrescente?*/

select 
	count(*) as cidades , p.pais 
from 
	pais as p
inner join 
	cidade as c
on  
	c.pais_id = p.pais_id
group by
	p.pais
order by 
	cidades desc;

/*34. Qual a quantidade de cidades que iniciam com a Letra “A” por pais em ordem crescente?*/

select 
	count(*) as cidades , p.pais 
from 
	pais as p
inner join 
	cidade as c
on  
	c.pais_id = p.pais_id
where 
	cidade like 'A%'
group by
	p.pais
order by 
	cidades asc;

/*35. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A”?*/

select 
	count(*) as cidades , p.pais 
from 
	pais as p
inner join 
	cidade as c
on  
	c.pais_id = p.pais_id
where 
	cidade like 'A%' 
    -- and pais >= 3
group by
	p.pais
having -- Filtra resultados do count e funções do group by
	cidades > 3
order by 
	cidades;


/*36. Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A” ou tenha "R" ordenando por quantidade crescente?*/

select 
	count(*) as cidades , p.pais 
from 
	pais as p
inner join 
	cidade as c
on  
	c.pais_id = p.pais_id
where 
	cidade like 'A%' or cidade like '%R%'
    -- and pais >= 3
group by
	p.pais
having 
	cidades > 3
order by 
	cidades asc;


/*37. Quais os clientes moram no país “United States”?*/

select clie.primeiro_nome as nome, c.cidade as cidade , p.pais as pais 
from
	cliente as clie
inner join 
	endereco as e
on
	e.endereco_id = clie.endereco_id
inner join
	cidade as c
on 
	e.cidade_id = c.cidade_id
inner join
	pais as p
on
	c.pais_id = p.pais_id
where
	pais = 'United States'
group by
	nome, cidade, pais;

/*38. Quantos clientes moram no país “Brazil”?*/

select clie.primeiro_nome as nome, c.cidade as cidade , p.pais as pais 
from
	cliente as clie
inner join 
	endereco as e
on
	e.endereco_id = clie.endereco_id
inner join
	cidade as c
on 
	e.cidade_id = c.cidade_id
inner join
	pais as p
on
	c.pais_id = p.pais_id
where
	pais = 'Brazil'
group by
	nome, cidade, pais;

/*39. Qual a quantidade de clientes por pais?*/


select count(clie.primeiro_nome) as nome , p.pais as pais 
from
	cliente as clie
inner join 
	endereco as e
on
	e.endereco_id = clie.endereco_id
inner join
	cidade as c
on 
	e.cidade_id = c.cidade_id
inner join
	pais as p
on
	c.pais_id = p.pais_id
group by
	pais
order by 
	nome desc;

/*40. Quais países possuem mais de 10 clientes?*/

select count(clie.primeiro_nome) as nome , p.pais as pais 
from
	cliente as clie
inner join 
	endereco as e
on
	e.endereco_id = clie.endereco_id
inner join
	cidade as c
on 
	e.cidade_id = c.cidade_id
inner join
	pais as p
on
	c.pais_id = p.pais_id
group by
	pais
having
	nome > 10
order by 
	nome desc;

/*41. Qual a média de duração dos filmes por idioma?*/

select avg(duracao_do_filme) from filme;

/*42. Qual a quantidade de atores que atuaram nos filmes do idioma “English”?*/

select count(*) as atores, f.titulo,id.nome 
from filme as f
inner join idioma as id
on id.idioma = f.idioma
inner join filme_ator as fa
on fa.filme_id = f.filme_id
inner join ator as a
on a.ator_id = fa.ator_id
where id.nome = 'English'
group by atores;


/*43. Quais os atores do filme “BLANKET BEVERLY”?*/
-- correção
    select i.nome, avg(duracao_do_filme) media from filme as f 
    inner join idioma as i on f.idioma_id = i.idioma_id
    group by i.nome;


/*44. Quais categorias possuem mais de 60 filmes cadastrados?*/

    select i.nome, avg(duracao_do_filme) media from filme as f 
    inner join idioma as i on f.idioma_id = i.idioma_id
    group by i.nome;


/*45. Quais os filmes alugados (sem repetição) para clientes que moram na “Argentina”?*/

/*46. Qual a quantidade de filmes alugados por Clientes que moram na “Chile”?*/

/*47. Qual a quantidade de filmes alugados por funcionario?*/

/*48. Qual a quantidade de filmes alugados por funcionario para cada categoria?*/

/*49. Quais Filmes possuem preço da Locação maior que a média de preço da locação?*/

/*50. Qual a soma da duração dos Filmes por categoria?*/

select count(*) as duracao, c.nome as categoria from filme as f
inner join filme_categoria as fc
on f.filme_id = fc.filme_id
inner join categoria as c
on c.categoria_id = fc.categoria_id
group by categoria
order by duracao desc;


/*51. Qual a quantidade de filmes locados mês a mês por ano? */

select * from aluguel;

-- substring
set lc_time_names = pt_BR;
select monthname(data_de_aluguel), 
substring(data_de_aluguel, 6, 2) data_aluguel, 
count(*) filmes -- pegando a string do mês e renomeando ela, depois contando cada linha 
from filme f
inner join inventario iv
on f.filme_id = iv.filme_id
inner join aluguel al
on al.inventario_id = iv.inventario_id
group by data_aluguel --
order by filmes asc;

-- another way

set lc_time_names = pt_BR;
select monthname(data_de_aluguel), 
substring(data_de_aluguel, 6, 2) mes,
substring(data_de_aluguel,1,4)ano, 
count(*) filmes -- pegando a string do mês e renomeando ela, depois contando cada linha 
from filme f
inner join inventario iv
on f.filme_id = iv.filme_id
inner join aluguel al
on al.inventario_id = iv.inventario_id
group by mes,ano --
order by filmes asc;

-- date function



/*52. Qual o total pago por classificação de filmes alugados no ano de 2006?*/

select * from aluguel;

select count(*),
classificacao, 
sum(valor) as Valor_Total from filme  f
inner join inventario iv
on f.filme_id = iv.filme_id 
inner join aluguel al
on iv.inventario_id = al.inventario_id
inner join pagamento pa
on al.aluguel_id = pa.aluguel_id
where date_format(data_de_aluguel, '%Y') = 2006
group by classificacao
order by classificacao;

/*53. Qual a média mensal do valor pago por filmes alugados no ano de 2005?*/

select 
		date_format(data_de_aluguel, '%Y') ano, 
        date_format(data_de_aluguel, '%m') mes,
        avg(valor) media_pagamento
from aluguel as a 
inner join pagamento as p 
on a.aluguel_id = p.aluguel_id
where  date_format(data_de_aluguel,'%Y') = 2005
group by ano , mes;


/*54. Qual o total pago por filme alugado no mês de Junho de 2006 por cliente? -----    CORRIGIR  */

select * from cliente