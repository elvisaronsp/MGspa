﻿select * from tblportador

insert into tblchequerepasse (codportador, data, observacoes, criacao, codusuariocriacao)
values (210, '2017-07-21', null, '2017-07-21 11:41', 1)

select * from tblchequerepasse order by codchequerepasse desc 

insert into tblchequerepassecheque (codcheque, codchequerepasse, criacao, codusuariocriacao)
select codcheque, 2070, '2017-07-21 11:41', 1
from tblcheque where cmc7 in (
'<00182333<0188500615>788000118781:',
'<13623042<0180000315>600002337731:',
'<00142708<0188508435>323010608489:',
'<10408540<0189000425>000300018892:'
)

update tblcheque set indstatus = 2 where indstatus = 1 and codcheque in (select crc.codcheque from tblchequerepassecheque crc where codchequerepasse = 2070)

select crc.codchequerepasse, sum(c.valor), count(crc.codchequerepassecheque)
from tblchequerepassecheque crc
inner join tblcheque c on (c.codcheque = crc.codcheque)
where crc.codchequerepasse >= 1900
group by crc.codchequerepasse
order by 1 desc

update tblchequerepasse set data = '2017-07-21', criacao = '2017-07-21 11:41' where codchequerepasse = 2054
update tblchequerepassecheque set criacao = '2017-07-21 11:41' where codchequerepasse = 2054

select * from tblchequerepassecheque where codchequerepasse = 2057

delete from tblchequerepassecheque where codchequerepassecheque between 15837 and 15847

update tblchequerepassecheque set codchequerepasse = 2049 where codchequerepassecheque = 15793
delete from tblchequerepassecheque where codchequerepassecheque in (15693, 15692)
