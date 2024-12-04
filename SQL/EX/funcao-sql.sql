-- ASCII() retorna o codigo ascii do primeiro caractere.alter

help ascii;
SELECT ASCII('2');
SELECT ASCII(2);
SELECT ASCII('dx');

-- BIN() converte um numero decimal para binario

select bin(11);


-- CHAR_LENGTH() / LENGTH() Retorna o tamanho de uma string (em caracteres ou bytes)

select char_length('senai'),length('senai');



-- CONCAT() concatena string /CONCAT_WS() concatena com separador

select concat('senai','@','123');
select concat_ws('senai','@','123');

-- elt() retorna a string em uma posição da lista

select elt(3,'a','b','c','d');

-- field() retorna a posição de uma string na lista fornecida

select field('a','b','c','d');

-- field_in_set() Retorna a posição de uma string dentro de uma lista separada por virgulas.

select field_in_set('a','b','c','d');

-- format() formata um numero

select format(12354.678,2,'de_DE');  

-- instr() retorna a poisição da primeira ocorrencia de uma substring

select instr('senai','na');

-- left() / right  Retorna os primeiros ou ultimos caracteres de uma string

select left('senai',2), right('senai',2);

-- locate() similar ao instr , mas opermite especificar uma posição inicial

select instr('senai senai','a'), locate('senai senai','a',1);

-- lower()/ upper() mesma coisa do python

select lower('SENAI'), upper('senai');

-- lpad() / rpad() Preenche uma string no início ou no fim.

select lpad('hi',10,'0'), rpad('hi',10,'0');

-- ltrim() / rtrim() Remove espaços à esquerda ou direita.
-- trim() Remove caracteres das extremidades.
select ltrim('	nome	'), rtrim('	nome	'), trim('	nome	');

-- mid() / substring() Extrai parte de uma string.
SELECT MID('1234-67-90',6,2), SUBSTRING('1234-67-90',6,2);

-- replace() Substitui parte de uma string.
SELECT REPLACE('SEMAI','M','N');

-- reverse() Inverte a string.
SELECT REVERSE('123456789');

-- space() Retorna uma string de espaços.
SELECT CONCAT('X',SPACE(50),'X');

-- strcmp() Compara strings, retona 0 quando forem iguais.
SELECT STRCMP('SENAI','SENAI');

-- 2. Numeric Functions
-- ABS(): Retorna o valor absoluto.
SELECT ABS(-98), ABS(98);

-- CEIL() / CEILING(): Arredonda para cima.
SELECT CEIL(2.9), CEIL(2.1);

-- DIV: Realiza divisão inteira.
SELECT 10 DIV 8 , 10/8;

-- FLOOR(): Arredonda para baixo.
SELECT FLOOR(10/8), FLOOR(1.25);

-- MOD(): Retorna o resto da divisão.
SELECT MOD(3,2);

-- PI(): Retorna o valor de π.
SELECT PI();

-- POW() / POWER(): Eleva um número à potência.
SELECT POW(4,2);

-- RAND(): Retorna um número aleatório.
SELECT RAND();

-- ROUND(): Arredonda um número.
SELECT ROUND(2.5), ROUND(2.4);

-- SIGN(): Retorna o sinal de um número (-1, 0, 1).
SELECT SIGN(-8459), SIGN(0), SIGN(56);

-- SQRT(): Calcula a raiz quadrada.
SELECT SQRT(64), SQRT(9), SQRT(4);

-- TRUNCATE(): Trunca um número para o número especificado de casas decimais.
SELECT TRUNCATE(2.636,2), TRUNCATE(2.636,1), TRUNCATE(2.636,0);

 -- 3. Date and Time Functions
-- ADDDATE() / DATE_ADD(): Adiciona um intervalo a uma data.
SELECT ADDDATE(CURDATE(),5), ADDDATE(CURDATE(),-5);

-- CURDATE() / CURRENT_DATE(): Retorna a data atual.
SELECT CURDATE();

-- CURTIME() / CURRENT_TIME(): Retorna a hora atual.
SELECT CURTIME();

-- DATEDIFF(): Retorna a diferença em dias entre duas datas.
SELECT DATEDIFF('2024-12-31','2024-12-20');

