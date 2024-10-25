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

select * from eventos_passados;
select * from eventos_futuros;

-- Esta fazendo a média das bolas 
select 
	avg(bola1) as media_bola1, 
    avg(bola2) as media_bola2, 
    avg(bola3) as media_bola3, 
    avg(bola4) as media_bola4, 
    avg(bola5) as media_bola5,
    avg(bola6) as media_bola6
from 
	eventos_passados;
    
-- Está contando o número de aparições de 1 a 60
SELECT numero, COUNT(*) AS total
FROM (
    SELECT bola1 AS numero FROM eventos_passados
    UNION ALL
    SELECT bola2 FROM eventos_passados
    UNION ALL
    SELECT bola3 FROM eventos_passados
    UNION ALL
    SELECT bola4 FROM eventos_passados
    UNION ALL
    SELECT bola5 FROM eventos_passados
    UNION ALL
    SELECT bola6 FROM eventos_passados
) AS todas_bolas
GROUP BY numero
ORDER BY numero;


-- Números que tem a mesma contagem de ocorrencias
SELECT total, GROUP_CONCAT(numero ORDER BY numero) AS numeros
FROM (
    SELECT numero, COUNT(*) AS total
    FROM (
        SELECT bola1 AS numero FROM eventos_passados
        UNION ALL
        SELECT bola2 FROM eventos_passados
        UNION ALL
        SELECT bola3 FROM eventos_passados
        UNION ALL
        SELECT bola4 FROM eventos_passados
        UNION ALL
        SELECT bola5 FROM eventos_passados
        UNION ALL
        SELECT bola6 FROM eventos_passados
    ) AS todas_bolas
    WHERE numero BETWEEN 1 AND 60
    GROUP BY numero
) AS contagem
GROUP BY total
HAVING COUNT(*) > 1  -- Filtra para mostrar apenas as contagens que têm mais de um número
ORDER BY total DESC;  -- Ordena pela contagem total em ordem decrescente
