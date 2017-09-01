﻿-- alter table tblmarca add controlada boolean not null default false

-- update tblmarca set controlada = true where marca ilike 'mielle'
-- PARA SEPARAR DO DEPOSITO PRAS LOJAS

select 
	-- m.marca, 
	p.codproduto, 
	-- p.produto, 
	-- pv.variacao, 
	p.produto || coalesce(' | ' || pv.variacao, ''),
	um.sigla,
	-- p.preco,
	--coalesce(pv.referencia, p.referencia), 
	(
		select pb.barras || coalesce(' ' || pe_um.sigla || ' C/' || cast(pe.quantidade as bigint), '')
		from tblprodutobarra pb
		left join tblprodutoembalagem pe on (pe.codprodutoembalagem = pb.codprodutoembalagem)
		left join tblunidademedida pe_um on (pe_um.codunidademedida = pe.codunidademedida)
		where pb.codprodutovariacao = pv.codprodutovariacao
		order by pe.quantidade nulls first, pb.barras
		limit 1
	),
	-- elpv_deposito.corredor, 
	-- elpv_deposito.prateleira, 
	-- elpv_deposito.coluna, 
	-- elpv_deposito.bloco,
    cast(es.saldoquantidade as bigint) as loja,
	elpv.estoqueminimo as min, 
	elpv.estoquemaximo as max, 
	cast(es_deposito.saldoquantidade as bigint) as deposito,
	cast(elpv.estoquemaximo - (case when es.saldoquantidade < 0 then 0 else es.saldoquantidade end) as bigint) as separar
from tblestoquelocalprodutovariacao elpv
left join tblestoquesaldo es on (es.codestoquelocalprodutovariacao = elpv.codestoquelocalprodutovariacao and es.fiscal = false)
inner join tblprodutovariacao pv on (pv.codprodutovariacao = elpv.codprodutovariacao)
inner join tblproduto p on (p.codproduto = pv.codproduto)
inner join tblmarca m on (m.codmarca = coalesce(pv.codmarca, p.codmarca))
inner join tblestoquelocalprodutovariacao elpv_deposito on (elpv_deposito.codestoquelocal = 101001 and elpv_deposito.codprodutovariacao = elpv.codprodutovariacao)
inner join tblestoquesaldo es_deposito on (es_deposito.codestoquelocalprodutovariacao = elpv_deposito.codestoquelocalprodutovariacao and es_deposito.fiscal = false)
inner join tblunidademedida um on (um.codunidademedida = p.codunidademedida)
where elpv.codestoquelocal = 102001
--and m.marca not ilike 'delta'
and m.controlada = true
and coalesce(es.saldoquantidade, 0) <= coalesce(elpv.estoqueminimo, 0)
and es_deposito.saldoquantidade > 0
--and es.saldoquantidade is null
order by m.marca, p.produto, pv.variacao


-- PARA COMPRAR
/*
select 
    * 
    , case when (x.repor > 0) then ceil(x.repor::float / x.lote::float) * x.lote else 0 end as comprar
from 
(
    select 
        --m.marca,
        p.codproduto,
        --p.produto,
        --pv.variacao,
        p.produto || coalesce(' | ' || pv.variacao, '') as produto,
        coalesce(pv.referencia, p.referencia) as referencia,
        --p.preco,
        pv.custoultimacompra as custo,
        pv.dataultimacompra as data,
        cast(sld.saldoquantidade as bigint) as sld,
        sld.vendadiaquantidadeprevisao as vda_dia,
        cast(case when sld.vendadiaquantidadeprevisao != 0 then sld.saldoquantidade / sld.vendadiaquantidadeprevisao else null end as bigint) as dias,
        sld.estoqueminimo as min,
        sld.estoquemaximo as max,
        coalesce((select min(pe.quantidade) from tblprodutoembalagem pe where pe.codproduto = pv.codproduto)::int, 1) as lote,
        cast(sld.estoquemaximo - case when sld.saldoquantidade > 0 then sld.saldoquantidade else 0 end as bigint) as repor
    from tblproduto p
    inner join tblprodutovariacao pv on (pv.codproduto = p.codproduto)
    inner join tblmarca m on (m.codmarca = coalesce(pv.codmarca, p.codmarca))
    inner join (
        select 
            elpv.codprodutovariacao
            , sum(elpv.estoqueminimo) as estoqueminimo
            , sum(elpv.estoquemaximo) as estoquemaximo
            , sum(es.saldoquantidade) as saldoquantidade
            , sum(es.saldovalor) as saldovalor
            , sum(case when el.deposito then 0 else elpv.vendadiaquantidadeprevisao end) as vendadiaquantidadeprevisao
        from tblestoquelocalprodutovariacao elpv
        inner join tblestoquelocal el on (el.codestoquelocal = elpv.codestoquelocal)
        left join tblestoquesaldo es on (es.codestoquelocalprodutovariacao = elpv.codestoquelocalprodutovariacao and es.fiscal = false)
        where el.inativo is null
        group by elpv.codprodutovariacao
        --limit 50
        ) sld on (sld.codprodutovariacao = pv.codprodutovariacao)
    where m.controlada = true
    and coalesce(sld.saldoquantidade, 0) < sld.estoqueminimo
    --and coalesce(sld.saldoquantidade, 0) < sld.estoquemaximo
    --and m.marca ilike '%ACRIMET%'
    --and pv.codprodutovariacao = 15218
    and p.inativo is null
    order by m.marca, p.produto, pv.variacao
) x
--where x.dias < 60
*/

