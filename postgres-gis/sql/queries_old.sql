-- Q1
-- Cidades brasileiras
select C.id Cidade, P.id from cidade as C, pais as P
where ST_within(C.geometry, P.geometry)
and P.id = 'BR'
GROUP by Cidade, P.id
-- Q2 seleciona o pais que contem a cidade itu
SELECT P.id, P.nome FROM pais as P, cidade as C where 
st_within(C.geometry, P.geometry) and C.id = 'itu'

-- Q3
-- Países com estádios que já foram palco de jogos com mais de 5 gols
SELECT C.id FROM pais as P, estadio as E, Jogo J
where st_contains(P.geometry, E.geometry )
and E.id = J.estadio
and (J.gol1 + J.gol2) > 5

-- Q4
-- Cidades brasileiras que serviram de abertura em copa antes de 2040
-- e os dados dessa copa.
select * from (select Co.abertura Cidade, P.id from cidade as C, pais as P, copa as Co
where ST_within(C.geometry, P.geometry)
and C.id = Co.abertura
and P.id = 'BR'
and Co.id < 2040
GROUP by Cidade, P.id) T inner join copa C
on T.cidade = C.abertura;


-- Q5
-- Cidades dos países dos quais técnicos vieram
select distinct C.id cidade from equipe EQ, Pessoa PE , Pais PA, Cidade C
where EQ.pessoa_id = PE.id
and PE.pais = PA.id
and st_within(C.geometry, PA.geometry)

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------