-- Q1
-- Todas as copas de 2010 a 2030 que tiveram mais de 2 jogos com mais de 5 
-- gols cada, quantos jogos satisfizeram essa condição e 
-- quantos gols houveram nelas.

SELECT * FROM (	SELECT * FROM (	SELECT A.COPA_id id, Count(COPA_id) MAISQ5GOLS from (
	SELECT J.COPA_id, J.numero FROM JOGO J WHERE (J.gol1 + J.gol2) > 5) A
	GROUP BY A.COPA_id HAVING COUNT(COPA_id) > 2
) as A WHERE A.id BETWEEN 2010 and 2030) as A NATURAL JOIN COPAGOL;


-- Q2
-- Todos os jogadores nascidos depois de 1900-01-01 que participaram de 3+ copas OU foram
-- tecnicos OU que nasceram na cidade sede de alguma copa.
SELECT * FROM (SELECT * FROM (	SELECT PE.id, PE.nome FROM PESSOA PE, PAIS PA, SEDE S
	WHERE PA.id = PE.pais and PE.pais = S.pais_id
	GROUP BY PE.id
	UNION
	SELECT pessoa_id, nome FROM ( SELECT pessoa_id, COUNT(pessoa_id) qtd, P.nome 
	FROM JOGADORES, PESSOA P
	WHERE P.id = pessoa_id GROUP BY pessoa_id) A where A.qtd >= 3
	UNION
	SELECT P.id, P.nome ID_Tecnico FROM PESSOA P, EQUIPE E WHERE P.id = E.pessoa_id
) T
ORDER BY id
) R natural join PESSOA as P WHERE nasc > "1900-01-01" and P.id = R.id;




-- Q3
-- Todos os paises que já participaram de copas do mundo E nao foram sede nenhuma vez.
SELECT * FROM PLAYED natural join NOTSEDE;


-- Q4
-- Pessoas cujo país de origem já foi sede e participou de alguma equipe que
-- fez mais de dois gols em algum jogo.
SELECT id, nome from (
	(SELECT DISTINCT PE.nome ,PE.id FROM PESSOA as PE, PAIS as PA
	WHERE PE.pais in (
		SELECT id from FOISEDE
	)) M
	natural join
	(SELECT id, nome from PENAEQMAIS2GOLS) as MM
)
ORDER BY id;

-- Q5
-- Equipes que fizeram mais de 5 gols em algum jogo em alguma copa,
-- as copas nas quais conseguiram isso, o número de gols que cada equipe
-- fez naquela copa e  o número de gols da copa como um todo.
-- Ordenado por: quantidade de gols e id da equipe.


SELECT id, COPA_GOL_EQUIPE, EQUIPEID, GOL GOLCOPA FROM (SELECT * FROM ( SELECT J.COPA_id id,
	SUM(CASE WHEN J.eq1 = E.id THEN J.gol1 ELSE J.gol2 END) COPA_GOL_EQUIPE,
	E.id EQUIPEID FROM JOGO J, EQUIPE E
	WHERE (J.eq1 = E.id or J.eq2 = E.id)
GROUP BY COPA_id, E.id
ORDER BY COPA_GOL_EQUIPE DESC, E.id DESC) as A WHERE COPA_GOL_EQUIPE > 5)
as M NATURAL JOIN COPAGOL;

