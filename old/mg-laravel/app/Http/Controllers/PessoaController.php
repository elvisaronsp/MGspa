<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Repositories\PessoaRepository;

class PessoaController extends ControllerCrud
{
    protected $repositoryName = 'App\\Repositories\\PessoaRepository';

    public function autocomplete (Request $request)
    {
        $qry = PessoaRepository::autocomplete($request->all());

        return response()->json($qry, 206);
    }

    public function select2 (Request $request)
    {
        $qry = PessoaRepository::select2($request->all());

        return response()->json($qry, 206);
    }
}
