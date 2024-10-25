use projeto_ms;


-- Quantidade de aparições por bola em um determinado periodo de tempo
WITH numeros AS (
    SELECT DISTINCT bola1 AS numero FROM eventos_passados
    UNION
    SELECT DISTINCT bola2 AS numero FROM eventos_passados
    UNION
    SELECT DISTINCT bola3 AS numero FROM eventos_passados
    UNION
    SELECT DISTINCT bola4 AS numero FROM eventos_passados
    UNION
    SELECT DISTINCT bola5 AS numero FROM eventos_passados
    UNION
    SELECT DISTINCT bola6 AS numero FROM eventos_passados
)

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
    (SELECT bola1 AS numero, COUNT(*) AS ocorrencias 
     FROM eventos_passados 
     WHERE data_concurso BETWEEN '2024-01-01' AND '2024-10-16' 
     GROUP BY bola1) b1 ON n.numero = b1.numero
LEFT JOIN 
    (SELECT bola2 AS numero, COUNT(*) AS ocorrencias 
     FROM eventos_passados 
     WHERE data_concurso BETWEEN '2024-01-01' AND '2024-10-16' 
     GROUP BY bola2) b2 ON n.numero = b2.numero
LEFT JOIN 
    (SELECT bola3 AS numero, COUNT(*) AS ocorrencias 
     FROM eventos_passados 
     WHERE data_concurso BETWEEN '2024-01-01' AND '2024-10-16' 
     GROUP BY bola3) b3 ON n.numero = b3.numero
LEFT JOIN 
    (SELECT bola4 AS numero, COUNT(*) AS ocorrencias 
     FROM eventos_passados 
     WHERE data_concurso BETWEEN '2024-01-01' AND '2024-10-16' 
     GROUP BY bola4) b4 ON n.numero = b4.numero
LEFT JOIN 
    (SELECT bola5 AS numero, COUNT(*) AS ocorrencias 
     FROM eventos_passados 
     WHERE data_concurso BETWEEN '2024-01-01' AND '2024-10-16' 
     GROUP BY bola5) b5 ON n.numero = b5.numero
LEFT JOIN 
    (SELECT bola6 AS numero, COUNT(*) AS ocorrencias 
     FROM eventos_passados 
     WHERE data_concurso BETWEEN '2024-01-01' AND '2024-10-16' 
     GROUP BY bola6) b6 ON n.numero = b6.numero
ORDER BY n.numero;