<?php

namespace App\Repositories;

use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

use App\Models\Usuario;

/**
 * Description of UsuarioRepository
 *
 */
class UsuarioRepository extends MGRepositoryStatic
{
    public static $modelClass = '\\App\\Models\\Usuario';

    public static function validationRules ($model = null)
    {

        $rules = [
            'usuario' => [
                'required',
                Rule::unique('tblusuario')->ignore($model->codusuario, 'codusuario'),
                'min:2',
            ]
        ];

        return $rules;
    }

    public static function validationMessages ($model = null)
    {
        $messages = [
            'usuario.required' => 'O campo Usuario não pode ser vazio',
            'usuario.unique' => 'Este Usuario já esta cadastrado',
            'usuario.min' => 'O campo Usuario deve ter no mínimo 2 caracteres.',
        ];

        return $messages;
    }

    public static function details($model)
    {
        $details = $model->getAttributes();
        $details['pessoa'] = [
            'codpessoa' => $model->Pessoa->codpessoa ?? null,
            'pessoa' => $model->Pessoa->pessoa ?? null
        ];

        $details['filial'] = [
            'codfilial' => $model->Filial->codfilial,
            'filial' => $model->Filial->filial
        ];

        $grupos = [];
        foreach ($model->GrupoUsuarioUsuarioS as $grupo) {

            $grupos[$grupo->GrupoUsuario->grupousuario]['grupousuario'] = $grupo->GrupoUsuario->grupousuario;

            if (!isset($grupos[$grupo->GrupoUsuario->grupousuario]['filiais'])) {
                $grupos[$grupo->GrupoUsuario->grupousuario]['filiais'] = [];
            }

            array_push($grupos[$grupo->GrupoUsuario->grupousuario]['filiais'], $grupo->Filial->filial);

        }


        $details['grupos'] = $grupos;
        $details['permissoes'] = [];

        return $details;
    }

    public static function query(array $filter = null, array $sort = null, array $fields = null)
    {
        $qry = app(static::$modelClass)::query();

        if (!empty($filter['inativo'])) {
            $qry->AtivoInativo($filter['inativo']);
        }

        if (!empty($filter['usuario'])) {
            $qry->palavras('usuario', $filter['usuario']);
        }

        if (!empty($filter['grupo'])) {
            $qry->whereIn("codusuario", function ($qry2) use ($filter) {
                $qry2->select('codusuario')
                    ->from('tblgrupousuariousuario')
                    ->where('codgrupousuario', $filter['grupo']);
            });
        }

        $qry = static::querySort($qry, $sort);
        $qry = static::queryFields($qry, $fields);
        return $qry;
    }
}
