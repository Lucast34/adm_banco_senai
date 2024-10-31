use campeonatobrasileiro;

#show create table jogador;
#show create table evento;
#show create table partidas;
#show create table time;
#show create table relista_eventos;
show create table estadio;



CREATE TABLE `jogador` (
   `id_jogador` int NOT NULL,
   `nome` varchar(150) DEFAULT NULL,
   `data_nascimento` date DEFAULT NULL,
   `posicao` varchar(150) DEFAULT NULL,
   `numero_camisa` int DEFAULT NULL,
   `id_time` int NOT NULL,
   PRIMARY KEY (`id_jogador`),
   KEY `FK_Time` (`id_time`),
   CONSTRAINT `FK_Time` FOREIGN KEY (`id_time`) REFERENCES `time` (`id_time`)
 );
  desc jogador;
  
  alter table relista_eventos drop constraint FK_jogador;
  alter table jogador modify id_jogador int auto_increment;
  alter table relista_eventos add CONSTRAINT `FK_jogador` FOREIGN KEY (`id_jogador`) REFERENCES `jogador` (`id_jogador`);
 
 CREATE TABLE `evento` (
   `id_eventos` int NOT NULL,
   `descricao` varchar(150) DEFAULT NULL,
   PRIMARY KEY (`id_eventos`)
 );
 
 desc evento;
 
 alter table relista_eventos drop constraint FK_eventos;
 alter table evento modify id_eventos int auto_increment;
 alter table relista_eventos add CONSTRAINT `FK_eventos` FOREIGN KEY (`id_eventos`) REFERENCES `evento` (`id_eventos`);
 

CREATE TABLE `partidas` (
   `id_partida` int NOT NULL,
   `rodada_camp` int DEFAULT NULL,
   `data` date DEFAULT NULL,
   `horario` varchar(150) DEFAULT NULL,
   `resultado` varchar(150) DEFAULT NULL,
   `id_time_casa` int NOT NULL,
   `id_time_visitante` int NOT NULL,
   `id_estadio` int NOT NULL,
   `gol_mandante` int DEFAULT NULL,
   `gol_visitante` int DEFAULT NULL,
   PRIMARY KEY (`id_partida`),
   KEY `FK_time_casa` (`id_time_casa`),
   KEY `FK_time_vsitante` (`id_time_visitante`),
   KEY `FK_estadio` (`id_estadio`),
   CONSTRAINT `FK_estadio` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`),
   CONSTRAINT `FK_time_casa` FOREIGN KEY (`id_time_casa`) REFERENCES `time` (`id_time`),
   CONSTRAINT `FK_time_vsitante` FOREIGN KEY (`id_time_visitante`) REFERENCES `time` (`id_time`)
 );

desc time;


 alter table jogador drop constraint FK_time;
 alter table relista_eventos drop constraint FK_partida;
 alter table partidas drop constraint FK_time_casa;
 alter table partidas drop constraint FK_time_vsitante;
 alter table time modify id_time int auto_increment;
 alter table jogador add CONSTRAINT `FK_Time` FOREIGN KEY (`id_time`) REFERENCES `time` (`id_time`);
 alter table partidas add CONSTRAINT `FK_time_casa` FOREIGN KEY (`id_time_casa`) REFERENCES `time` (`id_time`);
 alter table partidas add  CONSTRAINT `FK_time_vsitante` FOREIGN KEY (`id_time_visitante`) REFERENCES `time` (`id_time`);
 alter table relista_eventos add CONSTRAINT `FK_partida` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`);
 
CREATE TABLE `partidas` (
   `id_partida` int NOT NULL,
   `rodada_camp` int DEFAULT NULL,
   `data` date DEFAULT NULL,
   `horario` varchar(150) DEFAULT NULL,
   `resultado` varchar(150) DEFAULT NULL,
   `id_time_casa` int NOT NULL,
   `id_time_visitante` int NOT NULL,
   `id_estadio` int NOT NULL,
   `gol_mandante` int DEFAULT NULL,
   `gol_visitante` int DEFAULT NULL,
   PRIMARY KEY (`id_partida`),
   KEY `FK_time_casa` (`id_time_casa`),
   KEY `FK_time_vsitante` (`id_time_visitante`),
   KEY `FK_TimePartida` (`id_estadio`),
   CONSTRAINT `FK_EstadioTime` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`),
   CONSTRAINT `FK_time_casa` FOREIGN KEY (`id_time_casa`) REFERENCES `time` (`id_time`),
   CONSTRAINT `FK_time_vsitante` FOREIGN KEY (`id_time_visitante`) REFERENCES `time` (`id_time`),
   CONSTRAINT `FK_TimePartida` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`)
 );
 
CREATE TABLE `relista_eventos` (
   `id_jogador` int NOT NULL,
   `id_eventos` int NOT NULL,
   `id_partida` int NOT NULL,
   `tempo` int DEFAULT NULL,
   KEY `FK_eventos` (`id_eventos`),
   KEY `FK_partida` (`id_partida`),
   KEY `FK_jogador` (`id_jogador`),
   CONSTRAINT `FK_eventos` FOREIGN KEY (`id_eventos`) REFERENCES `evento` (`id_eventos`),
   CONSTRAINT `FK_jogador` FOREIGN KEY (`id_jogador`) REFERENCES `jogador` (`id_jogador`),
   CONSTRAINT `FK_partida` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id_partida`)
 );
 
alter table time drop constraint FK_EstadioTime;
alter table time drop key FK_EstadioTime;
alter table partidas drop constraint FK_EstadioTime;
alter table estadio modify id_estadio int auto_increment;
alter table partidas add CONSTRAINT `FK_TimePartida` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`);
alter table time add CONSTRAINT `FK_TimeEstadio` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`id_estadio`);
 desc  partidas;
 show create table partidas;
 CREATE TABLE `estadio` (
   `id_estadio` int NOT NULL AUTO_INCREMENT,
   `nome` varchar(150) NOT NULL,
   `endereco` varchar(150) DEFAULT NULL,
   `capacidade` int DEFAULT NULL,
   PRIMARY KEY (`id_estadio`)
 );