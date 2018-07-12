<?php

namespace Mg\NFeTerceiro;

use Mg\NFePHP\NFePHPRepositoryConfig;
use Mg\Filial\Filial;

use NFePHP\NFe\Tools;
use NFePHP\Common\Certificate;
use NFePHP\NFe\Common\Standardize;
use NFePHP\NFe\Common\Complements;
use Carbon\Carbon;

class NFeTerceiroRepository
{

    public static function consultaDfe (Filial $filial){

        $tools = NFePHPRepositoryConfig::instanciaTools($filial);
        //só funciona para o modelo 55
        $tools->model('55');
        //este serviço somente opera em ambiente de produção
        $tools->setEnvironment(1);

        // BUSCA NA BASE DE DADOS A ULTIMA NSU CONSULTADA
        $ultimoNsu = NFeTerceiroDistribuicaoDfe::select('nsu')->where('codfilial', $filial->codfilial)->get();
        $ultimoNsu = end($ultimoNsu);
        $ultimoNsu = end($ultimoNsu);

        //este numero deverá vir do banco de dados nas proximas buscas para reduzir
        //a quantidade de documentos, e para não baixar várias vezes as mesmas coisas.
        // $ultNSU = 0;
        $ultNSU = $ultimoNsu->nsu;
        $maxNSU = $ultNSU;
        $loopLimit = 50;
        $iCount = 0;

        // executa a busca de DFe em loop
        while ($ultNSU <= $maxNSU) {
            $iCount++;
            if ($iCount >= $loopLimit) {
                break;
            }

            try {
                //executa a busca pelos documentos
                $resp = $tools->sefazDistDFe($ultNSU);
            } catch (\Exception $e) {
                echo $e->getMessage();
                //tratar o erro
            }

            //extrair e salvar os retornos
            $dom = new \DOMDocument();
            $dom->loadXML($resp);
            $node = $dom->getElementsByTagName('retDistDFeInt')->item(0);
            $tpAmb = $node->getElementsByTagName('tpAmb')->item(0)->nodeValue;
            $verAplic = $node->getElementsByTagName('verAplic')->item(0)->nodeValue;
            $cStat = $node->getElementsByTagName('cStat')->item(0)->nodeValue;
            $xMotivo = $node->getElementsByTagName('xMotivo')->item(0)->nodeValue;
            $dhResp = $node->getElementsByTagName('dhResp')->item(0)->nodeValue;
            $ultNSU = $node->getElementsByTagName('ultNSU')->item(0)->nodeValue;
            $maxNSU = $node->getElementsByTagName('maxNSU')->item(0)->nodeValue;
            $lote = $node->getElementsByTagName('loteDistDFeInt')->item(0);
            if (empty($lote)) {
                //lote vazio
                continue;
            }

            //essas tags irão conter os documentos zipados
            $docs = $lote->getElementsByTagName('docZip');
            foreach ($docs as $doc) {
                $numnsu = $doc->getAttribute('NSU');
                $schema = $doc->getAttribute('schema');
                //descompacta o documento e recupera o XML original
                $content = gzdecode(base64_decode($doc->nodeValue));
                //identifica o tipo de documento
                $tipo = substr($schema, 0, 6);
                //processar o conteudo do NSU, da forma que melhor lhe interessar
                //esse processamento depende do seu aplicativo

                // SALVA NA BASE DE DADOS O RESULTADO DA CONSULTA DFE
                $dfe = NFeTerceiroDistribuicaoDfe::firstOrNew([
                  'codfilial' => $filial->codfilial,
                  'nsu' => $numnsu,
                  'schema' => $schema
                ]);
                $dfe->codfilial = $filial->codfilial;
                $dfe->nsu = $numnsu;
                $dfe->schema = $schema;
                $dfe->save();

                // CONVERTE O XML EM UM OBJETO
                $st = new Standardize();
                $res = $st->toStd($content);
                $chave = $res->chNFe??null;

                // SALVA NA PASTA O ARQUIVO DFE DA CONSULTA
                if(!empty($chave)){
                    $pathNFeTerceiro = NFeTerceiroRepositoryPath::pathDFe($filial, $chave, true);
                    file_put_contents($pathNFeTerceiro, $content);
                }

            }
            sleep(2);
        }  // FIM DO LOOP
    }

