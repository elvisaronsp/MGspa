<?php

namespace Mg\NotaFiscalTerceiro;

use Mg\MgModel;

class NotaFiscalTerceiro extends MGModel
{
    protected $table = 'tblnotafiscalterceiro';
    protected $primaryKey = 'codnotafiscalterceiro';
    protected $fillable = [
        'coddidtribuicaodfe',
        'codnotafiscal',
        'codnegocio',
        'codfilial',
        'codoperacao',
        'codnaturezaoperacao',
        'codpessoa',
        'natop',
        'emitente',
        'cnpj',
        'ie',
        'emissao',
        'ignorada',
        'indsituacao',
        'justificativa',
        'indmanifestacao',
        'nfechave',
        'modelo',
        'serie',
        'numero',
        'entrada',
        'valortotal',
        'icmsbase',
        'icmsvalor',
        'icmsstbase',
        'icmsstvalor',
        'ipivalor',
        'valorprodutos',
        'valorfrete',
        'valorseguro',
        'valordesconto',
        'valoroutras',
        'download',
        'protocolo',
        'tipo', // tpNF
        'digito',

    ];
    protected $dates = [
        'emissao',
        'criacao',
        'alteracao'
    ];

    // Chaves Estrangeiras
    public function Filial()
    {
        return $this->belongsTo(Filial::class, 'codfilial', 'codfilial');
    }
    
    public function UsuarioAlteracao()
    {
        return $this->belongsTo(Usuario::class, 'codusuarioalteracao', 'codusuario');
    }

    public function UsuarioCriacao()
    {
        return $this->belongsTo(Usuario::class, 'codusuariocriacao', 'codusuario');
    }

    public function NaturezaOperacao()
    {
        return $this->belongsTo(NaturezaOperacao::class, 'codnaturezaoperacao', 'codnaturezaoperacao');
    }

    public function Pessoa()
    {
        return $this->belongsTo(Pessoa::class, 'codpessoa', 'codpessoa');
    }

    public function NFeTerceiroDistribuicaoDfe()
    {
        return $this->belongsTo(NotaFiscalTerceiroDistribuicaoDfe::class, 'coddidtribuicaodfe', 'coddidtribuicaodfe');
    }

    // Tabelas Filhas
    public function NotaFiscalTerceiroGrupoS()
    {
        return $this->hasMany(NotaFiscalTerceiroGrupo::class, 'codnotafiscalterceiro', 'codnotafiscalterceiro');
    }

    public function NotaFiscalTerceiroDuplicataS()
    {
        return $this->hasMany(NotaFiscalTerceiroDuplicata::class, 'codnotafiscalterceiro', 'codnotafiscalterceiro');
    }

}
