﻿/*
--select * from tblestoquelocalprodutovariacaovenda limit 5

--delete from tblestoquelocalprodutovariacaovenda  where codestoquelocalprodutovariacao = 239241
--select * from tblestoquelocalprodutovariacaovenda  where codestoquelocalprodutovariacao = 239241


-- Limpa dados ignorados
update tblestoquelocalprodutovariacaovenda
set ignorar = false
where ignorar = true


-- Ignora de um ano pra tras
update tblestoquelocalprodutovariacaovenda
set ignorar = true
where ignorar = false 
and mes < '2016-09-01'


-- Considera de um ano pra frente
update tblestoquelocalprodutovariacaovenda
set ignorar = false
where ignorar = true
and mes >= '2016-09-01'


-- Ignora Mes com menos Movimentacao
-- Rodar Duas Vezes
update tblestoquelocalprodutovariacaovenda
set ignorar = true
where codestoquelocalprodutovariacaovenda in (
	select 
		(
			select v2.codestoquelocalprodutovariacaovenda 
			from tblestoquelocalprodutovariacaovenda v2
			where v2.codestoquelocalprodutovariacao = v.codestoquelocalprodutovariacao
			and v2.ignorar = false
			order by quantidade asc
			limit 1
		) 
	from tblestoquelocalprodutovariacaovenda v
	where v.ignorar = false
	group by v.codestoquelocalprodutovariacao
	having count(v.codestoquelocalprodutovariacaovenda) > 4
)


-- Ignora Janeiro
update tblestoquelocalprodutovariacaovenda
set ignorar = true
where ignorar = false
and mes = '2017-01-01'
and codestoquelocalprodutovariacao in (
	select 
		v.codestoquelocalprodutovariacao
	from tblestoquelocalprodutovariacaovenda v
	where v.ignorar = false
	group by v.codestoquelocalprodutovariacao
	having count(v.codestoquelocalprodutovariacaovenda) > 4
)


-- Ignora Fevereiro
update tblestoquelocalprodutovariacaovenda
set ignorar = true
where ignorar = false
and mes = '2017-02-01'
and codestoquelocalprodutovariacao in (
	select 
		v.codestoquelocalprodutovariacao
	from tblestoquelocalprodutovariacaovenda v
	where v.ignorar = false
	group by v.codestoquelocalprodutovariacao
	having count(v.codestoquelocalprodutovariacaovenda) > 4
)


-- cria tabela temporaria com numero de dias dos meses
drop table if exists tmpdiasmes

create temporary table tmpdiasmes as 
select distinct mes, cast(null as smallint) as dias
from tblestoquelocalprodutovariacaovenda

create index idx_tmpdiasmes_mes on tmpdiasmes (mes)

update tmpdiasmes
set dias = DATE_PART('days', DATE_TRUNC('month', mes) + '1 MONTH'::INTERVAL - '1 DAY'::INTERVAL)
where mes != '2017-08-01'

update tmpdiasmes 
set dias = DATE_PART('days', now())
where mes = '2017-08-01'


-- atualiza quantidade vendida por dia 
update tblestoquelocalprodutovariacaovenda
set vendadiaquantidade = quantidade / dias
from tmpdiasmes
where tblestoquelocalprodutovariacaovenda.mes = tmpdiasmes.mes


-- Soma vendas do local para a variacao
update tblestoquelocalprodutovariacao
set vendadiaquantidadeprevisao = iq.vendadiaquantidadeprevisao,
	vendaultimocalculo = iq.vendaultimocalculo,
	vendabimestrequantidade = iq.vendabimestrequantidade,
	vendabimestrevalor = iq.vendabimestrevalor,
	vendasemestrequantidade = iq.vendasemestrequantidade,
	vendasemestrevalor = iq.vendasemestrevalor,
	vendaanoquantidade = iq.vendaanoquantidade,
	vendaanovalor = iq.vendaanovalor
from (
	select 
		v.codestoquelocalprodutovariacao,
		avg(case when not v.ignorar then vendadiaquantidade else null end) as vendadiaquantidadeprevisao,
		min(alteracao) as vendaultimocalculo,
		sum(v.quantidade) as vendaanoquantidade,
		sum(v.valor) as vendaanovalor,
		sum(case when v.mes >= '2017-03-01' then v.quantidade else null end) as vendasemestrequantidade,
		sum(case when v.mes >= '2017-03-01' then v.valor else null end) as vendasemestrevalor,
		sum(case when v.mes >= '2017-07-01' then v.quantidade else null end) as vendabimestrequantidade,
		sum(case when v.mes >= '2017-07-01' then v.valor else null end) as vendabimestrevalor
	from tblestoquelocalprodutovariacaovenda v 
	where v.mes >= '2016-09-01'
	group by v.codestoquelocalprodutovariacao
	) iq
where tblestoquelocalprodutovariacao.codestoquelocalprodutovariacao = iq.codestoquelocalprodutovariacao


-- Limpa locais sem vendas no periodo
update tblestoquelocalprodutovariacao
set vendadiaquantidadeprevisao = null,
	vendaultimocalculo = '2017-08-25',
	vendabimestrequantidade = null,
	vendabimestrevalor = null,
	vendasemestrequantidade = null,
	vendasemestrevalor = null,
	vendaanoquantidade = null,
	vendaanovalor = null
where vendaultimocalculo < '2017-08-25'

-- Calcula Estoque Minimo e Estoque Maximo Filiais
update tblestoquelocalprodutovariacao
set estoqueminimo = coalesce(tblestoquelocalprodutovariacao.vendadiaquantidadeprevisao, 0) * m.estoqueminimodias
, estoquemaximo = coalesce(tblestoquelocalprodutovariacao.vendadiaquantidadeprevisao, 0) * m.estoquemaximodias
from tblestoquelocal el, tblprodutovariacao pv
inner join tblproduto p on (p.codproduto = pv.codproduto)
inner join tblmarca m on (m.codmarca = p.codmarca)
where tblestoquelocalprodutovariacao.codestoquelocal = el.codestoquelocal
and el.deposito = false
and tblestoquelocalprodutovariacao.codprodutovariacao = pv.codprodutovariacao

-- Calcula Estoque Minimo e Maximo Deposito
update tblestoquelocalprodutovariacao
set estoqueminimo = iq.vendadiaquantidadeprevisao * m.estoqueminimodias
, estoquemaximo = iq.vendadiaquantidadeprevisao * m.estoquemaximodias
from (
		select 
			codprodutovariacao,
			sum(vendadiaquantidadeprevisao) as vendadiaquantidadeprevisao
		from tblestoquelocalprodutovariacao elpv
		inner join tblestoquelocal el on (el.codestoquelocal = elpv.codestoquelocal)
		where el.deposito = false
		group by codprodutovariacao
	) iq,
	tblestoquelocal el,	
	tblprodutovariacao pv,
	tblproduto p,
	tblmarca m
where tblestoquelocalprodutovariacao.codprodutovariacao = iq.codprodutovariacao
and tblestoquelocalprodutovariacao.codestoquelocal = el.codestoquelocal
and el.deposito = true
and tblestoquelocalprodutovariacao.codprodutovariacao = pv.codprodutovariacao
and pv.codproduto = p.codproduto
and p.codmarca = m.codmarca

-- Coloca minimo como 1 quando for 0
update tblestoquelocalprodutovariacao
set estoqueminimo = 1
from tblestoquelocal el, tblprodutovariacao pv, tblproduto p
where coalesce(tblestoquelocalprodutovariacao.estoqueminimo, 0) <= 0
and tblestoquelocalprodutovariacao.codestoquelocal = el.codestoquelocal
and el.inativo is null
and tblestoquelocalprodutovariacao.codprodutovariacao = pv.codprodutovariacao
and pv.codproduto = p.codproduto
and p.inativo is null


-- Adiciona +1 no maximo quando for igual ou inferior ao minimo
update tblestoquelocalprodutovariacao
set estoquemaximo = tblestoquelocalprodutovariacao.estoqueminimo + 1
from tblestoquelocal el, tblprodutovariacao pv, tblproduto p
where coalesce(tblestoquelocalprodutovariacao.estoquemaximo, 0) <= coalesce(tblestoquelocalprodutovariacao.estoqueminimo, 0)
and tblestoquelocalprodutovariacao.codestoquelocal = el.codestoquelocal
and el.inativo is null
and tblestoquelocalprodutovariacao.codprodutovariacao = pv.codprodutovariacao
and pv.codproduto = p.codproduto
and p.inativo is null

*/



/*

select * from tmpdiasmes order by mes

select 
	v.codestoquelocalprodutovariacao, count(*)
from tblestoquelocalprodutovariacaovenda v
where v.ignorar = false
group by v.codestoquelocalprodutovariacao
having count(v.codestoquelocalprodutovariacaovenda) > 4


select 
	* 
from tblestoquelocalprodutovariacaovenda v 
where codestoquelocalprodutovariacao = 3924
and ignorar = false
order by mes desc


select * 
from tblestoquelocalprodutovariacao 
where codprodutovariacao = 4239


select * 
from tblprodutovariacao
where codprodutovariacao = 4239
*/