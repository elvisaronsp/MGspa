﻿--altera senha para "baseteste"
--update tblusuario set senha = '$1$k8wt4L/C$/xxhrvZ2z4DroCR6dUszJ/';

--altera caminho monitor ACBR
update tblfilial 
set acbrnfemonitorcaminho = 'C:\ACBrNFeMonitor'
, acbrnfemonitorcaminhorede = 'http://10.0.1.198:8080/'
, acbrnfemonitorip = '10.0.1.198'
, acbrnfemonitorporta = '9999'
, nfeambiente = 1
;

--altera email clientes para envio xml
--update tblpessoa set emailnfe = 'nfe@mgpapelaria.com.br', email = null, emailcobranca = null;

ALTER SEQUENCE tblauditoria_codauditoria_seq MAXVALUE 89999999;
ALTER SEQUENCE tblauditoriaexcecao_codauditoriaexcecao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblbanco_codbanco_seq MAXVALUE 89999999;
ALTER SEQUENCE tblbaseremota_codbaseremota_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletomotivoocorrencia_codboletomotivoocorrencia_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletoretorno_codboletoretorno_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletotipoocorrencia_codboletotipoocorrencia_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcfop_codcfop_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcheque_codcheque_seq MAXVALUE 89999999;
ALTER SEQUENCE tblchequeemitente_codchequeemitente_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcidade_codcidade_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobranca_codcobranca_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobrancahistorico_codcobrancahistorico_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobrancahistoricotitulo_codcobrancahistoricotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcontacontabil_codcontacontabil_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcupomfiscal_codcupomfiscal_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcupomfiscalprodutobarra_codcupomfiscalprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblecf_codecf_seq MAXVALUE 89999999;
ALTER SEQUENCE tblecfreducaoz_codecfreducaoz_seq MAXVALUE 89999999;
ALTER SEQUENCE tblempresa_codempresa_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestado_codestado_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestadocivil_codestadocivil_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquemovimento_codestoquemovimento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquemovimentotipo_codestoquemovimentotipo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquesaldo_codestoquesaldo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblfilial_codfilial_seq MAXVALUE 89999999;
ALTER SEQUENCE tblformapagamento_codformapagamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblgrupocliente_codgrupocliente_seq MAXVALUE 89999999;
ALTER SEQUENCE tblgrupoproduto_codgrupoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tblibptax_codibptax_seq MAXVALUE 89999999;
ALTER SEQUENCE tblliquidacaotitulo_codliquidacaotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmarca_codmarca_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmenu_codmenu_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmovimentotitulo_codmovimentotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnaturezaoperacao_codnaturezaoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblncm_codncm_seq MAXVALUE 89999999;
ALTER SEQUENCE tblncmtributacao_codncmtributacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocio_codnegocio_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocioformapagamento_codnegocioformapagamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocioprodutobarra_codnegocioprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegociostatus_codnegociostatus_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiro_codnfeterceiro_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiroduplicata_codnfeterceiroduplicata_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiroitem_codnfeterceiroitem_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_codnotafiscal_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_101_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_101_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_201_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_201_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_202_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_202_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_301_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_301_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalcartacorrecao_codnotafiscalcartacorrecao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalduplicatas_codnotafiscalduplicatas_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalprodutobarra_codnotafiscalprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tbloperacao_codoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblpais_codpais_seq MAXVALUE 89999999;
ALTER SEQUENCE tblparametrosgerais_codparametrosgerais_seq MAXVALUE 89999999;
ALTER SEQUENCE tblpessoa_codpessoa_seq MAXVALUE 89999999;
ALTER SEQUENCE tblportador_codportador_seq MAXVALUE 89999999;
ALTER SEQUENCE tblproduto_codproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutobarra_codprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutoembalagem_codprodutoembalagem_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutohistoricopreco_codprodutohistoricopreco_seq MAXVALUE 89999999;
ALTER SEQUENCE tblregistrospc_codregistrospc_seq MAXVALUE 89999999;
ALTER SEQUENCE tblsexo_codsexo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblsubgrupoproduto_codsubgrupoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipomovimentotitulo_codtipomovimentotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipoproduto_codtipoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipotitulo_codtipotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_codtitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_105_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_210_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_2222_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_559_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltituloagrupamento_codtituloagrupamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltributacao_codtributacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltributacaonaturezaoperacao_codtributacaonaturezaoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblunidademedida_codunidademedida_seq MAXVALUE 89999999;
ALTER SEQUENCE tblusuario_codusuario_seq MAXVALUE 89999999;

