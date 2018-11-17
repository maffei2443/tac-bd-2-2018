alter table paises
add sigla character varying (2)

select * from pais 
where id='BR'
limit 10

select id, nome, geometry from pais 
where id like 'BR'

select addgeometrycolumn(
	'public', 'estadio', 'geometry', 4326, 'POINT', 2
);

ALTER TABLE estadio
DROP COLUMN geometry;

delete from estadio
where 1=1;

select * from estadio as E, pais as P
where ST_within(E.geometry, P.geometry);

ALTER TABLE cidade
DROP COLUMN geometry;

select addgeometrycolumn(
	'public', 'cidade', 'geometry', 4326, 'POINT', 2
);

select * from geometry_columns;


select * from pais
where id='BR' or id='MX' or id='CA' or id='AU' or id='IN' or id='CN'

UPDATE cidade
SET pais = 'CA'
WHERE pais='CN';

select C.id, Co.inicio, Co.fim, P.id from cidade as C, pais as P, copa as Co
where ST_within(C.geometry, P.geometry)
co.abertura = 'itu' and C.id = 'itu'

UPDATE copa
SET cidade_pas = 'CA'
WHERE pais='CN';

select * from cidade as C, Pais P
where st_within(C.geometry, P.geometry)
and P.id = 'BR';