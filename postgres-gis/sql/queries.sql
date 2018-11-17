-- Q1
-- Cidades brasileiras
-- q1_brasileiras
select C.id Cidade, C.geometry as cidade_local, P.id from cidade as C, pais as P
where ST_within(C.geometry, P.geometry)
and P.id = 'BR'
GROUP by Cidade, P.id, C.geometry
-- Q2 seleciona o pais que contem a cidade itu
-- q2_pais_itu
SELECT P.id, P.nome, P.geometry local FROM pais as P, cidade as C where 
st_within(C.geometry, P.geometry) and C.id = 'itu'

-- Q3
-- Países com estádios que já foram palco de jogos com mais de 5 gols
-- q3_pais_mais_5_gols
SELECT distinct P.id, P.geometry FROM pais as P, estadio as E, Jogo J
where st_contains(P.geometry, E.geometry )
and E.id = J.estadio
and (J.gol1 + J.gol2) > 5

-- Q4
-- Cidades brasileiras que serviram de abertura em copa antes de 2040
-- q4_cidades_br_sede_antes_2040
-- e os dados dessa copa.
select * from (select Co.abertura Cidade, P.id pais, C.geometry cidade_local from cidade as C, pais as P, copa as Co
where ST_within(C.geometry, P.geometry)
and C.id = Co.abertura
and P.id = 'BR'
and Co.id < 2040
GROUP by Cidade, P.id, C.geometry)  T inner join copa C
on T.cidade = C.abertura;



-- Q5
-- Cidades dos países dos quais técnicos vieram
-- q5_cidades_paises_tecnicos
select distinct C.id, C.geometry cidade from equipe EQ, Pessoa PE , Pais PA, Cidade C
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