<?php

namespace Mg\NFeTerceiro;

use Mg\MgModel;

class NFeTerceiroDuplicata extends MGModel
{
    protected $table = 'tblnotafiscalterceiroduplicata';
    protected $primaryKey = 'codnotafiscalterceiroduplicata';
    protected $fillable = [
        'codnotafiscalterceiro',
        'codtitulo',
        'duplicata',
        'vencimento',
        'valor',
        'ndup',
        'dvenc',
        'vdup',
        'codusuariocriacao',
        'codusuarioalteracao'

    ];
    protected $dates = [
        'dvenc',
        'vencimento',
        'criacao',
        'alteracao'
    ];

    // Chaves Estrangeiras
    public function NotaFiscalTerceiro()
    {
        return $this->belongsTo(NotaFiscalTerceiro::class, 'codnotafiscalterceiro', 'codnotafiscalterceiro');
    }

    // Tabelas Filhas
}
