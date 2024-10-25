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

-- Quando for inserir um registro do tipo date, lembre de colocar a data entre '' 
insert into eventos_passados (data_concurso, bola1, bola2, bola3, bola4, bola5, bola6) 
	values ('2024-10-24', 03, 17, 18, 19, 20, 55);

update eventos_passados
set data_concurso = '2024-10-24'
where id_concurso = 2789;

CREATE TABLE numeros (
    numero INT PRIMARY KEY
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

delete from eventos_passados
where id_concurso = 2789;

select * from eventos_passados;
select * from eventos_futuros;
select * from numeros;

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
    
SELECT STD(bola1) AS desvio_bola1, STD(bola2) AS desvio_bola2, STD(bola3) AS desvio_bola3, STD(bola4) AS desvio_bola4, STD(bola5) AS desvio_bola5, STD(bola6) AS desvio_bola6
FROM eventos_passados;
    
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

-- Quais foram as datas e sequencias que apareceram o número 60
select 
	data_concurso, 
    bola1, 
    bola2, 
    bola3, 
    bola4, 
    bola5, 
    bola6
from 
	eventos_passados
where bola6 = 60;

-- Sequencia dentro de um intervalo de tempo
select data_concurso, bola1, bola2, bola3, bola4, bola5, bola6
from eventos_passados
where data_concurso between '2024-01-01' and '2024-10-16';

-- Criação da tabela de números de 1 a 60
SELECT 
    n.numero,
    COALESCE(b1.ocorrencias, 0) AS bola1,
    COALESCE(b2.ocorrencias, 0) AS bola2,
    COALESCE(b3.ocorrencias, 0) AS bola3,
    COALESCE(b4.ocorrencias, 0) AS bola4,
    COALESCE(b5.ocorrencias, 0) AS bola5,
    COALESCE(b6.ocorrencias, 0) AS bola6
FROM 
    numeros n
LEFT JOIN 
    (SELECT bola1 AS numero, COUNT(*) AS ocorrencias FROM eventos_passados GROUP BY bola1) b1 ON n.numero = b1.numero
LEFT JOIN 
    (SELECT bola2 AS numero, COUNT(*) AS ocorrencias FROM eventos_passados GROUP BY bola2) b2 ON n.numero = b2.numero
LEFT JOIN 
    (SELECT bola3 AS numero, COUNT(*) AS ocorrencias FROM eventos_passados GROUP BY bola3) b3 ON n.numero = b3.numero
LEFT JOIN 
    (SELECT bola4 AS numero, COUNT(*) AS ocorrencias FROM eventos_passados GROUP BY bola4) b4 ON n.numero = b4.numero
LEFT JOIN 
    (SELECT bola5 AS numero, COUNT(*) AS ocorrencias FROM eventos_passados GROUP BY bola5) b5 ON n.numero = b5.numero
LEFT JOIN 
    (SELECT bola6 AS numero, COUNT(*) AS ocorrencias FROM eventos_passados GROUP BY bola6) b6 ON n.numero = b6.numero
ORDER BY n.numero;
















