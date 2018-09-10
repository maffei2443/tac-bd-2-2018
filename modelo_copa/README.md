+ Autor: Leonardo Maffei da Silva
+ Mat: 160033811

+ Estrutura do projeto

+ doc/:
    * pasta contendo o relatório do projeto
+ img/:
    * onde estão todas as imagens utilizadas no relatório.
+ model/:
    * onde está o arquivo *modelo.mwb*, para que se gere novamente
        o SQL que cria o banco (reprodutibilidade).
+ sql/:
    * createView.sql : arquivo que contém os scripts para criação das views
        utilizadas para facilitar a realização de algumas consultas.
    * criaBanco.sql : script que, ao ser executado pelo *mysql*, cria o banco e as 
        views, caso o arquivo seja executado nesta pasta.
    * queries.sql : arquivo contendo as queries descritas no relatório e o 
        significado de cada uma.

+ Notas.md: algumas notas tomadas ao longo da modelagem do banco.