ALTER SEQUENCE tbltitulo_nossonumero_105_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_210_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_2222_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_559_seq MAXVALUE 89999999;


select setval('tblauditoria_codauditoria_seq', coalesce(max(codauditoria), 80000001)) from tblauditoria where codauditoria between 80000000 and 89999999;
select setval('tblauditoriaexcecao_codauditoriaexcecao_seq', coalesce(max(codauditoriaexcecao), 80000001)) from tblauditoriaexcecao where codauditoriaexcecao between 80000000 and 89999999;
select setval('tblbanco_codbanco_seq', coalesce(max(codbanco), 80000001)) from tblbanco where codbanco between 80000000 and 89999999;
select setval('tblbaseremota_codbaseremota_seq', coalesce(max(codbaseremota), 80000001)) from tblbaseremota where codbaseremota between 80000000 and 89999999;
select setval('tblboletomotivoocorrencia_codboletomotivoocorrencia_seq', coalesce(max(codboletomotivoocorrencia), 80000001)) from tblboletomotivoocorrencia where codboletomotivoocorrencia between 80000000 and 89999999;
select setval('tblboletoretorno_codboletoretorno_seq', coalesce(max(codboletoretorno), 80000001)) from tblboletoretorno where codboletoretorno between 80000000 and 89999999;
select setval('tblboletotipoocorrencia_codboletotipoocorrencia_seq', coalesce(max(codboletotipoocorrencia), 80000001)) from tblboletotipoocorrencia where codboletotipoocorrencia between 80000000 and 89999999;
select setval('tblcfop_codcfop_seq', coalesce(max(codcfop), 80000001)) from tblcfop where codcfop between 80000000 and 89999999;
select setval('tblcheque_codcheque_seq', coalesce(max(codcheque), 80000001)) from tblcheque where codcheque between 80000000 and 89999999;
select setval('tblchequeemitente_codchequeemitente_seq', coalesce(max(codchequeemitente), 80000001)) from tblchequeemitente where codchequeemitente between 80000000 and 89999999;
select setval('tblcidade_codcidade_seq', coalesce(max(codcidade), 80000001)) from tblcidade where codcidade between 80000000 and 89999999;
select setval('tblcobranca_codcobranca_seq', coalesce(max(codcobranca), 80000001)) from tblcobranca where codcobranca between 80000000 and 89999999;
select setval('tblcobrancahistorico_codcobrancahistorico_seq', coalesce(max(codcobrancahistorico), 80000001)) from tblcobrancahistorico where codcobrancahistorico between 80000000 and 89999999;
select setval('tblcobrancahistoricotitulo_codcobrancahistoricotitulo_seq', coalesce(max(codcobrancahistoricotitulo), 80000001)) from tblcobrancahistoricotitulo where codcobrancahistoricotitulo between 80000000 and 89999999;
select setval('tblcontacontabil_codcontacontabil_seq', coalesce(max(codcontacontabil), 80000001)) from tblcontacontabil where codcontacontabil between 80000000 and 89999999;
select setval('tblcupomfiscal_codcupomfiscal_seq', coalesce(max(codcupomfiscal), 80000001)) from tblcupomfiscal where codcupomfiscal between 80000000 and 89999999;
select setval('tblcupomfiscalprodutobarra_codcupomfiscalprodutobarra_seq', coalesce(max(codcupomfiscalprodutobarra), 80000001)) from tblcupomfiscalprodutobarra where codcupomfiscalprodutobarra between 80000000 and 89999999;
select setval('tblecf_codecf_seq', coalesce(max(codecf), 80000001)) from tblecf where codecf between 80000000 and 89999999;
select setval('tblecfreducaoz_codecfreducaoz_seq', coalesce(max(codecfreducaoz), 80000001)) from tblecfreducaoz where codecfreducaoz between 80000000 and 89999999;
select setval('tblempresa_codempresa_seq', coalesce(max(codempresa), 80000001)) from tblempresa where codempresa between 80000000 and 89999999;
select setval('tblestado_codestado_seq', coalesce(max(codestado), 80000001)) from tblestado where codestado between 80000000 and 89999999;
select setval('tblestadocivil_codestadocivil_seq', coalesce(max(codestadocivil), 80000001)) from tblestadocivil where codestadocivil between 80000000 and 89999999;
select setval('tblestoquemovimento_codestoquemovimento_seq', coalesce(max(codestoquemovimento), 80000001)) from tblestoquemovimento where codestoquemovimento between 80000000 and 89999999;
select setval('tblestoquemovimentotipo_codestoquemovimentotipo_seq', coalesce(max(codestoquemovimentotipo), 80000001)) from tblestoquemovimentotipo where codestoquemovimentotipo between 80000000 and 89999999;
select setval('tblestoquesaldo_codestoquesaldo_seq', coalesce(max(codestoquesaldo), 80000001)) from tblestoquesaldo where codestoquesaldo between 80000000 and 89999999;
select setval('tblfilial_codfilial_seq', coalesce(max(codfilial), 80000001)) from tblfilial where codfilial between 80000000 and 89999999;
select setval('tblformapagamento_codformapagamento_seq', coalesce(max(codformapagamento), 80000001)) from tblformapagamento where codformapagamento between 80000000 and 89999999;
select setval('tblgrupocliente_codgrupocliente_seq', coalesce(max(codgrupocliente), 80000001)) from tblgrupocliente where codgrupocliente between 80000000 and 89999999;
select setval('tblgrupoproduto_codgrupoproduto_seq', coalesce(max(codgrupoproduto), 80000001)) from tblgrupoproduto where codgrupoproduto between 80000000 and 89999999;
select setval('tblibptax_codibptax_seq', coalesce(max(codibptax), 80000001)) from tblibptax where codibptax between 80000000 and 89999999;
select setval('tblliquidacaotitulo_codliquidacaotitulo_seq', coalesce(max(codliquidacaotitulo), 80000001)) from tblliquidacaotitulo where codliquidacaotitulo between 80000000 and 89999999;
select setval('tblmarca_codmarca_seq', coalesce(max(codmarca), 80000001)) from tblmarca where codmarca between 80000000 and 89999999;
select setval('tblmenu_codmenu_seq', coalesce(max(codmenu), 80000001)) from tblmenu where codmenu between 80000000 and 89999999;
select setval('tblmovimentotitulo_codmovimentotitulo_seq', coalesce(max(codmovimentotitulo), 80000001)) from tblmovimentotitulo where codmovimentotitulo between 80000000 and 89999999;
select setval('tblnaturezaoperacao_codnaturezaoperacao_seq', coalesce(max(codnaturezaoperacao), 80000001)) from tblnaturezaoperacao where codnaturezaoperacao between 80000000 and 89999999;
select setval('tblncm_codncm_seq', coalesce(max(codncm), 80000001)) from tblncm where codncm between 80000000 and 89999999;
select setval('tblncmtributacao_codncmtributacao_seq', coalesce(max(codncmtributacao), 80000001)) from tblncmtributacao where codncmtributacao between 80000000 and 89999999;
select setval('tblnegocio_codnegocio_seq', coalesce(max(codnegocio), 80000001)) from tblnegocio where codnegocio between 80000000 and 89999999;
select setval('tblnegocioformapagamento_codnegocioformapagamento_seq', coalesce(max(codnegocioformapagamento), 80000001)) from tblnegocioformapagamento where codnegocioformapagamento between 80000000 and 89999999;
select setval('tblnegocioprodutobarra_codnegocioprodutobarra_seq', coalesce(max(codnegocioprodutobarra), 80000001)) from tblnegocioprodutobarra where codnegocioprodutobarra between 80000000 and 89999999;
select setval('tblnegociostatus_codnegociostatus_seq', coalesce(max(codnegociostatus), 80000001)) from tblnegociostatus where codnegociostatus between 80000000 and 89999999;
select setval('tblnfeterceiro_codnfeterceiro_seq', coalesce(max(codnfeterceiro), 80000001)) from tblnfeterceiro where codnfeterceiro between 80000000 and 89999999;
select setval('tblnfeterceiroduplicata_codnfeterceiroduplicata_seq', coalesce(max(codnfeterceiroduplicata), 80000001)) from tblnfeterceiroduplicata where codnfeterceiroduplicata between 80000000 and 89999999;
select setval('tblnfeterceiroitem_codnfeterceiroitem_seq', coalesce(max(codnfeterceiroitem), 80000001)) from tblnfeterceiroitem where codnfeterceiroitem between 80000000 and 89999999;
select setval('tblnotafiscal_codnotafiscal_seq', coalesce(max(codnotafiscal), 80000001)) from tblnotafiscal where codnotafiscal between 80000000 and 89999999;
select setval('tblnotafiscalcartacorrecao_codnotafiscalcartacorrecao_seq', coalesce(max(codnotafiscalcartacorrecao), 80000001)) from tblnotafiscalcartacorrecao where codnotafiscalcartacorrecao between 80000000 and 89999999;
select setval('tblnotafiscalduplicatas_codnotafiscalduplicatas_seq', coalesce(max(codnotafiscalduplicatas), 80000001)) from tblnotafiscalduplicatas where codnotafiscalduplicatas between 80000000 and 89999999;
select setval('tblnotafiscalprodutobarra_codnotafiscalprodutobarra_seq', coalesce(max(codnotafiscalprodutobarra), 80000001)) from tblnotafiscalprodutobarra where codnotafiscalprodutobarra between 80000000 and 89999999;
select setval('tbloperacao_codoperacao_seq', coalesce(max(codoperacao), 80000001)) from tbloperacao where codoperacao between 80000000 and 89999999;
select setval('tblpais_codpais_seq', coalesce(max(codpais), 80000001)) from tblpais where codpais between 80000000 and 89999999;
select setval('tblparametrosgerais_codparametrosgerais_seq', coalesce(max(codparametrosgerais), 80000001)) from tblparametrosgerais where codparametrosgerais between 80000000 and 89999999;
select setval('tblpessoa_codpessoa_seq', coalesce(max(codpessoa), 80000001)) from tblpessoa where codpessoa between 80000000 and 89999999;
select setval('tblportador_codportador_seq', coalesce(max(codportador), 80000001)) from tblportador where codportador between 80000000 and 89999999;
select setval('tblproduto_codproduto_seq', coalesce(max(codproduto), 80000001)) from tblproduto where codproduto between 80000000 and 89999999;
select setval('tblprodutobarra_codprodutobarra_seq', coalesce(max(codprodutobarra), 80000001)) from tblprodutobarra where codprodutobarra between 80000000 and 89999999;
select setval('tblprodutoembalagem_codprodutoembalagem_seq', coalesce(max(codprodutoembalagem), 80000001)) from tblprodutoembalagem where codprodutoembalagem between 80000000 and 89999999;
select setval('tblprodutohistoricopreco_codprodutohistoricopreco_seq', coalesce(max(codprodutohistoricopreco), 80000001)) from tblprodutohistoricopreco where codprodutohistoricopreco between 80000000 and 89999999;
select setval('tblregistrospc_codregistrospc_seq', coalesce(max(codregistrospc), 80000001)) from tblregistrospc where codregistrospc between 80000000 and 89999999;
select setval('tblsexo_codsexo_seq', coalesce(max(codsexo), 80000001)) from tblsexo where codsexo between 80000000 and 89999999;
select setval('tblsubgrupoproduto_codsubgrupoproduto_seq', coalesce(max(codsubgrupoproduto), 80000001)) from tblsubgrupoproduto where codsubgrupoproduto between 80000000 and 89999999;
select setval('tbltipomovimentotitulo_codtipomovimentotitulo_seq', coalesce(max(codtipomovimentotitulo), 80000001)) from tbltipomovimentotitulo where codtipomovimentotitulo between 80000000 and 89999999;
select setval('tbltipoproduto_codtipoproduto_seq', coalesce(max(codtipoproduto), 80000001)) from tbltipoproduto where codtipoproduto between 80000000 and 89999999;
select setval('tbltipotitulo_codtipotitulo_seq', coalesce(max(codtipotitulo), 80000001)) from tbltipotitulo where codtipotitulo between 80000000 and 89999999;
select setval('tbltitulo_codtitulo_seq', coalesce(max(codtitulo), 80000001)) from tbltitulo where codtitulo between 80000000 and 89999999;
select setval('tbltituloagrupamento_codtituloagrupamento_seq', coalesce(max(codtituloagrupamento), 80000001)) from tbltituloagrupamento where codtituloagrupamento between 80000000 and 89999999;
select setval('tbltributacao_codtributacao_seq', coalesce(max(codtributacao), 80000001)) from tbltributacao where codtributacao between 80000000 and 89999999;
select setval('tbltributacaonaturezaoperacao_codtributacaonaturezaoperacao_seq', coalesce(max(codtributacaonaturezaoperacao), 80000001)) from tbltributacaonaturezaoperacao where codtributacaonaturezaoperacao between 80000000 and 89999999;
select setval('tblunidademedida_codunidademedida_seq', coalesce(max(codunidademedida), 80000001)) from tblunidademedida where codunidademedida between 80000000 and 89999999;
select setval('tblusuario_codusuario_seq', coalesce(max(codusuario), 80000001)) from tblusuario where codusuario between 80000000 and 89999999;


