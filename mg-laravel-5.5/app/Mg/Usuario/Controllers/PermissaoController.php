<?php

namespace App\Mg\Usuario\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Validation\Rule;

use App\Mg\Usuario\Models\GrupoUsuario;
use App\Mg\Usuario\Models\GrupoUsuarioPermissao;
use App\Mg\Usuario\Models\Permissao;
use App\Mg\Usuario\Repositories\PermissaoRepository;

class PermissaoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $qry = PermissaoRepository::listagemPermissoesPorGrupoUsuario();
        return response()->json($qry, 206);
    }

    public function store(Request $request)
    {

        if (!$permissao = Permissao::where('permissao', $request->get('permissao'))->first()) {
            $permissao = Permissao::create(null, ['permissao' => $request->get('permissao')]);
        }

        if (!GrupoUsuarioPermissao::where('codgrupousuario', $request->get('codgrupousuario'))->where('codpermissao', $permissao->codpermissao)->first()) {
            if (!$gup = GrupoUsuarioPermissao::create([
                'codgrupousuario' => $request->get('codgrupousuario'),
                'codpermissao' => $permissao->codpermissao,
            ])) {
                return false;
            }
        }

        return response()->json(true, 201);
    }

    public function destroy(Request $request, $id)
    {
        if (!$permissao = Permissao::where('permissao', $request->get('permissao'))->first()) {
            return true;
        }
        if (!$gup = GrupoUsuarioPermissao::where('codgrupousuario', $request->get('codgrupousuario'))->where('codpermissao', $permissao->codpermissao)->first()) {
            return true;
        }
        $gup->delete();

        return response()->json('', 204);
    }
}