select datediff(curdate(),'2004-06-07');

-- DATE_FORMAT(): Formata uma data para um formato especificado.
SELECT DATE_FORMAT(CURDATE(),'%d/%m/%Y');
/*
Especificador
%Y	Ano com 4 dígitos	2024
%y	Ano com 2 dígitos	24
%m	Mês (2 dígitos)	01 a 12
%d	Dia do mês (2 dígitos)	01 a 31
%H	Hora (24h)	00 a 23
%i	Minutos	00 a 59
%s	Segundos	00 a 59
*/

-- DAY(), MONTH(), YEAR(): Extrai partes da data.
SELECT DAY(CURDATE()), MONTH(CURDATE()), YEAR(CURDATE());

-- DAYNAME(), MONTHNAME(): Retorna o nome do dia/mês.
set lc_time_names=pt_BR; -- modificar o idioma pra pt_BR
SELECT DAYNAME(CURDATE()), MONTHNAME(CURDATE());

-- DAYOFMONTH(), DAYOFWEEK(), DAYOFYEAR(): Retorna o dia do mês/semana/ano.
SELECT DAYOFMONTH(CURDATE()), DAYOFWEEK(CURDATE()), DAYOFYEAR(CURDATE());

-- EXTRACT(): Extrai partes de uma data ou hora.
SELECT  EXTRACT(DAY FROM CURDATE()),
		EXTRACT(MONTH FROM CURDATE()),
        EXTRACT(YEAR FROM CURDATE());

-- FROM_DAYS(): Converte dias desde o ano 0 para uma data.
SELECT FROM_DAYS(366), FROM_DAYS(367);

-- HOUR(), MINUTE(), SECOND(): Extrai partes da hora.
SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW()), NOW();

-- LAST_DAY(): Retorna o último dia do mês.
SELECT LAST_DAY(NOW());

-- MAKEDATE(): Cria uma data com base no ano e dia do ano.
SELECT MAKEDATE(2024,257);

-- MAKETIME(): Cria um tempo com base em hora, minuto e segundo.
SELECT MAKETIME(22,1,1);

-- NOW(): Retorna a data e hora atual.
SELECT NOW();

-- STR_TO_DATE(): Converte uma string em data.
SELECT STR_TO_DATE('21/07/1987','%d/%m/%Y');

-- TIMESTAMP(): Retorna data e hora combinadas.
SELECT TIMESTAMP('2024-12-31','00:00:00');

-- WEEK(), WEEKDAY(), WEEKOFYEAR(): Funções de semana.
SELECT WEEK(NOW());

-- 4. Control Flow Functions
-- IF(): Condicional simples.
SELECT IF('A' = 'B', 'SIM', 'NÃO');
SELECT IF(10 >= 7, 'APROVADO', IF(10 >= 4, 'RECUPERACAO', 'REPROVADO'));
SELECT IF(6 >= 7, 'APROVADO', IF(6 >= 4, 'RECUPERACAO', 'REPROVADO'));
SELECT IF(2 >= 7, 'APROVADO', IF(2 >= 4, 'RECUPERACAO', 'REPROVADO'));

-- CASE: Estrutura de múltiplas condições.
SELECT CASE WHEN 10 >= 7 THEN 'SIM' ELSE 'NÃO' END ;

-- IFNULL(): Substitui NULL por um valor especificado.
-- NULLIF(): Retorna NULL se os valores forem iguais.

-- 5. Encryption and Hashing Functions
-- AES_ENCRYPT(), AES_DECRYPT(): Criptografia AES.
-- MD5(): Retorna o hash MD5.
-- SHA1(), SHA2(): Retorna hashes SHA.

-- 6. Miscellaneous Functions
-- VERSION(): Retorna a versão do MySQL.
-- DATABASE(): Retorna o banco de dados atual.
-- USER() / CURRENT_USER(): Retorna o usuário conectado.
-- UUID(): Gera um identificador único.alter

-- 7. Aggregate Functions
-- AVG(): Calcula a média.
-- COUNT(): Conta os registros.
-- MAX(), MIN(): Retorna o maior ou menor valor.
-- SUM(): Soma os valores.