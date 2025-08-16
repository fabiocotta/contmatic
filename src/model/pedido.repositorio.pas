unit pedido.repositorio;

interface

uses
  pedido.entidade, Util.Conexao, Data.DB, System.Classes, System.SysUtils,
  FireDAC.Stan.Param;

type
  TPedidoRepositorio = class
  private
    function ObterID(pConexao: TConexao): integer;

  public
    procedure Incluir(pPedido: TPedidoEntidade; pConexao: TConexao);
    procedure Alterar(pPedido: TPedidoEntidade; pConexao: TConexao);
    procedure Excluir(pNumeroPedido: integer; pConexao: TConexao);
    procedure ObterPedido(pNumeroPedido: Integer; pConexao: TConexao;
      var pPedido: TPedidoEntidade);
  end;


implementation

{ TPedidoRepositorio }

procedure TPedidoRepositorio.Alterar(pPedido: TPedidoEntidade;
  pConexao: TConexao);
var
  lSql: string;
begin
  lSql := 'UPDATE PEDIDO SET DATA_EMISSAO = :DATA_EMISSAO, '+
    'CODIGO_CLIENTE = :CODIGOO_CLIENTE, VALOR_TOTAL = :VALOR_TOTAL '+
    'WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO';
  pConexao.Conexao.ExecSQL(lSql,
    [pPedido.DataEmissao, pPedido.Cliente.Codigo, pPedido.ValorTotal, pPedido.NumeroPedido],
    [ftDateTime, ftInteger, ftFloat, ftInteger]);
end;


procedure TPedidoRepositorio.Excluir(pNumeroPedido: integer;
  pConexao: TConexao);
var
  lSql: string;
begin
  lSql:= 'DELETE FROM PEDIDO WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO';
  pConexao.Conexao.ExecSQL(lSql, [pNumeroPedido], [ftInteger]);
end;

procedure TPedidoRepositorio.Incluir(pPedido: TPedidoEntidade;
  pConexao: TConexao);
var
  lSql: string;
begin
  lSql := 'INSERT INTO PEDIDO( DATA_EMISSAO, CODIGO_CLIENTE, VALOR_TOTAL) '+
    'VALUES (:DATA_EMISSAO, :CODIGO_CLIENTE, :VALOR_TOTAL)';
  pConexao.Conexao.ExecSQL(lSql,
    [pPedido.DataEmissao, pPedido.Cliente.Codigo, pPedido.ValorTotal],
    [ftDateTime, ftInteger, ftFloat]);
  pPedido.NumeroPedido := ObterID(pConexao);
end;

function TPedidoRepositorio.ObterID(pConexao: TConexao): integer;
var
  lSql: string;
  DataSet: TDataSet;
begin
  DataSet:= TDataSet.Create(nil);
  try
    lSql := 'SELECT LAST_INSERT_ID() AS ID';
    pConexao.Conexao.ExecSQL(lSql, DataSet);
    Result := DataSet.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(DataSet);
  end;
end;

procedure TPedidoRepositorio.ObterPedido(pNumeroPedido: integer;
  pConexao: TConexao; var pPedido: TPedidoEntidade);
var
  lSql: string;
  lDataSet: TDataSet;
  lParam: TFDParams;
begin
  lParam := TFDParams.Create();
  try
    lParam.Add('NUMERO_PEDIDO', pNumeroPedido, ptInput);
    lSql := 'SELECT NUMERO_PEDIDO, DATA_EMISSAO, CODIGO_CLIENTE, VALOR_TOTAL '+
      'FROM PEDIDO WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO';
    pConexao.Conexao.ExecSQL(lSql, lParam, lDataSet);
    lDataSet.First;
    pPedido.PopularObjeto(lDataSet);
  finally
    FreeAndNil(lParam);
  end;
end;

end.