ALTER SEQUENCE tblauditoria_codauditoria_seq MAXVALUE 89999999;
ALTER SEQUENCE tblauditoriaexcecao_codauditoriaexcecao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblbanco_codbanco_seq MAXVALUE 89999999;
ALTER SEQUENCE tblbaseremota_codbaseremota_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletomotivoocorrencia_codboletomotivoocorrencia_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletoretorno_codboletoretorno_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletotipoocorrencia_codboletotipoocorrencia_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcfop_codcfop_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcheque_codcheque_seq MAXVALUE 89999999;
ALTER SEQUENCE tblchequeemitente_codchequeemitente_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcidade_codcidade_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobranca_codcobranca_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobrancahistorico_codcobrancahistorico_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobrancahistoricotitulo_codcobrancahistoricotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcontacontabil_codcontacontabil_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcupomfiscal_codcupomfiscal_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcupomfiscalprodutobarra_codcupomfiscalprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblecf_codecf_seq MAXVALUE 89999999;
ALTER SEQUENCE tblecfreducaoz_codecfreducaoz_seq MAXVALUE 89999999;
ALTER SEQUENCE tblempresa_codempresa_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestado_codestado_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestadocivil_codestadocivil_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquemovimento_codestoquemovimento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquemovimentotipo_codestoquemovimentotipo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquesaldo_codestoquesaldo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblfilial_codfilial_seq MAXVALUE 89999999;
ALTER SEQUENCE tblformapagamento_codformapagamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblgrupocliente_codgrupocliente_seq MAXVALUE 89999999;
ALTER SEQUENCE tblgrupoproduto_codgrupoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tblibptax_codibptax_seq MAXVALUE 89999999;
ALTER SEQUENCE tblliquidacaotitulo_codliquidacaotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmarca_codmarca_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmenu_codmenu_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmovimentotitulo_codmovimentotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnaturezaoperacao_codnaturezaoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblncm_codncm_seq MAXVALUE 89999999;
ALTER SEQUENCE tblncmtributacao_codncmtributacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocio_codnegocio_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocioformapagamento_codnegocioformapagamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocioprodutobarra_codnegocioprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegociostatus_codnegociostatus_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiro_codnfeterceiro_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiroduplicata_codnfeterceiroduplicata_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiroitem_codnfeterceiroitem_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_codnotafiscal_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_101_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_101_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_201_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_201_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_202_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_202_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_301_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_301_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalcartacorrecao_codnotafiscalcartacorrecao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalduplicatas_codnotafiscalduplicatas_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalprodutobarra_codnotafiscalprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tbloperacao_codoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblpais_codpais_seq MAXVALUE 89999999;
ALTER SEQUENCE tblparametrosgerais_codparametrosgerais_seq MAXVALUE 89999999;
ALTER SEQUENCE tblpessoa_codpessoa_seq MAXVALUE 89999999;
ALTER SEQUENCE tblportador_codportador_seq MAXVALUE 89999999;
ALTER SEQUENCE tblproduto_codproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutobarra_codprodutobarra_seqALTER SEQUENCE tblauditoria_codauditoria_seq MAXVALUE 89999999;
ALTER SEQUENCE tblauditoriaexcecao_codauditoriaexcecao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblbanco_codbanco_seq MAXVALUE 89999999;
ALTER SEQUENCE tblbaseremota_codbaseremota_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletomotivoocorrencia_codboletomotivoocorrencia_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletoretorno_codboletoretorno_seq MAXVALUE 89999999;
ALTER SEQUENCE tblboletotipoocorrencia_codboletotipoocorrencia_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcfop_codcfop_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcheque_codcheque_seq MAXVALUE 89999999;
ALTER SEQUENCE tblchequeemitente_codchequeemitente_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcidade_codcidade_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobranca_codcobranca_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobrancahistorico_codcobrancahistorico_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcobrancahistoricotitulo_codcobrancahistoricotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcontacontabil_codcontacontabil_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcupomfiscal_codcupomfiscal_seq MAXVALUE 89999999;
ALTER SEQUENCE tblcupomfiscalprodutobarra_codcupomfiscalprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblecf_codecf_seq MAXVALUE 89999999;
ALTER SEQUENCE tblecfreducaoz_codecfreducaoz_seq MAXVALUE 89999999;
ALTER SEQUENCE tblempresa_codempresa_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestado_codestado_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestadocivil_codestadocivil_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquemovimento_codestoquemovimento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquemovimentotipo_codestoquemovimentotipo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblestoquesaldo_codestoquesaldo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblfilial_codfilial_seq MAXVALUE 89999999;
ALTER SEQUENCE tblformapagamento_codformapagamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblgrupocliente_codgrupocliente_seq MAXVALUE 89999999;
ALTER SEQUENCE tblgrupoproduto_codgrupoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tblibptax_codibptax_seq MAXVALUE 89999999;
ALTER SEQUENCE tblliquidacaotitulo_codliquidacaotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmarca_codmarca_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmenu_codmenu_seq MAXVALUE 89999999;
ALTER SEQUENCE tblmovimentotitulo_codmovimentotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnaturezaoperacao_codnaturezaoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblncm_codncm_seq MAXVALUE 89999999;
ALTER SEQUENCE tblncmtributacao_codncmtributacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocio_codnegocio_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocioformapagamento_codnegocioformapagamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegocioprodutobarra_codnegocioprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnegociostatus_codnegociostatus_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiro_codnfeterceiro_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiroduplicata_codnfeterceiroduplicata_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnfeterceiroitem_codnfeterceiroitem_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_codnotafiscal_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_101_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_101_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_201_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_201_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_202_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_202_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_301_1_55_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscal_numero_301_1_65_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalcartacorrecao_codnotafiscalcartacorrecao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalduplicatas_codnotafiscalduplicatas_seq MAXVALUE 89999999;
ALTER SEQUENCE tblnotafiscalprodutobarra_codnotafiscalprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tbloperacao_codoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblpais_codpais_seq MAXVALUE 89999999;
ALTER SEQUENCE tblparametrosgerais_codparametrosgerais_seq MAXVALUE 89999999;
ALTER SEQUENCE tblpessoa_codpessoa_seq MAXVALUE 89999999;
ALTER SEQUENCE tblportador_codportador_seq MAXVALUE 89999999;
ALTER SEQUENCE tblproduto_codproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutobarra_codprodutobarra_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutoembalagem_codprodutoembalagem_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutohistoricopreco_codprodutohistoricopreco_seq MAXVALUE 89999999;
ALTER SEQUENCE tblregistrospc_codregistrospc_seq MAXVALUE 89999999;
ALTER SEQUENCE tblsexo_codsexo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblsubgrupoproduto_codsubgrupoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipomovimentotitulo_codtipomovimentotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipoproduto_codtipoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipotitulo_codtipotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_codtitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_105_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_210_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_2222_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_559_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_105_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_210_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_2222_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_559_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltituloagrupamento_codtituloagrupamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltributacao_codtributacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltributacaonaturezaoperacao_codtributacaonaturezaoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblunidademedida_codunidademedida_seq MAXVALUE 89999999;
ALTER SEQUENCE tblusuario_codusuario_seq MAXVALUE 89999999;
 MAXVALUE 89999999;
