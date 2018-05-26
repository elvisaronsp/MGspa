<?php
namespace Mg\Estoque;
use Mg\MgRepository;

class EstoquelocalRepository extends MgRepository
{
    public static function pesquisar(array $filter = null, array $sort = null, array $fields = null)
    {
        $qry = EstoqueLocal::query();

        if (!empty($filter['inativo'])) {
            $qry->AtivoInativo($filter['inativo']);
        }

        if (!empty($filter['estoquelocal'])) {
            $qry->palavras('estoquelocal', $filter['estoquelocal']);
        }

        $qry = self::qryOrdem($qry, $sort);
        $qry = self::qryColunas($qry, $fields);
        return $qry;
    }

    public static function autocompletar($params)
    {
        $qry = static::pesquisar($params)
                ->select('codestoquelocal', 'estoquelocal')
                ->take(10);

        $ret = [];
        foreach ($qry->get() as $item) {
            $ret[] = [
                'label' => $item->estoquelocal,
                'value' => $item->estoquelocal,
                'id' => $item->codestoquelocal,
            ];
        }

        return $ret;
    }
}