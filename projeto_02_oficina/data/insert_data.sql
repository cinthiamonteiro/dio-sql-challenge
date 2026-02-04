-- Inserção dos dados

insert into Cliente (Pnome, UltimoNome, Telefone, CPF, DatadeNascimento) values
('Ana', 'Silva', '11980010001', '12345678901', '1988-04-12'),
('Bruno', 'Souza', '11980010002', '12345678902', '1992-07-23'),
('Carla', 'Pereira', '11980010003', '12345678903', '1985-01-30'),
('Daniel', 'Oliveira', '11980010004', '12345678904', '1979-11-15'),
('Eduarda', 'Lima', '11980010005', '12345678905', '1998-06-05'),
('Felipe', 'Costa', '11980010006', '12345678906', '1990-09-18');

insert into Carro (Modelo, Marca, Ano, Cor) values
('Civic', 'Honda', 2018, 'Prata'),
('Corolla', 'Toyota', 2020, 'Branco'),
('Gol', 'VW', 2015, 'Preto'),
('Onix', 'Chevrolet', 2022, 'Vermelho'),
('HB20', 'Hyundai', 2019, 'Azul'),
('Fiesta', 'Ford', 2014, 'Cinza');

insert into Peca (Nome, QtdEstoque) values
('Filtro de óleo', 20),
('Pastilha de freio', 15),
('Correia dentada', 5),
('Velas de ignição', 30),
('Amortecedor', 8);

insert into Servico (Nome, Preco, PecaNecessaria, idPeca) values
('Troca de óleo', 120.00, true, 1),
('Troca de pastilha', 350.00, true, 2),
('Revisão completa', 600.00, false, null),
('Troca correia', 480.00, true, 3),
('Alinhamento', 90.00, false, null),
('Troca amortecedor', 900.00, true, 5);

insert into ClienteCarro (idCliente, idCarro) values
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(4, 5),
(5, 6),
(6, 3);

insert into ServicosPrestados (idServico, idCliente, DataServico) values
(1, 1, '2024-01-10'),
(3, 1, '2024-03-15'),
(2, 2, '2024-02-05'),
(5, 2, '2024-04-18'),
(4, 3, '2024-01-22'),
(1, 4, '2024-02-12'),
(6, 4, '2024-05-01'),
(3, 5, '2024-03-08'),
(2, 6, '2024-04-10'),
(1, 6, '2024-06-02');