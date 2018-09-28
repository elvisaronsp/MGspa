<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

use Mg\Marca\Marca;
/*
use Mg\Produto\ProdutoVariacao;
use Mg\Produto\Produto;

use Mg\Estoque\MinimoMaximo\VendaMensalRepository;
use Mg\Estoque\MinimoMaximo\ComprasRepository;
*/
use Mg\Estoque\MinimoMaximo\DistribuicaoRepository;

class EstoqueDistribuirSaldoDeposito extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'estoque:distribuir-saldo-deposito {--codprodutovariacao=} {--codproduto=} {--codmarca=}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Distribuir Estoque do Deposito para Filiais';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        if ($cod = $this->option('codmarca')) {
            $m = Marca::findOrFail($cod);
            $ret = DistribuicaoRepository::criarPlanilhaDistribuicaoSaldoDeposito($m);
            return $ret;
        }

        DistribuicaoRepository::criarPlanilhaDistribuicaoSaldoDeposito();

        /*
        $ret = false;
        $recalcular = !$this->option('nao-recalcular');

        // se for somente uma variacao
        if ($cod = $this->option('codprodutovariacao')) {
          $m = ProdutoVariacao::findOrFail($cod);
          return VendaMensalRepository::atualizarVariacao($m);
        }

        // se for somente um produto
        if ($cod = $this->option('codproduto')) {
          $m = Produto::findOrFail($cod);
          return VendaMensalRepository::atualizarProduto($m);
        }

        // se for somente uma marca
        if ($cod = $this->option('codmarca')) {
          $m = Marca::findOrFail($cod);
          if ($recalcular) {
            $ret = VendaMensalRepository::atualizarMarca($m);
          }
          // se for pra gerar o pedido de compra
          if ($this->option('gerar-pedido')) {
            $ret = ComprasRepository::gerarPlanilhaPedido($m);
          }
          return $ret;
        }

        // se for geral
        if ($recalcular) {
          $ret = VendaMensalRepository::atualizar();
        }
        if ($this->option('enviar-mail-faltando')) {
          $destinatario = env('MAIL_ADDRES_ESTOQUE_FALTANDO', null);
          $ret = Mail::to($destinatario)->queue(new FaltandoMail());
        }
        return $ret;
        */
    }
}
