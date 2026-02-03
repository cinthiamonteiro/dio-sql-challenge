-- Inserção dos dados de clientes
insert into Cliente (Pnome, InicNomedoMeio, UltimoNome, CPF, Endereco, DatadeNascimento, Tipo) values
('Ana','M','Silva','12345678901','Rua A, 10','1990-05-10','PF'),
('Bruno',null,'Costa','12345678902','Rua B, 20','1985-02-15','PF'),
('Carla','R','Souza','12345678903','Av Central, 50','1992-08-21','PF'),
('Daniel',null,'Lima','12345678904','Rua C, 15','1980-11-30','PF'),
('EmpresaX',null,'LTDA','12345678905','Av Industrial, 200','2005-01-01','PJ'),
('Fernanda','A','Ribeiro','12345678906','Rua D, 40','1995-07-12','PF'),
('Gustavo',null,'Alves','12345678907','Rua E, 90','1988-09-03','PF'),
('Helena','S','Matos','12345678908','Rua F, 12','1993-04-18','PF'),
('Inova',null,'Tech','12345678909','Av Tech, 100','2010-06-01','PJ'),
('João','P','Oliveira','12345678910','Rua G, 33','1987-12-09','PF');

-- Inserção dos dados de produtos
insert into Produto (Nome, Categoria, Preco) values
('Notebook','Eletronicos',3500.00),
('Mouse','Eletronicos',80.00),
('Teclado','Eletronicos',150.00),
('Monitor','Eletronicos',1200.00),
('Cadeira','Moveis',900.00),
('Mesa','Moveis',700.00),
('Headset','Eletronicos',300.00),
('Webcam','Eletronicos',250.00);

-- Inserção de dados de fornecedores
insert into Fornecedor (RazaoSocial, CNPJ) values
('Fornecedor Alpha','11111111111111'),
('Fornecedor Beta','22222222222222'),
('Fornecedor Gamma','33333333333333');

-- Inserção dos dados de vendedores terceiros
insert into TerceiroVendedor (RazaoSocial, CNPJ) values
('Marketplace One','44444444444444'),
('Marketplace Two','55555555555555');

-- Inserção dos dados de estoque
insert into Estoque (Localizacao) values
('Centro Distribuicao SP'),
('Centro Distribuicao RJ');

-- Inserção dos dados na relação produtos x vendedores
insert into ProdutoFornecedor values
(1,1),(1,2),(1,3),
(2,4),(2,5),
(3,6),(3,7),(3,8);

insert into ProdutoTerceiro values
(1,1),(1,4),
(2,6),(2,8);

-- Inserção dos dados de pedidos
insert into Pedido (StatusPedido, Descricao, Cliente_idCliente, Frete) values
('processado','Pedido online',1,50.00),
('processado','Pedido online',2,40.00),
('pendente','Aguardando pagamento',3,30.00),
('cancelado','Pagamento recusado',4,20.00),
('processado','Compra PJ',5,80.00),
('processado','Pedido online',6,35.00),
('pendente','Pedido online',7,45.00),
('processado','Pedido online',8,50.00),
('processado','Compra corporativa',9,90.00),
('pendente','Pedido online',10,25.00),
('processado','Pedido online',1,55.00),
('processado','Pedido online',2,60.00),
('processado','Pedido online',3,30.00),
('cancelado','Pedido cancelado',6,20.00),
('processado','Pedido online',7,40.00);

-- Inserção de dados da relação pedidos x produtos
insert into PedidoProduto values
(1,1,1),(2,1,2),
(3,2,1),
(4,3,2),(2,3,1),
(5,5,4),
(6,6,1),(7,6,2),
(8,7,1),
(1,8,1),(3,8,1),
(4,9,3),
(2,10,2),
(5,11,1),(6,11,1),
(7,12,2),
(8,13,1),
(1,14,1),
(2,15,2),(3,15,1);

-- Inserção dos dados da relação estoque x produto
insert into ProdutoEstoque values
(1,1,10),(2,1,50),(3,1,30),(4,1,20),(5,1,15),
(6,2,25),(7,2,40),(8,2,35),(1,2,5),(2,2,10);

-- Inserção de dados de pagamento
insert into Pagamento values
(1,'credito','pago'),
(2,'pix','pago'),
(3,'boleto','pendente'),
(4,'credito','pendente'),
(5,'credito','pago'),
(6,'debito','pago'),
(7,'pix','pendente'),
(8,'credito','pago'),
(9,'boleto','pago'),
(10,'pix','pendente'),
(11,'credito','pago'),
(12,'debito','pago'),
(13,'pix','pago'),
(14,'credito','pendente'),
(15,'pix','pago');

-- Inserção de dados de entrega
insert into Entrega (Pedido_idPedido, StatusEntrega) values
(1,'enviado'),
(2,'entregue'),
(3,'pendente'),
(4,'pendente'),
(5,'entregue'),
(6,'enviado'),
(7,'pendente'),
(8,'entregue'),
(9,'enviado'),
(10,'pendente'),
(11,'entregue'),
(12,'entregue'),
(13,'enviado'),
(14,'pendente'),
(15,'entregue');

