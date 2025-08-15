unit pedido.entidade;

interface

uses

  cliente.entidade, pedidoproduto.entidade, Data.DB, System.SysUtils;

type
  TPedidoEntidade = class
  private
    FCliente: TClienteEntidade;
    FPedidoProdutos: TListaPedidoProduto;
    FValorTotal: Double;
    FDataEmissao: TDateTime;
    FNumeroPedido: Integer;

    procedure AfterConstruction; override;
    destructor Destroy; override;
    procedure SetCliente(const Value: TClienteEntidade);
    procedure setDataEmissao(const Value: TDateTime);
    procedure setNumeroPedido(const Value: Integer);
    procedure setPedidoProdutos(const Value: TListaPedidoProduto);
    procedure SetValorTotal(const Value: Double);
  public
    property NumeroPedido: Integer read FNumeroPedido write setNumeroPedido;
    property DataEmissao: TDateTime read FDataEmissao write setDataEmissao;
    property Cliente: TClienteEntidade read FCliente write SetCliente;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property ListaPedidoProduto: TListaPedidoProduto read FPedidoProdutos write setPedidoProdutos;
    procedure PopularObjeto(pDataSet: TDataSet);
  end;

implementation

{ TPedidoDominio }



procedure TPedidoEntidade.AfterConstruction;
begin
  inherited;
  FCliente := TClienteEntidade.Create;
  FPedidoProdutos := TListaPedidoProduto.Create;
end;

destructor TPedidoEntidade.Destroy;
begin
  FreeAndNil(FCliente);
  FreeAndNil(FPedidoProdutos);
  inherited;
end;

procedure TPedidoEntidade.PopularObjeto(pDataSet: TDataSet);
begin
  FNumeroPedido := pDataset.FieldByName('NUMERO_PEDIDO').AsInteger;
  FDataEmissao := pDataset.FieldByName('DATA_EMISSAO').AsDateTime;
  FCliente.Codigo := pDataSet.FieldByName('CODIGO_CLIENTE').AsInteger;
  FValorTotal := pDataSet.FieldByName('VALOR_TOTAL').AsFloat;
end;

procedure TPedidoEntidade.SetCliente(const Value: TClienteEntidade);
begin
  FCliente := Value;
end;

procedure TPedidoEntidade.setDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TPedidoEntidade.setNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedidoEntidade.setPedidoProdutos(const Value: TListaPedidoProduto);
begin
  FPedidoProdutos := Value;
end;

procedure TPedidoEntidade.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
