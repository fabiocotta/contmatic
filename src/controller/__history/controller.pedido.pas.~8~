unit controller.pedido;

interface

uses

  System.SysUtils,
  pedido.entidade,
  cliente.entidade,
  produto.entidade,
  pedidoproduto.entidade,

  pedido.repositorio,
  produto.repositorio,

  controller.cliente,
  controller.produto,
  controller.pedidoproduto,
  util.conexao;

type
  TControllerPedido = class
  private

  public
    procedure Salvar(pPedido: TPedidoEntidade);
    procedure Excluir(pNumeroPedido: integer);
    procedure ObterPedido(pNumeroPedido: integer; var pPedido: TPedidoEntidade;
      pCompleto: boolean = true);
  end;

implementation

{ TControllerPedido }

procedure TControllerPedido.Excluir(pNumeroPedido: integer);
var
//  lPedidoProdutoControlador: TPedidoProdutoControlador;
  lPedidoRepositorio: TPedidoRepositorio;
  lConexao: TConexao;
begin
//  lPedidoProdutoControlador := TPedidoProdutoControlador.Create;
  lPedidoRepositorio:= TPedidoRepositorio.Create;
  lConexao := TConexao.ObterInstancia;
  try
    try
      lConexao.Conexao.StartTransaction;
// foi resolvido com delete cascade, dexei comentado caso tenha algum restrição em usar
//      lPedidoProdutoControlador.ExcluirPedidoProdutoPorPedido(pNumeroPedido);
      lPedidoRepositorio.Excluir(pNumeroPedido, lConexao);
      lConexao.Conexao.Commit;
    except
      on E: Exception do
      begin
        lConexao.Conexao.Rollback;
        raise Exception.Create('Erro ao excluir o Pedido!'+E.message);
      end;
    end;
  finally
    FreeAndNil(lPedidoRepositorio);
//    FreeAndNil(lPedidoProdutoControlador);
  end;
end;

procedure TControllerPedido.ObterPedido(pNumeroPedido: integer;
  var pPedido: TPedidoEntidade; pCompleto: boolean = true);
var
  lPedidoRepositorio : TPedidoRepositorio;
  lClienteControlador: TClienteControlador;
  lPedidoProdutoControlador: TPedidoProdutoControlador;
  lCliente: TClienteEntidade;
  lListaPedidoProduto: TListaPedidoProduto;
begin
  lPedidoRepositorio := TPedidoRepositorio.Create;
  lClienteControlador := TClienteControlador.Create;
  lPedidoProdutoControlador := TPedidoProdutoControlador.Create;
  try
    lPedidoRepositorio.ObterPedido(pNumeroPedido, TConexao.ObterInstancia, pPedido);
    if pCompleto then
    begin
      lCliente := pPedido.Cliente;
      lClienteControlador.ObterCliente(pPedido.Cliente.Codigo, lCliente);
      lListaPedidoProduto := pPedido.ListaPedidoProduto;
      lPedidoProdutoControlador.ObterListaPedidoProduto(pNumeroPedido, lListaPedidoProduto);
    end;
  finally
    FreeAndNil(lPedidoRepositorio);
    FreeAndNil(lClienteControlador);
    FreeAndNil(lPedidoProdutoControlador);
  end;
end;

procedure TControllerPedido.Salvar(pPedido: TPedidoEntidade);
var
  I: Integer;
  lPedidoProduto: TPedidoProdutoEntidade;
  lConexao: TConexao;
  lPedidoRepositorio: TPedidoRepositorio;
  lPedidoProdutoControlador: TPedidoProdutoControlador;
begin
  lConexao := TConexao.ObterInstancia;
  lPedidoRepositorio := TPedidoRepositorio.Create;
  lPedidoProdutoControlador := TPedidoProdutoControlador.Create;
  try
    lConexao.Conexao.StartTransaction;
    try
      if pPedido.NumeroPedido > 0 then
      begin
        lPedidoRepositorio.Alterar(pPedido, lConexao);
        lPedidoProdutoControlador.ExcluirPedidoProdutoPorPedido(pPedido.NumeroPedido);
      end
      else
        lPedidoRepositorio.Incluir(pPedido, lConexao);

      for I := 0 to pPedido.ListaPedidoProduto.PedidoProdutos.Count-1 do
      begin
        lPedidoProduto := pPedido.ListaPedidoProduto.PedidoProdutos.Items[I];
        lPedidoProdutoControlador.Incluir(pPedido.NumeroPedido, lPedidoProduto);
      end;
      lConexao.Conexao.Commit;
    Except
      on E: Exception do
      begin
        lConexao.Conexao.Rollback;
        raise Exception.Create('Erro ao salvar Pedido!'+E.Message);
      end;
    end;
  finally
    FreeAndNil(lPedidoRepositorio);
    FreeAndNil(lPedidoProdutoControlador);
  end;
end;

end.
