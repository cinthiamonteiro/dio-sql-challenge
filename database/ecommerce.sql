-- Criação  tabela de clientes
create type tipo_cliente as enum ('PJ','PF');

create table Cliente(
	idCliente int generated always as identity primary key,
	Pnome varchar(10) not null,
	InicNomedoMeio varchar(1),
	UltimoNome varchar(20) not null,
	CPF varchar(11),
	Endereco varchar(45),
	DatadeNascimento date,
	Tipo tipo_cliente,
	constraint cpf_unico unique (CPF),
	constraint cpf_tamanho check (length(CPF) = 11)
);

-- Criação tabela de produtos
create table Produto(
	idProduto int generated always as identity primary key,
	Nome varchar(20) not null,
	Categoria varchar(20) not null,
	Preco numeric(10,2) not null
);

-- Criação tabela de pedidos
create type status as enum ('pendente','processado','cancelado');


create table Pedido(
	idPedido int generated always as identity primary key,
	StatusPedido status default 'pendente', 
	Descricao varchar(45),
	Cliente_idCliente int not null,
	Frete numeric(10,2),
	constraint fk_cliente
	foreign key (Cliente_idCliente)
	references Cliente (idCliente)
);

-- Criação tabela com relação pedido x produto

create table PedidoProduto(
	Produto_idProduto int,
	Pedido_idPedido int,
	Quantidade int not null,
	primary key (Produto_idProduto,Pedido_idPedido),
	constraint fk_produto
	foreign key (Produto_idProduto)
	references Produto (idProduto),
	constraint fk_pedido
	foreign key (Pedido_idPedido)
	references Pedido (idPedido)
);

-- Criação da tabela estoque
create table Estoque (
	idEstoque int generated always as identity primary key,
	Localizacao varchar(45)
);

-- Criação da tabela de fornecedores
create table Fornecedor (
	idFornecedor int generated always as identity primary key,
	RazaoSocial varchar(30),
	CNPJ varchar(14),
	constraint cnpj_tamanho check (length(CNPJ) = 14)
);

-- Criação da tabela de vendedores terceiros
create table TerceiroVendedor (
	idTerceiro int generated always as identity primary key,
	RazaoSocial varchar(30),
	CNPJ varchar(14)
);

-- Criação da tabela dos produtos disponibilizados por fornecedores
create table ProdutoFornecedor (
	Fornecedor_idFornecedor int,
	Produto_idProduto int,
	primary key (Fornecedor_idFornecedor,Produto_idProduto),
	constraint fk_fornecedor
	foreign key (Fornecedor_idFornecedor)
	references Fornecedor (idFornecedor),
	constraint fk_produto
	foreign key (Produto_idProduto)
	references Produto (idProduto)
);

-- Criação da tabela de produtos disponibilizados por terceiros
create table ProdutoTerceiro (
	Terceiro_idTerceiro int,
	Produto_idProduto int,
	primary key (Terceiro_idTerceiro, Produto_idProduto),
	constraint fk_terceiro
	foreign key (Terceiro_idTerceiro)
	references TerceiroVendedor (idTerceiro),
	constraint fk_produto
	foreign key (Produto_idProduto)
	references Produto (idProduto)
);

-- Criação da tabela para verificação do estoque de produtos
create table ProdutoEstoque (
	Produto_idProduto int,
	Estoque_idEstoque int,
	Quantidade int,
	primary key (Produto_idProduto,Estoque_idEstoque),
	constraint fk_estoque
	foreign key (Estoque_idEstoque)
	references Estoque (idEstoque),
	constraint fk_produto
	foreign key (Produto_idProduto)
	references Produto (idProduto)
);

-- Tabelas adicionais
-- Criação da tabela de pagamento
create type tipo_pagamento as enum ('credito','debito','pix','boleto');

create type status_pagamento as enum ('pendente','pago');

create table Pagamento (
	Pedido_idPedido int,
	TipoPagamento tipo_pagamento,
	StatusPagamento status_pagamento default 'pendente',
	primary key (Pedido_idPedido,TipoPagamento),
	constraint fk_idPedido
	foreign key (Pedido_idPedido)
	references Pedido (idPedido)
);

-- Criação da tabela entrega
create type status_entrega as enum ('pendente','enviado','entregue');

create table Entrega (
	CodEntrega int generated always as identity primary key,
	Pedido_idPedido int not null,
	StatusEntrega status_entrega,
	constraint fk_pedido
	foreign key (Pedido_idPedido)
	references Pedido (idPedido)
);