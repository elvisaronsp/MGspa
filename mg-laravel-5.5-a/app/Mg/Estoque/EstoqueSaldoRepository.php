<?php
namespace Mg\Estoque;
use Mg\MgRepository;
use DB;

class EstoqueSaldoRepository extends MgRepository
{
    public static function buscaOuCria($codprodutovariacao, $codestoquelocal, $fiscal)
    {
        $elpv = EstoqueLocalProdutoVariacaoRepository::buscaOuCria($codprodutovariacao, $codestoquelocal);

        $es = EstoqueSaldo::where('codestoquelocalprodutovariacao', $elpv->codestoquelocalprodutovariacao)->where('fiscal', $fiscal)->first();
        if ($es == false)
        {
            $es = new EstoqueSaldo();
            $es->codestoquelocalprodutovariacao = $elpv->codestoquelocalprodutovariacao;
            $es->fiscal = $fiscal;
            $es->save();
        }
        return $es;
    }

    public static function estoqueCalculaCustoMedio($codestoquemes) {

        // if ($this->attempts() > 10) {
        //     $this->release(rand(30,240));
        // }
        //
        // if ($this->ciclo >= 100) {
        //     return;
        // }

        if (!$mes = EstoqueMes::findOrFail($codestoquemes)) {
            return;
        }

        // recalcula valor movimentacao com base no registro de origem
        $sql = "
            update tblestoquemovimento
            set entradavalor = orig.saidavalor / orig.saidaquantidade * tblestoquemovimento.entradaquantidade
                , saidavalor = orig.entradavalor / orig.entradaquantidade * tblestoquemovimento.saidaquantidade
            from tblestoquemovimento orig
            where tblestoquemovimento.codestoquemovimentoorigem = orig.codestoquemovimento
            and tblestoquemovimento.codestoquemes = {$mes->codestoquemes}
            ";

        $ret = DB::update($sql);

        //busca totais de registros nao baseados no custo medio
        $sql = "
            select
                sum(entradaquantidade) as entradaquantidade
                , sum(entradavalor) as entradavalor
                , sum(saidaquantidade) as saidaquantidade
                , sum(saidavalor) as saidavalor
            from tblestoquemovimento mov
            left join tblestoquemovimentotipo tipo on (tipo.codestoquemovimentotipo = mov.codestoquemovimentotipo)
            where mov.codestoquemes = {$mes->codestoquemes}
            and tipo.preco in (" . EstoqueMovimentoTipo::PRECO_INFORMADO . ", " . EstoqueMovimentoTipo::PRECO_ORIGEM . ")";

        $mov = DB::select($sql);
        $mov = $mov[0];

        //busca saldo inicial
        $inicialquantidade = 0;
        $inicialvalor = 0;
        $anterior = EstoqueMesRepository::buscaAnteriores($mes->codestoquesaldo, $mes->mes, 1);
        if (isset($anterior[0]))
        {
            $inicialquantidade = $anterior[0]->saldoquantidade;
            $inicialvalor = $anterior[0]->saldovalor;
        }

        //calcula custo medio
        $valor = $mov->entradavalor - $mov->saidavalor;
        $quantidade = $mov->entradaquantidade - $mov->saidaquantidade;
        if ($inicialquantidade > 0 && $inicialvalor > 0)
        {
            $valor += $inicialvalor;
            $quantidade += $inicialquantidade;
        }
        $customedio = 0;
        if ($quantidade != 0) {
            $customedio = abs($valor/$quantidade);
        }

        if (empty($customedio) && isset($anterior[0])) {
            $customedio = $anterior[0]->customedio;
	}

        if ($customedio > 100000) {
            return;
        }

        //recalcula valor movimentacao com base custo medio
        $sql = "
            update tblestoquemovimento
            set saidavalor = saidaquantidade * $customedio
                , entradavalor = entradaquantidade * $customedio
            where tblestoquemovimento.codestoquemes = {$mes->codestoquemes}
            and tblestoquemovimento.codestoquemovimentotipo in
                (select t.codestoquemovimentotipo from tblestoquemovimentotipo t where t.preco = " . EstoqueMovimentoTipo::PRECO_MEDIO . ")
            ";

        $ret = DB::update($sql);

        //busca totais movimentados do
        $sql = "
            select
                sum(entradaquantidade) entradaquantidade
                , sum(entradavalor) entradavalor
                , sum(saidaquantidade) saidaquantidade
                , sum(saidavalor) saidavalor
            from tblestoquemovimento mov
            left join tblestoquemovimentotipo tipo on (tipo.codestoquemovimentotipo = mov.codestoquemovimentotipo)
            where mov.codestoquemes = {$mes->codestoquemes}
            ";

        $mov = DB::select($sql);
        $mov = $mov[0];

        //calcula custo medio e totais novamente
        $mes->inicialquantidade = $inicialquantidade;
        //$mes->inicialvalor = $mes->inicialquantidade * $customedio;
        $mes->inicialvalor = $inicialvalor;
        $mes->entradaquantidade = $mov->entradaquantidade;
        $mes->entradavalor = $mov->entradavalor;
        $mes->saidaquantidade = $mov->saidaquantidade;
        $mes->saidavalor = $mov->saidavalor;
        $mes->saldoquantidade = $inicialquantidade + $mov->entradaquantidade - $mov->saidaquantidade;
        $mes->saldovalor = $mes->saldoquantidade * $customedio;
        $customedioanterior = $mes->customedio;
        $mes->customedio = $customedio;

        $mes->save();

        $customediodiferenca = abs($customedio - $customedioanterior);

        $mesesRecalcular = [];
        if ($customediodiferenca > 0.01)
        {
            $sql = "
                select distinct dest.codestoquemes
                from tblestoquemovimento orig
                inner join tblestoquemovimento dest on (dest.codestoquemovimentoorigem = orig.codestoquemovimento)
                where orig.codestoquemes = {$mes->codestoquemes}
                ";
            $ret = DB::select($sql);

            foreach ($ret as $row)
                $mesesRecalcular[] = $row->codestoquemes;
        }

        $proximo = EstoqueMesRepository::buscaProximos($mes->codestoquesaldo, $mes->mes, 1);
        if (isset($proximo[0])) {
            $mesesRecalcular[] = $proximo[0]->codestoquemes;
        } else {
            $mes->EstoqueSaldo->saldoquantidade = $mes->saldoquantidade;
            $mes->EstoqueSaldo->saldovalor = $mes->saldovalor;
            $mes->EstoqueSaldo->customedio = $mes->customedio;
            $mes->EstoqueSaldo->save();

            //atualiza 'dataentrada'
            DB::update(DB::raw("
                update tblestoquesaldo
                set dataentrada = (
                        select
                                x.data
                        from (
                                select
                                        mov.data
                                        , mov.entradaquantidade
                                        , sum(mov.entradaquantidade) over (order by mov.data desc) as soma
                                from tblestoquemes mes
                                inner join tblestoquemovimento mov on (mov.codestoquemes = mes.codestoquemes)
                                inner join tblestoquemovimentotipo tipo on (tipo.codestoquemovimentotipo = mov.codestoquemovimentotipo)
                                where mes.codestoquesaldo = tblestoquesaldo.codestoquesaldo
                                and mov.entradaquantidade is not null
                                and tipo.atualizaultimaentrada = true
                                ) x
                        where soma >= tblestoquesaldo.saldoquantidade
                        order by data DESC
                        limit 1
                )
                where tblestoquesaldo.codestoquesaldo = {$mes->codestoquesaldo}
            "));
        }

	/*
        if (!$mes->EstoqueSaldo->fiscal) {
            $this->dispatch((new EstoqueCalculaEstatisticas($mes->EstoqueSaldo->EstoqueLocalProdutoVariacao->codprodutovariacao, $mes->EstoqueSaldo->EstoqueLocalProdutoVariacao->codestoquelocal))->onQueue('low'));
        }
	*/

        // foreach ($mesesRecalcular as $mes) {
        //     $this->dispatch((new EstoqueCalculaCustoMedio($mes, $this->ciclo +1))->onQueue('urgent'));
        // }
    }

}