ALTER SEQUENCE tblprodutoembalagem_codprodutoembalagem_seq MAXVALUE 89999999;
ALTER SEQUENCE tblprodutohistoricopreco_codprodutohistoricopreco_seq MAXVALUE 89999999;
ALTER SEQUENCE tblregistrospc_codregistrospc_seq MAXVALUE 89999999;
ALTER SEQUENCE tblsexo_codsexo_seq MAXVALUE 89999999;
ALTER SEQUENCE tblsubgrupoproduto_codsubgrupoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipomovimentotitulo_codtipomovimentotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipoproduto_codtipoproduto_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltipotitulo_codtipotitulo_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_codtitulo_seq MAXVALUE 89999999;

ALTER SEQUENCE tbltitulo_remessa_105_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_210_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_2222_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_remessa_559_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltituloagrupamento_codtituloagrupamento_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltributacao_codtributacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltributacaonaturezaoperacao_codtributacaonaturezaoperacao_seq MAXVALUE 89999999;
ALTER SEQUENCE tblunidademedida_codunidademedida_seq MAXVALUE 89999999;
ALTER SEQUENCE tblusuario_codusuario_seq MAXVALUE 89999999;

ALTER SEQUENCE tbltitulo_nossonumero_105_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_210_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_2222_seq MAXVALUE 89999999;
ALTER SEQUENCE tbltitulo_nossonumero_559_seq MAXVALUE 89999999;


ALTER SEQUENCE tblnegocio_codnegocio_seq MAXVALUE 89999999;
select setval('tblnegocio_codnegocio_seq', coalesce(max(codnegocio), 80000001)) from tblnegocio where codnegocio between 80000000 and 89999999;
ALTER SEQUENCE tblnegocio_codnegocio_seq START 80000001 MINVALUE 80000000;
