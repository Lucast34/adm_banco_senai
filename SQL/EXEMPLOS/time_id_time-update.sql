use campeonatobrasileiro;

select * from time;
select * from estadio;

insert into estadio(nome, endereco, capacidade) values
#('Estádio Heriberto Hülse',' Rua Treze de Maio, 1.947 - 88802-290 - Bairro Comerciario - Criciúma SC.','19225');
#('Estádio Alfredo Jaconi','Caxias do Sul, Rio Grande do Sul - Rua Hércules Galló 1547 ','19924');
('Estádio Manoel Barradas (Barradão)','R. Artêmio Valente, 01, Salvador, BA, 41260-300','30793');



-- Identificar e realizar o update dos 3 times que não estão na serie A atualmente.
-- Necessário fazer o update dos times..
/*
(serie B)América-MG	-> Atlético-GO (serie A)
(serie B)Coritiba	-> Criciúma    (serie A)
(serie B)Goiás	    -> Juventude   (serie A)
(serie B)Santos	    -> Vitória     (serie A)
Atlético Clube Goianiense	Atlético-GO	ACG	Goiânia	        GO	Estádio Antônio Accioly
Criciúma Esporte Clube	    Criciúma	CRI	Criciúma	    SC	Estádio Heriberto Hülse
Esporte Clube Juventude	    Juventude	JUV	Caxias do Sul	RS	Estádio Alfredo Jaconi
Esporte Clube Vitória	    Vitória 	VIT	Salvador	    BA	Estádio Manoel Barradas (Barradão)
*/

update time set
	nome_completo = 'Atlético Clube Goianiense',
    nome = 'Atlético-GO',
    sigla = 'ACG',
    cidade = 'Goiâna',
    estado = 'GO',
    id_estadio = 13
where id_time = 1;

update time set
	nome_completo = 'Criciúma Esporte Clube',
    nome = 'Criciúma',
    sigla = 'CRI',
    cidade = 'Criciúma',
    estado = 'SC',
    id_estadio = 21
where id_time =7;

update time set
	nome_completo = 'Esporte Clube Juventude',
    nome = 'Juventude',
    sigla = 'JUV',
    cidade = 'Caxias do Sul',
    estado = 'RS',
    id_estadio = 22
where id_time = 13;

update time set
	nome_completo = 'Esporte Clube Vitória',
    nome = 'Vitória',
    sigla = 'VIT',
    cidade = 'Salvador',
    estado = 'BA',
    id_estadio = 23
where id_time = 18;

select * from time where id_time(1,7,13,18);