<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Mg\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

/**
 * Description of Model
 *
 * @author escmig05
 */
abstract class MGModel extends Model
{
    protected $perPage = 50;

    const CREATED_AT = 'criacao';
    const UPDATED_AT = 'alteracao';

    public $timestamps = true;

    public static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (Auth::user() !== null) {
                $model->attributes['codusuariocriacao'] = Auth::user()->codusuario;
                $model->attributes['codusuarioalteracao'] = Auth::user()->codusuario;
            }
        });

        static::updating(function ($model) {
            if (Auth::user() !== null) {
                $model->attributes['codusuarioalteracao'] = Auth::user()->codusuario;
            }
        });

        static::saving(function ($model) {
            foreach ($model->toArray() as $fieldName => $fieldValue) {
                if ($fieldValue === '') {
                    $model->attributes[$fieldName] = null;
                }
            }
            return true;
        });
    }

    public static function queryFields($qry, array $fields = null)
    {
        if (empty($fields)) {
            return $qry;
        }
        return $qry->select($fields);
    }

    public static function querySort($qry, array $sort = null)
    {
        if (empty($sort)) {
            return $qry;
        }
        foreach ($sort as $field) {
            $dir = 'ASC';
            if (substr($field, 0, 1) == '-') {
                $dir = 'DESC';
                $field = substr($field, 1);
            }
            $qry->orderBy($field, $dir);
        }
        return $qry;
    }

    public function scopeAtivo($query)
    {
        $query->whereNull("{$this->table}.inativo");
    }

    public function scopeInativo($query)
    {
        $query->whereNotNull("{$this->table}.inativo");
    }

    public function scopeAtivoInativo($query, $valor)
    {
        switch ($valor) {
            case 1:
                $query->ativo();
                break;

            case 2:
                $query->inativo();
                break;

            default:
            case 9:
                break;
        }
    }

    public function scopePalavras($query, $campo, $palavras)
    {
        foreach (explode(' ', trim($palavras)) as $palavra) {
            if (!empty($palavra)) {
                $query->where($campo, 'ilike', "%$palavra%");
            }
        }
    }
}
