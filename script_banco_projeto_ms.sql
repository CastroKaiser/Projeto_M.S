create database projeto_ms;
use projeto_ms;

create table eventos_passados (
	id_concurso int primary key not null auto_increment,
    data_concurso date,
    bola1 int,
    bola2 int,
    bola3 int,
    bola4 int,
    bola5 int,
    bola6 int
);

create table eventos_futuros (
	id_eventoFuturo int primary key not null auto_increment,
    bola1 int,
    bola2 int,
    bola3 int,
    bola4 int,
    bola5 int,
    bola6 int
);
