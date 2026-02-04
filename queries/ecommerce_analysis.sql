-- Queries

-- Perspectiva: cliente
-- Analise do numero de pedidos por clientes
select c.idCliente, c.PNome, c.UltimoNome, count(p.idPedido) as TotalPedidos
from Cliente c 
inner join Pedido p on c.idCliente = p.Cliente_idCliente
group by c.idCliente
order by TotalPedidos desc;

-- Analise de pedidos por tipo de cliente PJ/PF
select c.Tipo, count(p.idPedido) as TotalPedidos
from Cliente c 
inner join Pedido p on c.idCliente = p.Cliente_idCliente
group by c.Tipo;

-- Analise de faturamento por cliente.

select c.idCliente, c.Tipo, sum(pp.Quantidade * pr.Preco + p.frete) as TotalGasto
from Cliente c
inner join Pedido p on c.idCliente = p.Cliente_idCliente
inner join PedidoProduto pp on p.idPedido = pp.Pedido_idPedido
inner join Produto pr on pp.Produto_idProduto = pr.idProduto
group by c.idCliente
order by TotalGasto desc;

-- Perspectiva: produto

-- Analise top categorias (quantidade vendida)
select pr.Categoria, sum(pp.Quantidade) as ProdutosVendidos
from Produto pr 
inner join PedidoProduto pp on pr.idProduto = pp.Produto_idProduto
group by pr.Categoria;

-- Analise top categorias (valor vendido)
select pr.Categoria, sum(pp.Quantidade * pr.Preco) as ValorTotalVendido
from Produto pr 
inner join PedidoProduto pp on pr.idProduto = pp.Produto_idProduto
group by pr.Categoria;

-- Analise produtos menos vendidos
select pr.idProduto, pr.Nome, sum(pp.Quantidade) as QuantidadeVendida
from Produto pr 
inner join PedidoProduto pp on pr.idProduto = pp.Produto_idProduto
group by pr.idProduto, pr.Nome
order by QuantidadeVendida;

-- Analise de produtos sem estoque
select pr.idProduto, pr.Nome, coalesce(sum(pe.quantidade),0) as QuantidadeEstoque
from Produto pr
left join ProdutoEstoque pe on pr.idProduto = pe.Produto_idProduto
group by pr.idProduto, pr.Nome
having coalesce(sum(pe.quantidade),0) = 0;

-- Analise de produtos sem vendedor terceiro
select pr.idProduto, pr.Nome, count(t.idTerceiro) as NumeroVendedores
from Produto pr
left join ProdutoTerceiro pt on pr.idProduto = pt.Produto_idProduto
left join TerceiroVendedor t on pt.Terceiro_idTerceiro = t.idTerceiro
group by pr.idProduto
having count(t.idTerceiro) = 0;

-- Analise de produtos sem fornecedor
select pr.idProduto, pr.Nome, count(f.idFornecedor) as NumeroFornecedores
from Produto pr
left join ProdutoFornecedor pf on pr.idProduto = pf.Produto_idProduto
left join Fornecedor f on pf.Produto_idProduto = f.idFornecedor
group by pr.idProduto
having count(f.idFornecedor) = 0;

-- Perspectiva: pedido

-- Analise por status de entrega e de pagamento
select pa.StatusPagamento, e.StatusEntrega, count(pe.idPedido) as NumeroPedidos
from Pedido pe
left join Pagamento pa on pe.idPedido = pa.Pedido_idPedido
left join Entrega e on pa.Pedido_idPedido = e.Pedido_idPedido
group by pa.StatusPagamento, e.StatusEntrega;

-- Analise de valor recebido
select sum(pp.Quantidade * pr.Preco + p.frete) as ValorRecebido
from Pedido p
inner join Pagamento pa on p.idPedido = pa.Pedido_idPedido
inner join PedidoProduto pp on pa.Pedido_idPedido = pp.Pedido_idPedido
inner join Produto pr on pp.Produto_idProduto = pr.idProduto
where pa.StatusPagamento ='pago';