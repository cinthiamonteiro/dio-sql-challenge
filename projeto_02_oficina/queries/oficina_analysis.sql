-- Queries

-- Quais os serviços mais frequentes?
select s.idServico, s.Nome, count(sp.idProtocolo) as VezesPrestadas
from Servico s
left join ServicosPrestados sp on s.idServico = sp.idServico
group by s.idServico, s.Nome
order by VezesPrestadas desc;

-- Quais os clientes mais frequentes?
select c.idCliente, c.Pnome, count (sp.idProtocolo) as NumeroAtendimentos
from Cliente c
left join ServicosPrestados sp on c.idCliente = sp.idCliente
group by c.idCliente, c.Pnome
order by NumeroAtendimentos desc;

-- Há algum insight a partir do perfil de cada cliente?
select sub.idCliente, sub.Pnome, sub.Modelo, sub.Ano, count (sp.idProtocolo) as NumeroAtendimentos
from 
	(select c.idCliente, c.Pnome, ca.Modelo, ca.Ano
	from Cliente c
	left join ClienteCarro cc on c.idCliente = cc.idCliente
	left join Carro ca on cc.idCarro = ca.idCarro) sub
left join ServicosPrestados sp on sub.idCliente = sp.idCliente
group by sub.idCliente, sub.Pnome, sub.Modelo, sub.Ano
order by NumeroAtendimentos desc;

-- Qual o último serviço prestado a cada um? E quando foi?
select distinct on (c.idCliente)
	c.idCliente,c.Pnome, s.Nome, sp.DataServico
from Cliente c
left join ServicosPrestados sp on c.idCliente = sp.idCliente
left join Servico s on sp.idServico = s.idServico
order by c.idCliente, sp.DataServico desc;

-- Quais as peças mais requisitadas?
select p.idPeca, p.Nome, s.Nome, coalesce(count(sp.idServico),0) as NumPecas
from Peca p
left join Servico s on p.idPeca = s.idPeca
left join ServicosPrestados sp on s.idServico = sp.idServico
group by p.idPeca, p.Nome, s.Nome
having coalesce(count(sp.idServico),0) > 0
order by NumPecas desc;

-- Quanto foi faturado até o momento?

with FaturamentoServico as (
	select s.idServico, coalesce(count(sp.idProtocolo),0) as TotalPrestado
	from Servico s
	left join ServicosPrestados sp on s.idServico = sp.idServico
	group by s.idServico
)

select sum(ValorFaturado) as TotalFaturado
from (
	select s.idServico, fat.TotalPrestado * s.Preco as ValorFaturado
	from Servico s
	left join FaturamentoServico fat on s.idServico = fat.idServico
);
