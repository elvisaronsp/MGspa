-- delete from tbljobs where payload ilike '%EstoqueCalculaEstatisticas%';
-- delete from tbljobs where queue ilike '%parado_cm%';

delete from tbljobs where tbljobs.id not in (select min(id) from tbljobs dup group by dup.payload);
delete from tbljobsspa where tbljobsspa.id not in (select min(id) from tbljobsspa dup group by dup.payload);
select 'lara', queue, count(*) from tbljobs group by queue union all
select 'spa', queue, count(*) from tbljobsspa group by queue order by queue

/*

ALTER SEQUENCE tbljobs_id_seq RESTART;
ALTER SEQUENCE tbljobsspa_id_seq RESTART;

select * from tbljobsspa --where payload ilike '%codnotafiscal%codnotafiscal%'

delete from tbljobsspa where payload like '%NFeAutorizadaMail%'
update tbljobs set queue = 'parado_cm' where queue = 'urgent'


select * from tbljobs where payload ilike '%967979%'

-- apaga jobs duplicadas

delete from tbljobs where id = 1184761

update tbljobs set queue = 'parado_cm' where payload ilike '%EstoqueCalculaCustoMedio%' and queue != 'parado_cm'
delete from tbljobs where queue = 'parado_cm'

select * from tbljobs limit 500

{"job":"Illuminate\\Queue\\CallQueuedHandler@call","data":{"command":"O:36:\"MGLara\\Jobs\\EstoqueCalculaCustoMedio\":5:{s:16:\"\u0000*\u0000codestoquemes\";i:;s:8:\"\u0000*\u0000ciclo\";i:0;s:5:\"queue\";s:6:\"urgent\";s:5:\"delay\";N;s:6:\"\u0000* (...)
{"job":"Illuminate\\Queue\\CallQueuedHandler@call","data":{"command":"O:36:\"MGLara\\Jobs\\EstoqueCalculaCustoMedio\":5:{s:16:\"\u0000*\u0000codestoquemes\";i:;s:8:\"\u0000*\u0000ciclo\";i:0;s:5:\"queue\";s:6:\"urgent\";s:5:\"delay\";N;s:6:\"\u0000* (...)
{"job":"Illuminate\\Queue\\CallQueuedHandler@call","data":{"command":"O:36:\"MGLara\\Jobs\\EstoqueCalculaCustoMedio\":5:{s:16:\"\u0000*\u0000codestoquemes\";i:;s:8:\"\u0000*\u0000ciclo\";i:0;s:5:\"queue\";s:6:\"urgent\";s:5:\"delay\";N;s:6:\"\u0000* (...)
{"job":"Illuminate\\Queue\\CallQueuedHandler@call","data":{"command":"O:36:\"MGLara\\Jobs\\EstoqueCalculaCustoMedio\":5:{s:16:\"\u0000*\u0000codestoquemes\";i:;s:8:\"\u0000*\u0000ciclo\";i:0;s:5:\"queue\";s:6:\"urgent\";s:5:\"delay\";N;s:6:\"\u0000* (...)


update tbljobs set queue = 'low' where queue = 'medium' and payload ilike '%EstoqueGeraMovimentoNotaFiscal%'

update tbljobs set queue = 'low' where queue = 'parado_cm_2'

select * from tbljobs where queue = 'high' limit 100 

select * from tbljobs 

delete from tbljobs where id = 15486067

update tbljobs set queue = 'parado_cm' where payload ilike '%EstoqueCalculaCustoMedio%'

update tbljobs set queue = 'parado_nfpb' where payload ilike '%EstoqueGeraMovimentoNotaFiscalProdutoBarra%'

update tbljobs set queue = 'parado_nf' where payload ilike '%EstoqueGeraMovimentoNotaFiscal%'

update tbljobs set queue = 'parado_n' where payload ilike '%EstoqueGeraMovimentoNegocio%'

update tbljobs set queue = 'parado_npb' where payload ilike '%EstoqueGeraMovimentoNegocioProdutoBarra%'

update tbljobs set queue = 'low' where tbljobs.id in (select j2.id from tbljobs j2 where j2.queue = 'parado_cm' order by j2.payload limit 100)

select queue, count(*) from tbljobs group by queue order by queue

delete from tbljobs where id in (
931394
,931360
,931414
)

'high';39
'medium';1538
'urgent_custo_medio_fiscal';113630

select * from tbljobs where queue in ('high', 'medium')


delete from tbljobs where id in (
14166272
,14166276
,14166277
,14166269
)
*/