--update tblestoquelocal set inativo = '2016-12-31' where codestoquelocal in (201001, 301001)

-- PARA RECOLHER PRO DEPOSITO
/*
select 
    iq.*
    , iq.loja - iq.deixar as recolher
from (
    select 
        -- m.marca, 
        p.codproduto, 
        -- p.produto, 
        -- pv.variacao, 
        p.produto || coalesce(' | ' || pv.variacao, ''),
        um.sigla as um,
        --p.preco,
        --coalesce(pv.referencia, p.referencia), 
        (
            select pb.barras || coalesce(' ' || pe_um.sigla || ' C/' || cast(pe.quantidade as bigint), '')
            from tblprodutobarra pb
            left join tblprodutoembalagem pe on (pe.codprodutoembalagem = pb.codprodutoembalagem)
            left join tblunidademedida pe_um on (pe_um.codunidademedida = pe.codunidademedida)
            where pb.codprodutovariacao = pv.codprodutovariacao
            order by pe.quantidade nulls first, pb.barras
            limit 1
        ) as barras,
        -- elpv_deposito.corredor, 
        -- elpv_deposito.prateleira, 
        -- elpv_deposito.coluna, 
        -- elpv_deposito.bloco,
        cast(es_deposito.saldoquantidade as bigint) as deposito,
        --elpv_deposito.estoqueminimo as min, 
        --elpv_deposito.estoquemaximo as max, 
        cast(es.saldoquantidade as bigint) as loja, 
        case when elpv.vendadiaquantidadeprevisao > 0 then cast(es.saldoquantidade / elpv.vendadiaquantidadeprevisao as bigint) else null end as dias, 
        elpv.estoqueminimo as min, 
        elpv.estoquemaximo as max, 
        --elpv.vendadiaquantidadeprevisao,
        case when cast(coalesce(elpv.vendadiaquantidadeprevisao, 0) * 90 as bigint) < 2 then 2 else cast(elpv.vendadiaquantidadeprevisao * 90 as bigint) end as deixar
    from tblestoquelocalprodutovariacao elpv
    inner join tblestoquesaldo es on (es.codestoquelocalprodutovariacao = elpv.codestoquelocalprodutovariacao and es.fiscal = false)
    inner join tblprodutovariacao pv on (pv.codprodutovariacao = elpv.codprodutovariacao)
    inner join tblproduto p on (p.codproduto = pv.codproduto)
    inner join tblmarca m on (m.codmarca = coalesce(pv.codmarca, p.codmarca))
    inner join tblestoquelocalprodutovariacao elpv_deposito on (elpv_deposito.codestoquelocal = 101001 and elpv_deposito.codprodutovariacao = elpv.codprodutovariacao)
    inner join tblestoquesaldo es_deposito on (es_deposito.codestoquelocalprodutovariacao = elpv_deposito.codestoquelocalprodutovariacao and es_deposito.fiscal = false)
    inner join tblunidademedida um on (um.codunidademedida = p.codunidademedida)
    where elpv.codestoquelocal = 102001
    and m.controlada = true
    and m.marca not ilike 'pilot'
    --and (es.saldoquantidade - (coalesce(elpv.vendadiaquantidadeprevisao, 0) * 90) > 1)
    and coalesce(es_deposito.saldoquantidade, 0) <= coalesce(elpv_deposito.estoqueminimo, 0)
    --and es_deposito.saldoquantidade > 0
    order by m.marca, p.produto, pv.variacao
    ) iq 
where iq.deixar < iq.loja
*/

