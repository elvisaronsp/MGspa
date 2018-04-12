<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['prefix' => 'v1/auth'], function () {
    Route::post('login', 'Auth\LoginController@authenticate');
    Route::get('logout', 'Auth\LoginController@logout');
    Route::get('check', 'Auth\LoginController@check');
    Route::get('refresh', 'Auth\LoginController@refreshToken');
    Route::get('user', 'Auth\LoginController@getAuthenticatedUser');
});

Route::group(['middleware' => ['cors', 'api', 'jwt-auth']], function () {

    Route::group(['prefix' => 'v1'], function () {

        // Usuários
        Route::get('usuario/resource', '\App\Mg\Usuario\Controllers\UsuarioController@resource');

        Route::get('usuario/{id}/autor', '\App\Mg\Usuario\Controllers\UsuarioController@author');
        Route::get('usuario/{id}/grupos', '\App\Mg\Usuario\Controllers\UsuarioController@groups')->name('usuario.groups');
        Route::post('usuario/{id}/grupos', '\App\Mg\Usuario\Controllers\UsuarioController@groupsCreate')->name('usuario.groups.create');
        Route::delete('usuario/{id}/grupos', '\App\Mg\Usuario\Controllers\UsuarioController@groupsDestroy')->name('usuario.groups.destroy');
        Route::get('usuario/{id}/detalhes', '\App\Mg\Usuario\Controllers\UsuarioController@details')->name('usuario.details');
        Route::delete('usuario/{id}/inativo', '\App\Mg\Usuario\Controllers\UsuarioController@activate')->name('usuario.activate');
        Route::post('usuario/{id}/inativo', '\App\Mg\Usuario\Controllers\UsuarioController@inactivate')->name('usuario.inactivate');

        Route::apiResource('usuario', '\App\Mg\Usuario\Controllers\UsuarioController');

        // Grupos de usuário
        Route::get('grupo-usuario/{id}/autor', '\App\Mg\Usuario\Controllers\GrupoUsuarioController@author');
        Route::get('grupo-usuario/{id}/detalhes', '\App\Mg\Usuario\Controllers\GrupoUsuarioController@details')->name('grupo-usuario.details');
        Route::delete('grupo-usuario/{id}/inativo', '\App\Mg\Usuario\Controllers\GrupoUsuarioController@activate')->name('grupo-usuario.activate');
        Route::post('grupo-usuario/{id}/inativo', '\App\Mg\Usuario\Controllers\GrupoUsuarioController@inactivate')->name('grupo-usuario.inactivate');
        Route::apiResource('grupo-usuario', '\App\Mg\Usuario\Controllers\GrupoUsuarioController');

        // Impressoras
        Route::get('impressora', '\App\Mg\Impressora\Controllers\ImpressoraController@index');

        // Filiais
        Route::apiResource('filial', '\App\Mg\Filial\Controllers\FilialController');

        // Pessoas
        Route::get('pessoa/autocomplete', '\App\Mg\Pessoa\Controllers\PessoaController@autocomplete');
        Route::apiResource('pessoa', '\App\Mg\Pessoa\Controllers\PessoaController');

        // Permissões
        Route::apiResource('permissao', '\App\Mg\Usuario\Controllers\PermissaoController');

        // Estoque
        Route::apiResource('estoque-estatistica', '\App\Mg\Estoque\Controllers\EstoqueEstatisticaController');

        // Imagem
        Route::apiResource('imagem', '\App\Mg\Imagem\Controllers\ImagemController');
        Route::delete('imagem/{id}/inativo', '\App\Mg\Imagem\Controllers\ImagemController@activate')->name('imagem.activate');
        Route::post('imagem/{id}/inativo', '\App\Mg\Imagem\Controllers\ImagemController@inactivate')->name('imagem.inactivate');

        // Marcas
        Route::get('marca/{id}/detalhes', '\App\Mg\Marca\Controllers\MarcaController@details')->name('marca.details');
        Route::delete('marca/{id}/inativo', '\App\Mg\Marca\Controllers\MarcaController@activate')->name('marca.activate');
        Route::post('marca/{id}/inativo', '\App\Mg\Marca\Controllers\MarcaController@inactivate')->name('marca.inactivate');
        Route::apiResource('marca', '\App\Mg\Marca\Controllers\MarcaController');

    });

});