    public static function downloadNFeTerceiro (Filial $filial, $chave){

        // FAZ A CONSULTA NO WEBSERVICE E TRAZ O XML
        try {
            $tools = NFePHPRepositoryConfig::instanciaTools($filial);
            //só funciona para o modelo 55
            $tools->model('55');
            //este serviço somente opera em ambiente de produção
            $tools->setEnvironment(1);
            $key = $chave;
            $response = $tools->sefazDownload($key);

            $stz = new Standardize($response);
            $std = $stz->toStd();
            if ($std->cStat != 138) {
                echo "Documento não retornado. [$std->cStat] $std->xMotivo";
                die;
            }
            $zip = $std->loteDistDFeInt->docZip;
            $xml = gzdecode(base64_decode($zip));
            // header('Content-type: text/xml; charset=UTF-8');
            // echo $xml;

        } catch (\Exception $e) {
            echo str_replace("\n", "<br/>", $e->getMessage());
        }

        // CONVERTE O XML EM UM OBJETO
        $st = new Standardize();
        $res = $st->toStd($xml);
        $chave = $res->protNFe->infProt->chNFe;

        // SALVA NA PASTA O ARQUIVO DFE DA CONSULTA
        if(!empty($chave)){
            $pathNFeTerceiro = NFeTerceiroRepositoryPath::pathNFeTerceiro($filial, $chave, true);
            file_put_contents($pathNFeTerceiro, $xml);
        }

        // dd($res->NFe->infNFe->det);


        foreach ($res->NFe->infNFe->det as $key => $item) {
            dd($item->prod->xProd);
            $NFeItem = new NFeTerceiroItem();
            $NFeItem->codnotafiscalterceirogrupo = null;
            $NFeItem->numero = null;
            $NFeItem->referencia = $item->prod->cProd;
            $NFeItem->produto = $item->prod->xProd;
            $NFeItem->ncm = $item->prod->NCM;
            $NFeItem->cfop = $item->prod->CFOP;
            $NFeItem->barrastributavel = null;
            $NFeItem->unidademedidatributavel = $item->prod->uTrib;
            $NFeItem->quantidadetributavel = $item->prod->qTrib;
            $NFeItem->valorunitariotributavel =$item->prod->vUnTrib;
            $NFeItem->barras = null;
            $NFeItem->unidademedida = $item->prod->uCom
            $NFeItem->quantidade = $item->prod->qCom;
            $NFeItem->valorunitario = $item->prod->vUnCom;
            $NFeItem->valorproduto = $item->prod->vProd;
            $NFeItem->valorfrete =
            $NFeItem->valorseguro =
            $NFeItem->valordesconto =
            $NFeItem->valoroutras =
            $NFeItem->valortotal =
            $NFeItem->compoetotal =
            $NFeItem->csosn =
            $NFeItem->origem =
            $NFeItem->icmsbasemodalidade =
            $NFeItem->icmsbase =
            $NFeItem->icmspercentual =
            $NFeItem->icmsvalor =
            $NFeItem->icmsst =
            $NFeItem->icmsstbasemodalidade =
            $NFeItem->icmsstbase =
            $NFeItem->icmsstpercentual =
            $NFeItem->icmsstvalor =
            $NFeItem->ipicst =
            $NFeItem->ipibase =
            $NFeItem->ipipercentual =
            $NFeItem->ipivalor =
            $NFeItem->piscst =
            $NFeItem->pisbase =
            $NFeItem->pispercentual =
            $NFeItem->pisvalor =
            $NFeItem->cofinscst =
            $NFeItem->cofinsbase =
            $NFeItem->cofinspercentual =
            $NFeItem->cofinsvalor =
            dd($NFeItem);
        // $NFe->save();
            // dd($item);
        }



        // SALVA NA BASE DE DADOS O RESULTADO DA CONSULTA NFeTerceiro
        $NFe = new NFeTerceiro();
            $NFe->coddidtribuicaodfe = null;
            $NFe->codnotafiscal = $res->NFe->infNFe->ide->cNF;
            $NFe->codnegocio = null;
            $NFe->codfilial = $filial->codfilial;
            $NFe->codoperacao = $res->NFe->infNFe->ide->tpNF;
            $NFe->codnaturezaoperacao = null; //id tblnaturezaoperacao?
            $NFe->codpessoa = null; //id do fornecedor na tblpessoa?
            $NFe->emitente = $res->NFe->infNFe->emit->xNome;
            $NFe->cnpj = $res->NFe->infNFe->emit->CNPJ;
            $NFe->ie = $res->NFe->infNFe->emit->IE;
            $NFe->emissao = Carbon::parse($res->NFe->infNFe->ide->dhEmi);
            $NFe->ignorada = false;
            $NFe->indsituacao = null;
            $NFe->justificativa = $res->protNFe->infProt->xMotivo;
            $NFe->indmanifestacao = null;
            $NFe->nfechave = $res->protNFe->infProt->chNFe;
            $NFe->modelo = $res->NFe->infNFe->ide->mod;
            $NFe->serie = $res->NFe->infNFe->ide->serie;
            $NFe->numero = $res->NFe->infNFe->ide->nNF;
            $NFe->entrada = null;  //perguntar para o ususario a data?
            $NFe->valortotal = $res->NFe->infNFe->total->ICMSTot->vNF;
            $NFe->icmsbase = $res->NFe->infNFe->total->ICMSTot->vBC;
            $NFe->icmsvalor = $res->NFe->infNFe->total->ICMSTot->vICMS;
            $NFe->icmsstbase = $res->NFe->infNFe->total->ICMSTot->vBCST;
            $NFe->icmsstvalor = $res->NFe->infNFe->total->ICMSTot->vST;
            $NFe->ipivalor = $res->NFe->infNFe->total->ICMSTot->vProd;
            $NFe->valorprodutos = $res->NFe->infNFe->total->ICMSTot->vProd;
            $NFe->valorfrete = $res->NFe->infNFe->total->ICMSTot->vFrete;
            $NFe->valorseguro = $res->NFe->infNFe->total->ICMSTot->vSeg;
            $NFe->valordesconto = $res->NFe->infNFe->total->ICMSTot->vDesc;
            $NFe->valoroutras = $res->NFe->infNFe->total->ICMSTot->vOutro;
            dd($NFe);
            //$NFe->save();



    }

    public static function listaNfeTerceiro ()
    {
        dd('aqui');

    }

    public static function detalhesNfeTerceiro ()
    {
        dd('aqui');

    }

    // public static function pesquisarSefaz ()
    // {
    //     dd('aqui');
    // }

}