/*
-- Transferir de uma loja para outra
select 
    iq.codproduto,
    iq.produto,
    iq.um,
    iq.barras,
    iq.origem,
    --iq.origem_90dd,
    iq.destino,
    --iq.destino_90dd,
    case when (iq.origem - iq.origem_90dd) < (iq.destino_90dd - iq.destino) then (iq.origem - iq.origem_90dd) else (iq.destino_90dd - iq.destino) end  as transferir
from (
    select 
        -- m.marca, 
        p.codproduto, 
        -- p.produto, 
        -- pv.variacao, 
        p.produto || coalesce(' | ' || pv.variacao, '') as produto,
        um.sigla as um,
        --p.preco,
        --coalesce(pv.referencia, p.referencia), 
        (
            select pb.barras || coalesce(' ' || pe_um.sigla || ' C/' || cast(pe.quantidade as bigint), '')
            from tblprodutobarra pb
            left join tblprodutoembalagem pe on (pe.codprodutoembalagem = pb.codprodutoembalagem)
            left join tblunidademedida pe_um on (pe_um.codunidademedida = pe.codunidademedida)
            where pb.codprodutovariacao = pv.codprodutovariacao
            order by pe.quantidade nulls first, pb.barras
            limit 1
        ) as barras,
        -- elpv_destino.corredor, 
        -- elpv_destino.prateleira, 
        -- elpv_destino.coluna, 
        -- elpv_destino.bloco,

        cast(coalesce(es_destino.saldoquantidade, 0) as bigint) as destino,
        --case when elpv_destino.vendadiaquantidadeprevisao > 0 then cast(es_destino.saldoquantidade / elpv_destino.vendadiaquantidadeprevisao as bigint) else null end as destino_dias, 
        --elpv_destino.estoqueminimo as destino_min, 
        --elpv_destino.estoquemaximo as destino_max, 
        case when cast(coalesce(elpv_destino.vendadiaquantidadeprevisao, 0) * 90 as bigint) < 2 then 2 else cast(coalesce(elpv_destino.vendadiaquantidadeprevisao, 0) * 90 as bigint) end as destino_90dd,

        cast(coalesce(es.saldoquantidade, 0) as bigint) as origem, 
        --case when elpv.vendadiaquantidadeprevisao > 0 then cast(es.saldoquantidade / elpv.vendadiaquantidadeprevisao as bigint) else null end as origem_dias, 
        --elpv.estoqueminimo as origem_min, 
        --elpv.estoquemaximo as origem_max, 
        --elpv.vendadiaquantidadeprevisao,
        case when cast(coalesce(elpv.vendadiaquantidadeprevisao, 0) * 90 as bigint) < 2 then 2 else cast(coalesce(elpv.vendadiaquantidadeprevisao, 0) * 90 as bigint) end as origem_90dd
        
    from tblestoquelocalprodutovariacao elpv
    inner join tblestoquesaldo es on (es.codestoquelocalprodutovariacao = elpv.codestoquelocalprodutovariacao and es.fiscal = false)
    inner join tblprodutovariacao pv on (pv.codprodutovariacao = elpv.codprodutovariacao)
    inner join tblproduto p on (p.codproduto = pv.codproduto)
    inner join tblmarca m on (m.codmarca = coalesce(pv.codmarca, p.codmarca))
    -- DESTINO
    inner join tblestoquelocalprodutovariacao elpv_destino on (elpv_destino.codestoquelocal = 102001 and elpv_destino.codprodutovariacao = elpv.codprodutovariacao)
    inner join tblestoquesaldo es_destino on (es_destino.codestoquelocalprodutovariacao = elpv_destino.codestoquelocalprodutovariacao and es_destino.fiscal = false)
    inner join tblunidademedida um on (um.codunidademedida = p.codunidademedida)
    -- ORIGEM
    where elpv.codestoquelocal = 103001 
    and m.controlada = true
    and m.marca not ilike 'pilot'
    --and (es.saldoquantidade - (coalesce(elpv.vendadiaquantidadeprevisao, 0) * 90) > 1)
    and coalesce(es_destino.saldoquantidade, 0) <= coalesce(elpv_destino.estoqueminimo, 0)
    --and es_destino.saldoquantidade > 0
    order by m.marca, p.produto, pv.variacao
) iq
where iq.origem > iq.origem_90dd
*/