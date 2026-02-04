# dio-sql-challenge
Projeto desenvolvido como parte de um desafio de bootcamp, com foco em análise de dados utilizando SQL.

## 1. Estrutura do Projeto
Este projeto segue a seguinte estrutura:

**dio-sql-challenge/** <br>
├── README.md <br>
├── projeto_01_ecommerce/ <br>
│   ├── README.md <br>
│   ├── database/ <br>
│   │   └── ecommerce.sql <br>
│   ├── data/ <br>
│   │   └── insert_data.sql <br>
│   ├── queries/ <br>
│   │   └── ecommerce_analysis.sql <br>
│   └── docs/ <br>
│       └── schema_diagram.png <br>
└── projeto_02_oficina/ <br>

- Na subpasta `database` está disponibilizado o schema criado com banco de dados e tabelas;
- Na subpasta `data` está disponibilizado o arquivo _.sql_ utilizado para input dos dados no banco;
- Na subpasta `queries` está disponibilizado o arquivo _.sql_ utilizado para realização de consultas no banco;
- Na subpasta `docs`, estão disponibilizados arquivos auxiliares para documentação desse desafio.

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

O script para criação das tabelas pode ser acessado em _projeto_01_ecommerce/database/ecommerce.sql_
O relacionamento entre essas tabelas foi estabelecido por meio de restrições de chaves estrangeiras, que podem ser visualizadas em _projeto_01_ecommerce/docs/schema_diagram.png_.

### 2.1. Dados do projeto
Os dados utilizados neste projeto são __fictícios__ e foram criados __exclusivamente para fins educacionais e de demonstração de consultas SQL__.<br>
A geração dos dados foi realizada de forma assistida, com foco em:
- respeitar todas as constraints definidas no schema (PK, FK, ENUM, CHECK);
- garantir consistência relacional entre as tabelas;
- permitir análises de negócio.

## 3. Análises
As queries construídas buscaram responder a questionamentos de negócio elaborados com base nos dados fictícios inseridos no banco de dados.
O arquivo com as consultas pode ser encontrado em _projeto_01_ecommerce/queries/ecommerce_analysis.sql_.
Nesta seção são apresentadas as dimensões analisadas, as perguntas que motivaram a elaboração das consultas e os principais resultados observados.

### 3.1. Dimensões de análise

**Cliente**

- Quais clientes realizam mais pedidos? E quais tipos de cliente se destacam?
- Qual o faturamento gerado por cliente? Quais contribuem mais para o negócio?

**Produto**

- Como é o desempenho das categorias de produtos com base na quantidade vendida? Quais possuem maior giro?
- Quais categorias geram mais faturamento?
- Quais produtos apresentam menor volume de vendas?
- Quais produtos estão sem estoque? Há possibilidade de ruptura?
- Quais produtos não possuem vendedor associado? Quais não possuem fornecedor? Há necessidade de contratação de terceiros ou de novos contratos de fornecimento?

**Pedidos**

- Há brechas no processamento de pedidos (por exemplo, pedidos entregues com pagamento pendente)?
- Quanto foi efetivamente recebido? Qual o caixa da empresa?

### 3.2. Resultados encontrados

**Cliente**

Com base nas consultas realizadas, foi possível identificar que o total de pedidos realizados por clientes do tipo Pessoa Física foi superior ao número de pedidos de clientes do tipo Pessoa Jurídica. No entanto, observa-se que os clientes do tipo Pessoa Jurídica apresentaram valores médios de compra mais elevados, indicando uma oportunidade de maior faturamento associada à atração desse perfil.

|idcliente|tipo|totalgasto|
|---|---|---|
|1|PF|5470.00|
|6|PF|4890.00|
|8|PF|3750.00|
|9|PJ|3690.00|
|5|PJ|3680.00|
|3|PF|2820.00|
|2|PF|850.00|
|7|PF|685.00|
|10|PF|185.00|

**Produto**
Ao analisar a dimensão Produto, observa-se que a categoria Eletrônicos se destaca tanto no volume de itens vendidos quanto na receita gerada. Considerando o portfólio disponibilizado pelo e-commerce, esse resultado deve ser analisado com cautela, uma vez que o número de produtos ofertados na categoria Eletrônicos é superior ao da categoria Móveis. Dessa forma, a diferença de faturamento pode estar relacionada à limitação do portfólio e não necessariamente à categoria em si.

|categoria|valortotalvendido|
|---|---|
|Moveis|5900.00|
|Eletronicos|19210.00|

Também foi analisada a relação entre os produtos e a disponibilidade em estoque, constatando-se que não há ruptura no momento analisado. No entanto, há produtos sem fornecedores associados, o que pode indicar um risco de ruptura futura. Observa-se ainda que alguns produtos não são comercializados por vendedores terceiros, mesmo apresentando saída, levantando questionamentos sobre a real necessidade dessa despesa.

**Pedido**
Por fim, ao analisar a dimensão Pedido, observa-se que os status de pagamento, quando avaliados em conjunto com os status de entrega, não apresentam casos da inconsistência analisada (pedido entregue ou enviado com pagamento pendente). Ainda assim, o volume de pagamentos pendentes pode justificar análises futuras sobre possíveis cancelamentos por parte dos clientes.

|statuspagamento|statusentrega|numeropedidos|
|---|---|---|
|pendente|pendente|5|
|pago|entregue|6|
|pago|enviado|4|


## 4. Limitações e correções futuras

### 4.1. Amostragem
Como mencionado previamente, a amostra de dados utilizada neste desafio é fictícia e de tamanho reduzido, considerando seu propósito demonstrativo voltado à sintaxe e à lógica SQL. Apesar de cumprir esse objetivo, a amostragem limita análises mais aprofundadas e discussões mais ricas sobre os resultados obtidos.

### 4.2. Modelo
O modelo construído busca simular o funcionamento de um banco de dados de e-commerce, gerenciando informações relacionadas aos principais processos desse tipo de negócio. No entanto, diversos campos que seriam necessários ou agregariam valor às análises foram desconsiderados, tais como:

- Data e hora do pedido e da entrega, possibilitando análises logísticas;
- Custo do produto, permitindo análises de rentabilidade;
- Tabela de avaliação dos pedidos, possibilitando a mensuração da satisfação do cliente.

### 4.3. Reinicialização de identificadores (IDs)

Durante a fase de população do banco de dados, foi necessário reinicializar os valores de IDs gerados automaticamente.

Em alguns momentos, dados foram inseridos manualmente com valores explícitos de ID em tabelas que são referenciadas por foreign keys. Como a sequência interna do PostgreSQL não é atualizada automaticamente nesses casos, ocorreram conflitos e quebras na inserção de registros relacionados.

Para resolver esse cenário em um **contexto hipotético de estudo e ambiente de desenvolvimento**, foi utilizado o comando:

`TRUNCATE ... RESTART IDENTITY`

Em um **ambiente de produção**, esse tipo de ajuste deveria ser conduzido de outra forma, priorizando soluções automatizadas e seguras, como o controle explícito das sequências ou estratégias que evitem a necessidade de reinicialização dos identificadores.


## 5. Tecnologias
- PostgreSQL: desenvolvimento dos arquivos _.sql_;
- DBeaver: geração do diagrama visual de relacionamentos;
- Git e GitHub: versionameto e disponibilização de arquivos.
