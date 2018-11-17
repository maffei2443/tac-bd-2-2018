create extension postgis;
create extension postgis_topology;

-- Create table PESSOA
CREATE TABLE PESSOA (
  id SERIAL,
  pais VARCHAR(2),
  nome VARCHAR(50),
  nasc DATE NOT NULL,
  CONSTRAINT pk_PESSOA PRIMARY KEY (id)
);

-- Create table ESTADIO
CREATE TABLE ESTADIO (
  id VARCHAR(50),
  pais_id VARCHAR(2),
  geometry point,
  CONSTRAINT pk_ESTADIO PRIMARY KEY (id)
);

-- Create the spatial index on geometry column of ESTADIO
CREATE INDEX SIDX_ESTADIO
  ON ESTADIO
  USING GIST (geometry);

-- Create table COPA
CREATE TABLE COPA (
  id INTEGER,
  inicio DATE NOT NULL,
  fim DATE NOT NULL,
  abertura VARCHAR(50) NOT NULL,
  CONSTRAINT pk_COPA PRIMARY KEY (id)
);

-- Create table SEDE
CREATE TABLE SEDE (
  pais_id VARCHAR(2),
  copa INTEGER,
  CONSTRAINT pk_SEDE PRIMARY KEY (pais_id,copa)
);

-- Create table JOGADORES
CREATE TABLE JOGADORES (
  pessoa_id INTEGER,
  equipe_id INTEGER,
  CONSTRAINT pk_JOGADORES PRIMARY KEY (pessoa_id,equipe_id)
);

-- Create table CIDADE
CREATE TABLE CIDADE (
  id VARCHAR(50),
  pais VARCHAR(2),
  geometry point,
  CONSTRAINT pk_CIDADE PRIMARY KEY (id,pais)
);

-- Create the spatial index on geometry column of CIDADE
CREATE INDEX SIDX_CIDADE
  ON CIDADE
  USING GIST (geometry);

-- Create table PAIS
CREATE TABLE PAIS (
  id VARCHAR(2),
  nome VARCHAR(50),
  geometry polygon,
  CONSTRAINT pk_PAIS PRIMARY KEY (id)
);

-- Create the spatial index on geometry column of PAIS
CREATE INDEX SIDX_PAIS
  ON PAIS
  USING GIST (geometry);

-- Create table EQUIPE
CREATE TABLE EQUIPE (
  id SERIAL,
  copa INTEGER,
  pais_id VARCHAR(2),
  pessoa_id INTEGER,
  CONSTRAINT pk_EQUIPE PRIMARY KEY (id,copa)
);

-- Create table JOGO
CREATE TABLE JOGO (
  numero SERIAL,
  COPA_id INTEGER,
  data DATE,
  hora TIME,
  estadio VARCHAR(50),
  eq1 INTEGER,
  eq2 INTEGER,
  gol1 INTEGER NOT NULL,
  gol2 INTEGER NOT NULL,
  CONSTRAINT pk_JOGO PRIMARY KEY (numero,COPA_id)
);

-- Add new column (foreign key) on table JOGO due conventional-relationship-JOGO-EQUIPE1-EQUIPE
      -- ALTER TABLE JOGO
      --   ADD COLUMN EQUIPE_id INTEGER,
      --   ADD COLUMN EQUIPE_copa INTEGER;

-- Add foreign key constraint on table JOGO due conventional-relationship-JOGO-EQUIPE1-EQUIPE
      -- ALTER TABLE JOGO ADD
      --   CONSTRAINT fk_JOGO_ref_EQUIPE
      --   FOREIGN KEY (EQUIPE_id,EQUIPE_copa)
      --   REFERENCES EQUIPE(id,copa);

-- Add new column (foreign key) on table EQUIPE due conventional-relationship-EQUIPE--COPA
ALTER TABLE EQUIPE
  ADD COLUMN COPA_id INTEGER;

-- Add foreign key constraint on table EQUIPE due conventional-relationship-EQUIPE--COPA
ALTER TABLE EQUIPE ADD
  CONSTRAINT fk_EQUIPE_ref_COPA
  FOREIGN KEY (COPA_id)
  REFERENCES COPA(id);

-- Add new column (foreign key) on table JOGO due conventional-relationship-JOGO-EQUIPE2-EQUIPE
-- ALTER TABLE JOGO
--   ADD COLUMN EQUIPE_id INTEGER,
--   ADD COLUMN EQUIPE_copa INTEGER;

-- Add foreign key constraint on table JOGO due conventional-relationship-JOGO-EQUIPE2-EQUIPE
-- ALTER TABLE JOGO ADD
--   CONSTRAINT fk_JOGO_ref_EQUIPE
--   FOREIGN KEY (EQUIPE_id,EQUIPE_copa)
--   REFERENCES EQUIPE(id,copa);

