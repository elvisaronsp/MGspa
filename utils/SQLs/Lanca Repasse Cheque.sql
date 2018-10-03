﻿select * from tblportador order by codportador

insert into tblchequerepasse (codportador, data, observacoes, criacao, codusuariocriacao)
values (210, '2018-10-01', null, '2018-10-01 11:41', 1)

select * from tblchequerepasse order by codchequerepasse desc 

insert into tblchequerepassecheque (codcheque, codchequerepasse, criacao, codusuariocriacao)
select codcheque, 2259, '2018-10-01 10:00', 1
from tblcheque where cmc7 in (
'<00111801<0188500305>746006710100:',
'<00142702<0188510295>394002694506:',
'<00111803<0188500125>783007216381:',
'<75644250<0181167635>200000898346:',
'<74871176<0180753025>900000588277:'
)

update tblcheque set indstatus = 2 where indstatus = 1 and codcheque in (select crc.codcheque from tblchequerepassecheque crc)

select crc.codchequerepasse, sum(c.valor), count(crc.codchequerepassecheque)
from tblchequerepassecheque crc
inner join tblcheque c on (c.codcheque = crc.codcheque)
where crc.codchequerepasse >= 1900
group by crc.codchequerepasse
order by 1 desc

--update tblcheque set valor = 172.32 where cmc7 = '<34113644<0480001325>711720814794:'

--update tblchequerepasse set data = '2018-07-06', criacao = '2018-07-06 11:41' where codchequerepasse = 2187
--update tblchequerepassecheque set criacao = '2018-07-06 11:41' where codchequerepasse = 2187

--select * from tblchequerepassecheque where codchequerepasse = 2086

--delete from tblchequerepassecheque where codchequerepassecheque between 15837 and 15847

/*
delete from tblchequerepassecheque  where codcheque in (
	select codcheque
	from tblcheque where cmc7 in (
	'<74808129<0180011725>200008905614:'
	)
)

update tblchequerepassecheque set codchequerepasse = 2187 where codchequerepassecheque in (16531
,16530
,16529
,16528
,16527
,16526
,16525
,16524
,16523
,16522
,16521
,16520
,16519
,16518
)
delete from tblchequerepassecheque where codchequerepassecheque in (15693, 15692)

*/
/*
-- INSERE CHEQUE COMO DEVOLVIDO
insert into tblchequedevolucao (codchequerepassecheque, codchequemotivodevolucao, data, observacoes, criacao, alteracao, codusuariocriacao, codusuarioalteracao)
select crc.codchequerepassecheque, cmd.codchequemotivodevolucao, '2017-08-15', 'Repassado para cobranca', '2017-08-31', '2017-08-31', 1, 1
from tblchequerepassecheque crc
inner join tblcheque c on (c.codcheque = crc.codcheque)
inner join tblchequemotivodevolucao cmd on (cmd.numero = 12)
where c.cmc7 = '<34182182<0480001185>801421544691:'

-- MARCA INDSTATUS - EM COBRANCA
update tblcheque set indstatus = 4 where indstatus = 2 and codcheque in (select codcheque from tblcheque where cmc7 = '<34182182<0480001185>801421544691:')


select * from tblchequedevolucao order by codchequedevolucao desc

update tblchequedevolucao set data = '2018-08-30', criacao = date_trunc('second', now()), alteracao = date_trunc('second', now())where codchequedevolucao = 312

*/

select * 
from tblcheque c
inner join tblchequerepassecheque crc  on (crc.codcheque = c.codcheque)
where crc.codchequerepasse = 2186


select cr.*
from tblchequerepassecheque crc
inner join tblchequerepasse cr on (cr.codchequerepasse = crc.codchequerepasse)
where crc.codcheque = 8836


update tblchequerepassecheque set codchequerepasse = 2155
where codcheque in(select codcheque from tblcheque where cmc7 in (
'<03341685<0180000205>219130149255:',
'<74880161<0180001075>200000901660:',
'<00138632<0188509225>674000570023:'
))
