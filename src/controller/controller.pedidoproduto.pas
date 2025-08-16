unit controller.pedidoproduto;

interface

uses
  pedidoproduto.entidade, Util.Conexao, pedidoproduto.Repositorio,
  System.SysUtils;

type
  TPedidoProdutoControlador = class
  public
    procedure Incluir(pNumeroPedido: Integer; pPedidoProduto: TPedidoProdutoEntidade);
    procedure ExcluirPedidoProdutoPorPedido(pNumeroPedido: integer);
    procedure ObterListaPedidoProduto(pNumeroPedido:Integer;
      var pListaPedidoProduto: TListaPedidoProduto);
  end;


implementation

{ TPedidoProdutoControlador }

procedure TPedidoProdutoControlador.ExcluirPedidoProdutoPorPedido(
  pNumeroPedido: integer);
var
  lPedidoProdutoRepositorio: TPedidoProdutoRepositorio;
  lConexao: TConexao;
begin
  lPedidoProdutoRepositorio := TPedidoProdutoRepositorio.Create;
  lConexao := TConexao.ObterInstancia;
  try
    try
      lConexao.Conexao.StartTransaction;
      lPedidoProdutoRepositorio.ExcluirPedidoProdutoPorPedido(pNumeroPedido, lConexao);
      lConexao.Conexao.Commit;
    except
      on E : Exception do
      begin
        lConexao.Conexao.Rollback;
        raise Exception.Create('Erro ao excluir os itens do pedido de numero '+
          pNumeroPedido.ToString+'! Mensagem tecnica: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(lPedidoProdutoRepositorio);
  end;
end;

procedure TPedidoProdutoControlador.Incluir(pNumeroPedido: Integer;
  pPedidoProduto: TPedidoProdutoEntidade);
var
  lPedidoProdutoRepositorio: TPedidoProdutoRepositorio;
  lConexao: TConexao;
begin
  lPedidoProdutoRepositorio := TPedidoProdutoRepositorio.Create;
  try
    try
      lConexao := TConexao.ObterInstancia;
      lConexao.Conexao.StartTransaction;
      lPedidoProdutoRepositorio.Incluir(pNumeroPedido, pPedidoProduto, lConexao);
      lConexao.Conexao.Commit;
    except
      on E : Exception do
      begin
        lConexao.Conexao.Rollback;
        raise Exception.Create('Erro ao incluir o item do pedido!'+E.Message);
      end;
    end;
  finally
    FreeAndNil(lPedidoProdutoRepositorio);
  end;
end;

procedure TPedidoProdutoControlador.ObterListaPedidoProduto(
  pNumeroPedido: Integer; var pListaPedidoProduto: TListaPedidoProduto);
var
  lPedidoProdutoRepositorio: TPedidoProdutoRepositorio;
begin
  lPedidoProdutoRepositorio := TPedidoProdutoRepositorio.Create;
  try
    try
      lPedidoProdutoRepositorio.ObterListaPedidoProduto(pNumeroPedido,
        TConexao.ObterInstancia, pListaPedidoProduto);
    except
      on E : Exception do
        raise Exception.Create('Erro ao obter lista de itens do pedido!'+E.Message);
    end;
  finally
    FreeAndNil(lPedidoProdutoRepositorio);
  end;
end;

end.
