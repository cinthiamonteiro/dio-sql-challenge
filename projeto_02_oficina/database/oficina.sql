-- criação  tabela de clientes
create table Cliente(
	idCliente int generated always as identity primary key,
	Pnome varchar(10),
	UltimoNome varchar(20),
	Telefone varchar(11),
	CPF varchar(11),
	DatadeNascimento date,
	constraint cpf_unico unique (CPF),
	constraint tel_unico unique (Telefone)
);

-- criação tabela de carros
create table Carro(
	idCarro int generated always as identity primary key,
	Modelo varchar(20),
	Marca varchar(10),
	Ano int,
	Cor varchar(10)
);

-- criação tabela de peças
create table Peca(
	idPeca int generated always as identity primary key,
	Nome varchar(20),
	QtdEstoque int
);

-- criação tabela de serviços
create table Servico(
	idServico int generated always as identity primary key,
	Nome varchar(20),
	Preco numeric(10,2),
	PecaNecessaria bool,
	idPeca int,
	constraint fk_peca
	foreign key (idPeca)
	references Peca(idPeca)
);

-- criação tabela de relação clientes x carros

create table ClienteCarro(
	idCliente int,
	idCarro int,
	primary key (idCliente, idCarro),
	constraint fk_cliente
	foreign key (idCliente)
	references Cliente(idCliente),
	constraint fk_carro
	foreign key (idCarro)
	references Carro(idCarro)
);

-- criação tabela dos serviços prestados
create table ServicosPrestados(
	idProtocolo int generated always as identity primary key,
	idServico int,
	idCliente int,
	DataServico date,
	constraint fk_cliente
	foreign key (idCliente)
	references Cliente(idCliente),
	constraint fk_servico
	foreign key (idServico)
	references Servico(idServico)
);



