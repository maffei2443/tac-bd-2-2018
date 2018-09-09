


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