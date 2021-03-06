<?php
namespace Mg\NaturezaOperacao;
use Mg\MgRepository;

class NaturezaOperacaoRepository extends MgRepository
{
    public static function pesquisar(array $filter = null, array $sort = null, array $fields = null)
    {
        $qry = NaturezaOperacao::query();
        $qry = self::qryOrdem($qry, $sort);
        $qry = self::qryColunas($qry, $fields);
        return $qry;
    }
}
