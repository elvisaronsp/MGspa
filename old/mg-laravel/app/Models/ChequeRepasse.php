<?php

namespace App\Models;

/**
 * Campos
 * @property  bigint                         $codchequerepasse                   NOT NULL DEFAULT nextval('tblchequerepasse_codchequerepasse_seq'::regclass)
 * @property  bigint                         $codportador                        NOT NULL
 * @property  date                           $data                               NOT NULL
 * @property  varchar()                      $observacoes                        DEFAULT 200
 * @property  timestamp                      $criacao                            
 * @property  bigint                         $codusuariocriacao                  
 * @property  timestamp                      $alteracao                          
 * @property  bigint                         $codusuarioalteracao                
 * @property  timestamp                      $inativo                            
 *
 * Chaves Estrangeiras
 * @property  Usuario                        $UsuarioCriacao
 * @property  Usuario                        $UsuarioAlteracao
 * @property  Portador                       $Portador
 *
 * Tabelas Filhas
 * @property  ChequeRepasseCheque[]          $ChequeRepasseChequeS
 */

class ChequeRepasse extends MGModel
{
    protected $table = 'tblchequerepasse';
    protected $primaryKey = 'codchequerepasse';
    protected $fillable = [
          'codportador',
         'data',
         'observacoes',
         ];
    protected $dates = [
        'data',
        'criacao',
        'alteracao',
        'inativo',
    ];


    // Chaves Estrangeiras
    public function UsuarioCriacao()
    {
        return $this->belongsTo(Usuario::class, 'codusuariocriacao', 'codusuario');
    }

    public function UsuarioAlteracao()
    {
        return $this->belongsTo(Usuario::class, 'codusuarioalteracao', 'codusuario');
    }

    public function Portador()
    {
        return $this->belongsTo(Portador::class, 'codportador', 'codportador');
    }


    // Tabelas Filhas
    public function ChequeRepasseChequeS()
    {
        return $this->hasMany(ChequeRepasseCheque::class, 'codchequerepasse', 'codchequerepasse');
    }


}
