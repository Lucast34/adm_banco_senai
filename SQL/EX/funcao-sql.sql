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