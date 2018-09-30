1. Ter instalado *postgres+postgis*, *pgadmin* e *qgis*.

2. Abrir QGis e pgadmin

2. Criar banco de dados.
	+ Abrir **pgadmin**
	+ Servers -> PostgreSQLX.Y(connec to to server, pode ser necessário senha) -> Database 
		--> Create -> Database... **prestar atenção ao nome do usuario; será usado dps** --> Save

3. Adicionar extensão ao banco criado
	+ Abrir **pgadmin**
	+ Databases -> *{base criada}* -> Extensions --> Create... -> Extension...
	+ No campo *nome*, **postgis**

4. Conectar a base criada com o PostGIS **QGIS**
	+ Selecionar Ícone do Elefante (barra lateral e vertical, à esquerda)
	+ Selecione **Novo**:
		* Nome: qqer um decente
		* Serviço: deixar em branco
		* host: localhost
		* porta: 5432
		* base de dados: a **fucking** base de dados criada no *passo 2*
		* usuário: o **usuário referido no passo 2, que eu DISSE que era importante**
		* senha: whatever...
		* teste a conexão: se ser certo, massa! Senão, sinto muito.

5. Importar dados em formato *shapefile* para o PostGIS
	+ de volta à interface inicial do QGis, selecione **Banco de dados** -> Gerenciador BD
		* Na nova janela, selecionar (lateral esquerda):
			+ PostGIS -> *{base criada}* -> public -> **Seta direcionada para BAIXO** (fica ao lado de uma seta direcionada para cima)
			+ Campo *Entrada*: selecionar o arquivo *.shp* desejado
			+ Clique na opção superior direita **Opções de Atualização**
			+ Clique em **Ok**

6. Visulização dos Dados com o *QGis*
	+ Ainda na tela aberta ap se clicar em *Gerenciador BD*, no item acima,
		arraste a tabela incluída no banco de dados para o QGis, na grande área em branco.
	+ Enjoy your data!