# dio-sql-challenge
Projeto desenvolvido como parte de um desafio de bootcamp, com foco em análise de dados utilizando SQL.

## 1. Estrutura do Projeto
Este projeto segue a seguinte estrutura:

__dio-sql-challenge/__ <br>
├── README.md <br>
├── database/ <br>
│   └── ecommerce.sql <br>
├── data/ <br>
│   └── insert_data.sql <br>
├── queries/ <br>
│   └── ecommerce_analysis.sql <br>
└── docs/ <br>
   └── schema_diagram.png (opcional) <br>

- Na pasta database está disponibilizado o schema criado com banco de dados e tabelas;
- Na pasta data está disponibilizado o arquivo _.sql_ utilizado para input dos dados no banco;
- Na pasta queries está disponibilizado o arquivo _.sql_ utilizado para realização de consultas no banco;
- Na pasta docs, está disponibilizado arquivos auxiliares para documentação desse desafio.

## 2. Modelagem
O modelo construído contém 12 tabelas:
- Cliente
- Entrega
- Estoque
- Fornecedor
- Pagamento
- Pedido
- PedidoProduto
- Produto
- Produtoestoque
- Produtofornecedor
- Produtoterceiro
- Terceirovendedor

O script para criação das tabelas pode ser acessado em _database/ecommerce.sql_
O relacionamento entre essas tabelas foi estabelecido através de restrições de chaves estrangeiras, que pode ser visualizada em _docs/schema_diagram.png_.

### 2.1. Dados do projeto
Os dados utilizados neste projeto são __fictícios__ e foram criados __exclusivamente para fins educacionais e de demonstração de consultas SQL__.<br>
A geração dos dados foi realizada de forma assistida, com foco em:
- respeitar todas as constraints definidas no schema (PK, FK, ENUM, CHECK);
- garantir consistência relacional entre as tabelas;
- permitir análises de negócio.

## 3. Análises
As queries construídas buscaram responder alguns questionamentos de negócio elaborados com base nos dados ficticios inputados no database. O arquivo pode ser encontrado em _queries/ecommerce_analysis.sql_

## 4. Limitações e correções futuras

### 4.1. Reinicialização de identificadores (IDs)

Durante a fase de população do banco de dados, foi necessário reinicializar os valores de IDs gerados automaticamente.

Em alguns momentos, dados foram inseridos manualmente com valores explícitos de ID em tabelas que são referenciadas por foreign keys. Como a sequência interna do PostgreSQL não é atualizada automaticamente nesses casos, ocorreram conflitos e quebras na inserção de registros relacionados.

Para resolver esse cenário em um **contexto hipotético de estudo e ambiente de desenvolvimento**, foi utilizado o comando:

`TRUNCATE ... RESTART IDENTITY`

Em um **ambiente de produção**, esse tipo de ajuste deveria ser conduzido de outra forma, priorizando soluções automatizadas e seguras, como o controle explícito das sequências ou estratégias que evitem a necessidade de reinicialização dos identificadores.


## 5. Tecnologias
- PostgreSQL
- DBeaver (para geração do diagrama visual de relacionamentos)
