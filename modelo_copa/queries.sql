-- + Todas as copas de 2010 a 2030 que tiveram mais de 2 jogos com mais de 5 
-- gols cada, bem como como quantos gols houveram nelas.

SELECT * FROM (
	SELECT COPA_id, Count(COPA_id), SUM(Gols) from (
		SELECT J.COPA_id, (J.gol1 + J.gol2) Gols, J.numero FROM JOGO J
		WHERE (J.gol1 + J.gol2) > 5
	) Cup
	GROUP BY COPA_id
	HAVING COUNT(COPA_id) > 2
) A
WHERE A.COPA_id BETWEEN 2010 and 2030;



-- + Todos os jogadores nascidos depois de 1900 que participaram de 3+ copas ou foram
 -- tecnicos ou que nasceram na cidade sede da copa em questão.
SELECT * FROM (
	SELECT * FROM (
		SELECT PE.id, PE.nome FROM PESSOA PE, PAIS PA, SEDE S
			WHERE PA.id = PE.pais and PE.pais = S.pais_id 
			GROUP BY PE.id
		UNION
		-- Seleciona jogadores que participaram de 3+ copas
		SELECT pessoa_id, nome FROM (
			SELECT pessoa_id, COUNT(pessoa_id) qtd, P.nome from JOGADORES, PESSOA P
			WHERE P.id = pessoa_id
			GROUP BY pessoa_id
			) A where A.qtd >= 3
		UNION
		-- Seleciona os técnicos, com nome inclusive, e copa/equipe
			SELECT P.id, P.nome ID_Tecnico FROM PESSOA P, EQUIPE E
				WHERE P.id = E.pessoa_id	
	) T
	ORDER BY id
) R natural join PESSOA P  -- para mostrar alguns dados das pessoas. Sem o natural join, repete id e pais
	WHERE nasc > "1900-01-01" and P.id = R.id;
;




-- + Todas as equipes cujo pais de origem ainda NAO sediou copa alguma.
	-- seleciona paises que JAH sediaram

SELECT distinct P.id FROM PAIS P, SEDE S WHERE P.id = S.pais_id;
-- Encontre todos os paises com o contador de copas sediadas em zero E
select distinct id from PAIS
	WHERE id not in (
		SELECT distinct S.pais_id from SEDE S
	);


select distinct id from PAIS
	WHERE id not in (
		SELECT distinct S.pais_id from SEDE S
	);
-- Deu trabalho pra caramba fazer essa acima!!! Fui dormir 3:40....

-- Encontre todos os países que participaram de ao menos uma copa.

SELECT distinct P.id from PAIS P, EQUIPE E
	WHERE P.id = E.pais_id
	GROUP BY P.id;

-- Encontra todos os paises

select distinct id from PAIS;




-- 
-- 
-- 
-- 
-- SELECT PE.id, PE.nome FROM PESSOA PE, PAIS PA, SEDE S, EQUIPE E
-- 	WHERE (PA.id = PE.pais and PE.pais = S.pais_id)
-- 	or		(PE.id = E.pessoa_id)
-- 	GROUP BY PE.id;
-- -- Seleciona jogadores que participaram de 3+ copas
-- SELECT * FROM (
-- 	SELECT pessoa_id, COUNT(pessoa_id) qtd from JOGADORES
-- 	GROUP BY pessoa_id
-- 	)A where A.qtd >= 3;
-- -- Seleciona os técnicos, com nome inclusive, e copa/equipe
-- SELECT * FROM (
-- 	SELECT P.nome, P.id ID_Tecnico, E.id Id_Equipe, E.copa Copa FROM PESSOA P, EQUIPE E
-- 	WHERE P.id = E.pessoa_id
-- ) A;

-- 
-- 
-- 
-- 

--  Seleciona pessoa que nasceu no país que sediou alguma copa
SELECT PE.id FROM PESSOA PE, PAIS PA, SEDE S
	WHERE PA.id = PE.pais and PE.pais = S.pais_id 
	GROUP BY PE.id;
-- Seleciona jogadores que participaram de 3+ copas
SELECT * FROM (
	SELECT pessoa_id, COUNT(pessoa_id) qtd from JOGADORES
	GROUP BY pessoa_id
	)A where A.qtd >= 3;
-- Seleciona os técnicos, com nome inclusive, e copa/equipe
SELECT * FROM (
	SELECT P.nome, P.id ID_Tecnico, E.id Id_Equipe, E.copa Copa FROM PESSOA P, EQUIPE E
	WHERE P.id = E.pessoa_id
) A;

SELECT * FROM 
WHERE nasc > "1900-01-01";

-- 
-- 
-- 
-- 
-- 
-- 


-- + Todos os jogos nos quais cada equipe tece sua primeira vitória na copa.
-- (ps: contando que uma equipe nao joga duas vezes no mesmo dia)
SELECT MIN(data), numero from JOGO A
	WHERE A.eq1 > A.eq2
	GROUP BY data
;
