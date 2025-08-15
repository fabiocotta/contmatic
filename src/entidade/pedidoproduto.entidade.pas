unit pedidoproduto.entidade;

interface

uses
  produto.entidade, Data.DB, System.Generics.Collections, System.SysUtils;

type
  TPedidoProdutoEntidade = class(TObject)
  private
    FProduto: TProdutoEntidade;
    FCodigo: Integer;
    FValorUnitario: Double;
    FValorTotal: Double;
    FQuantidade: Integer;
    procedure setCodigo(const Value: Integer);
    procedure setProduto(const Value: TProdutoEntidade);
    procedure setQuantidade(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
    procedure SetValorUnitario(const Value: Double);

  public
    property Codigo : Integer read FCodigo write setCodigo;
    property Produto: TProdutoEntidade read FProduto write setProduto;
    property Quantidade: Integer read FQuantidade write setQuantidade;
    property ValorUnitario: Double read FValorUnitario write SetValorUnitario;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
  end;

  TListaPedidoProduto = class
  private
    FPedidoProdutos: TObjectList<TPedidoProdutoEntidade>;
  procedure setPedidoProdutos(const Value: TObjectList<TPedidoProdutoEntidade>);

  public
    property PedidoProdutos: TObjectList<TPedidoProdutoEntidade> read FPedidoProdutos write setPedidoProdutos;
    procedure PopularListaPedidoProduto(pDataSet: TDataSet);
    procedure AfterConstruction; override;
    destructor Destroy; override;
  end;

implementation

{ TPedidoProdutoDominio }

procedure TPedidoProdutoEntidade.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPedidoProdutoEntidade.setProduto(const Value: TProdutoEntidade);
begin
  FProduto := Value;
end;

procedure TPedidoProdutoEntidade.setQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TPedidoProdutoEntidade.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

procedure TPedidoProdutoEntidade.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

{ TListaPedidoProduto }

procedure TListaPedidoProduto.AfterConstruction;
begin
  inherited;
  FPedidoProdutos := TObjectList<TPedidoProdutoEntidade>.Create;
end;

destructor TListaPedidoProduto.Destroy;
begin
  FreeAndNil(FPedidoProdutos);
  inherited;
end;

procedure TListaPedidoProduto.PopularListaPedidoProduto(pDataSet: TDataSet);
var
  lPedidoProduto: TPedidoProdutoEntidade;
begin
  pDataSet.First;
  while not pDataSet.eof do
  begin
    lPedidoProduto                   := TPedidoProdutoEntidade.Create;
    lPedidoProduto.Codigo            := pDataSet.FieldByName('CODIGO').AsInteger;
    lPedidoProduto.Produto           := TProdutoEntidade.Create;
    lPedidoProduto.Produto.Codigo    := pDataSet.FieldByName('CODIGO_PRODUTO').AsInteger;
    lPedidoProduto.Produto.Descricao := pDataSet.FieldByName('DESCRICAO_PRODUTO').AsString;
    lPedidoProduto.ValorUnitario     := pDataSet.FieldByName('VALOR_UNITARIO').AsFloat;
    lPedidoProduto.Quantidade        := pDataSet.FieldByName('QUANTIDADE').AsInteger;
    lPedidoProduto.ValorTotal        := pDataSet.FieldByName('VALOR_TOTAL').AsFloat;
    FPedidoProdutos.Add(lPedidoProduto);
    pDataSet.Next;
  end;
end;

procedure TListaPedidoProduto.setPedidoProdutos(
  const Value: TObjectList<TPedidoProdutoEntidade>);
begin
  FPedidoProdutos := Value;
end;

end.
