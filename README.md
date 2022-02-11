<h1 align="center"> Aplicação de Cadastro de Usuario</h1>

## Sobre
Minha primeira aplicação construída com a plataforma SE + MySQL + Servidor JBoss/Wildfly. ( [Configurações](https://github.com/felipe0059/CRUD-SE/tree/main/ServerConfigs) );

**Funcionalidades:**

1. Fazer login  
2. Consultar Usuários (Lista todos)  
3. Incluir Usuário  
4. Alterar Usuário  
5. Remover Usuário  

**Projeto estruturado em 2 tabelas utilizando o MySQL;**

 - A estrutura da tabela usuário :

• ID [int]  
• Nome [string]  
• Email [string]  
• Senha[string]  

- A estrutura da tabela telefones :
 
• ID [int]  
• DDD [string]  
• Número [string]  
• Tipo[string]  


## Implementações futuras


-Warning para usuário inexistente;
-Migração para o banco de dados PostGRE;
-Testes unitários (Junit);
-Deploy da aplicação;


## Como rodar a aplicação com a IDE Eclipse:

- Clone o repositório:
 
```bash

$git clone https://github.com/felipe0059/CRUD-SE

```
- Instale o Servidor JBoss/Wildfly disponível neste [link](https://www.wildfly.org/downloads/);
- Altere as pastas para as inclusas neste [arquivo](https://github.com/felipe0059/CRUD-SE/tree/main/ServerConfigs) para a pasta de arquivos do servidor no seu computador;
- Baixe as [Queries](https://github.com/felipe0059/CRUD-SE/tree/main/Queries) para o banco de dados;
- Altere a propriedade senha na classe "Conexão", no package **br.com.datainfo.conexão**, para os dados do seu Database no seu MySQL; (para alguns casos a porta de execução também deve ser alterada)
- Importe o arquivo das Queries no Banco de dados e faça a execução.
- No Eclipse clique com o botão direito no diretório do projeto, selecione "Run As.." e depois selecione "Run on Server."
- A aplicação iniciará sozinha no seu navegador padrão;
