


-- query3
CREATE VIEW PLAYED AS
	SELECT DISTINCT P.id FROM PAIS P, EQUIPE E
		WHERE P.id = E.pais_id
	ORDER BY id;

CREATE VIEW NOTSEDE AS
	SELECT DISTINCT id FROM PAIS
		WHERE id not IN (
			SELECT DISTINCT S.pais_id FROM SEDE S
		)
	ORDER BY id;

-- query4
CREATE VIEW FOISEDE AS
	SELECT DISTINCT P.id FROM PAIS P, SEDE S
		WHERE P.id = S.pais_id;
-- pessoa em equipe com mais de dois gols
CREATE VIEW PENAEQMAIS2GOLS AS
	SELECT distinct P.id, P.nome FROM PESSOA P, EQUIPE E, JOGO J 
	WHERE P.id = E.id and 
		( (E.id = J.eq1 and J.gol1 > 2) or (E.id = J.eq2 and J.gol2 > 2) )
	ORDER BY P.id;

-- Qtd de gols por copa por equipe
CREATE VIEW COPAGOLEQUIPE AS
select J.COPA_id id,
		   	SUM(CASE WHEN J.eq1 = E.id THEN J.gol1 ELSE J.gol2 END) COPA_GOL_EQUIPE,
		   	E.id EQUIPE from JOGO J, EQUIPE E
		   	WHERE (J.eq1 = E.id or J.eq2 = E.id)
	GROUP BY COPA_id, E.id
	ORDER BY COPA_GOL_EQUIPE DESC, E.id DESC;
CREATE VIEW COPAGOL AS
	SELECT id , SUM(COPA_GOL_EQUIPE) as GOL FROM (SELECT * FROM COPAGOLEQUIPE) as A
	GROUP BY id;