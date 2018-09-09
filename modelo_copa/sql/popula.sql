USE mydb;
INSERT INTO PAIS (id, nome) VALUES ("BR", "Brasil");
INSERT INTO PAIS (id, nome) VALUES ("US", "Tio Sam");
INSERT INTO PAIS (id, nome) VALUES ("CH", "Li's Country");
INSERT INTO PAIS (id, nome) VALUES ("NZ", "Non Zense");
INSERT INTO PAIS (id, nome) VALUES ("OW", "Own Wom");
INSERT INTO PAIS (id, nome) VALUES ("NU", "NUZE");
INSERT INTO PAIS (id, nome) VALUES ("NO", "I dont play");


INSERT INTO COPA (id, inicio, fim, abertura) VALUES (2018, "2018-12-01", "2019-06-01", "itu");
INSERT INTO COPA (id, inicio, fim, abertura) VALUES (2027, "2027-12-01", "2028-06-01", "mycity");
INSERT INTO COPA (id, inicio, fim, abertura) VALUES (2040, "2040-12-01", "2041-06-01", "xiaomi");
INSERT INTO COPA (id, inicio, fim, abertura) VALUES (2048, "2018-12-01", "2019-06-01", "zoey101");
INSERT INTO COPA (id, inicio, fim, abertura) VALUES (2021, "2021-12-01", "2022-06-01", "goia leveau");


INSERT INTO SEDE (pais_id, copa) VALUES ("BR", 2018);
INSERT INTO SEDE (pais_id, copa) VALUES ("US", 2027);
INSERT INTO SEDE (pais_id, copa) VALUES ("CH", 2040);
INSERT INTO SEDE (pais_id, copa) VALUES ("NZ", 2048);
INSERT INTO SEDE (pais_id, copa) VALUES ("NZ", 2021);


INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "BR", "lulanaro", "6666-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "US", "trumlary", "1122-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "CH", "joao darc", "2013-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "NZ", "oszro", "1999-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "OW", "meliodas", "1990-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "OW", "player1", "2000-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "OW", "player2", "2002-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "OW", "gener1", "1200-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "OW", "tsuru", "2400-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "OW", "roarr", "1000-06-06");
INSERT INTO PESSOA (pais, nome, nasc) VALUES ( "OW", "garou", "2030-06-06");


INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2018, "BR", 1);
INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2018, "US", 2);
INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2018, "CH", 3);
INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2018, "NZ", 4);
INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2027, "BR", 5);
INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2027, "OW", 6);
INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2021, "CH", 6);
INSERT INTO EQUIPE (copa, pais_id, pessoa_id) VALUES ( 2021, "NU", 1);


INSERT INTO JOGADORES (pessoa_id, equipe_id) VALUES ( 1, 1);
INSERT INTO JOGADORES (pessoa_id, equipe_id) VALUES ( 1, 4);
INSERT INTO JOGADORES (pessoa_id, equipe_id) VALUES ( 1, 7);
INSERT INTO JOGADORES (pessoa_id, equipe_id) VALUES ( 2, 2);
INSERT INTO JOGADORES (pessoa_id, equipe_id) VALUES ( 2, 3);
INSERT INTO JOGADORES (pessoa_id, equipe_id) VALUES ( 2, 5);


INSERT INTO JOGO (data, hora, estadio, eq1, eq2, gol1, gol2, COPA_id) VALUES ("2018-12-14", "11:11:11", "generico1", 1, 2, 3, 1, 2018);
INSERT INTO JOGO (data, hora, estadio, eq1, eq2, gol1, gol2, COPA_id) VALUES ("2018-11-03", "11:11:11", "generico1", 3, 4, 1, 7, 2018);
INSERT INTO JOGO (data, hora, estadio, eq1, eq2, gol1, gol2, COPA_id) VALUES ("2018-11-04", "11:11:11", "generico1", 3, 1, 1, 7, 2018);
INSERT INTO JOGO (data, hora, estadio, eq1, eq2, gol1, gol2, COPA_id) VALUES ("2018-11-05", "11:11:11", "generico1", 3, 2, 1, 7, 2018);
INSERT INTO JOGO (data, hora, estadio, eq1, eq2, gol1, gol2, COPA_id) VALUES ("2018-12-11", "11:11:11", "generico1", 1, 4, 1, 1, 2027);
INSERT INTO JOGO (data, hora, estadio, eq1, eq2, gol1, gol2, COPA_id) VALUES ("2018-11-21", "11:11:11", "generico1", 4, 5, 3, 1, 2018);
INSERT INTO JOGO (data, hora, estadio, eq1, eq2, gol1, gol2, COPA_id) VALUES ("2018-11-22", "11:11:11", "generico1", 3, 5, 6, 6, 2040);