-- Add new column (foreign key) on table JOGO due conventional-relationship-JOGO-PERTENCE-COPA
-- ALTER TABLE JOGO
--   ADD COLUMN COPA_id INTEGER;

-- Add foreign key constraint on table JOGO due conventional-relationship-JOGO-PERTENCE-COPA
-- ALTER TABLE JOGO ADD
--   CONSTRAINT fk_JOGO_ref_COPA
--   FOREIGN KEY (COPA_id)
--   REFERENCES COPA(id);

-- Add new column (foreign key) on table SEDE due conventional-relationship-COPA--SEDE
    -- ALTER TABLE SEDE
    --   ADD COLUMN COPA_id INTEGER;

-- Add foreign key constraint on table SEDE due conventional-relationship-COPA--SEDE
    -- ALTER TABLE SEDE ADD
    --   CONSTRAINT fk_SEDE_ref_COPA
    --   FOREIGN KEY (copa)
    --   REFERENCES COPA(id);

-- Add new column (foreign key) on table COPA due conventional-relationship-COPA-ABERTURA-CIDADE
ALTER TABLE COPA
  ADD COLUMN CIDADE_id VARCHAR(50),
  ADD COLUMN CIDADE_pais VARCHAR(2);

-- Add foreign key constraint on table COPA due conventional-relationship-COPA-ABERTURA-CIDADE
ALTER TABLE COPA ADD
  CONSTRAINT fk_COPA_ref_CIDADE
  FOREIGN KEY (CIDADE_id,CIDADE_pais)
  REFERENCES CIDADE(id,pais);

-- Add new column (foreign key) on table JOGADORES due conventional-relationship-PESSOA--JOGADORES
-- ALTER TABLE JOGADORES
--   ADD COLUMN PESSOA_id INTEGER;

-- Add foreign key constraint on table JOGADORES due conventional-relationship-PESSOA--JOGADORES
ALTER TABLE JOGADORES ADD
  CONSTRAINT fk_JOGADORES_ref_PESSOA
  FOREIGN KEY (PESSOA_id)
  REFERENCES PESSOA(id);

-- Add new column (foreign key) on table JOGO due conventional-relationship-JOGO-ESTADIO-ESTADIO
ALTER TABLE JOGO
  ADD COLUMN ESTADIO_id VARCHAR(50);

-- Add foreign key constraint on table JOGO due conventional-relationship-JOGO-ESTADIO-ESTADIO
ALTER TABLE JOGO ADD
  CONSTRAINT fk_JOGO_ref_ESTADIO
  FOREIGN KEY (ESTADIO_id)
  REFERENCES ESTADIO(id);

-- Add new column (foreign key) on table EQUIPE due conventional-relationship-EQUIPE-TREINADOR-PESSOA
-- ALTER TABLE EQUIPE
--   ADD COLUMN PESSOA_id INTEGER;

-- Add foreign key constraint on table EQUIPE due conventional-relationship-EQUIPE-TREINADOR-PESSOA
ALTER TABLE EQUIPE ADD
  CONSTRAINT fk_EQUIPE_ref_PESSOA
  FOREIGN KEY (PESSOA_id)
  REFERENCES PESSOA(id);

-- Add new column (foreign key) on table JOGADORES due conventional-relationship-JOGADORES--EQUIPE
ALTER TABLE JOGADORES
  ADD COLUMN EQUIPE_idd INTEGER,
  ADD COLUMN EQUIPE_copa INTEGER;

-- Add foreign key constraint on table JOGADORES due conventional-relationship-JOGADORES--EQUIPE
ALTER TABLE JOGADORES ADD
  CONSTRAINT fk_JOGADORES_ref_EQUIPE
  FOREIGN KEY (EQUIPE_idd,EQUIPE_copa)
  REFERENCES EQUIPE(id,copa);

-- Add new column (foreign key) on table SEDE due conventional-relationship-PAIS--SEDE
-- ALTER TABLE SEDE
--   ADD COLUMN PAIS_id VARCHAR(2),
--   ADD COLUMN PAIS_nome VARCHAR(50);

-- Add foreign key constraint on table SEDE due conventional-relationship-PAIS--SEDE
ALTER TABLE SEDE ADD
  CONSTRAINT fk_SEDE_ref_PAIS_id
  FOREIGN KEY (PAIS_id)
  REFERENCES PAIS(id);

ALTER TABLE SEDE ADD
  CONSTRAINT fk_SEDE_ref_COPA_id
  FOREIGN KEY (copa)
  REFERENCES COPA(id);