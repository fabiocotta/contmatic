unit produto.repositorio;

interface

uses
  Util.Conexao, produto.entidade, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, FireDAC.Stan.Param;

type
  TProdutoRepositorio = class
  public
    procedure ObterProduto(pCodigo: integer; pConexao: TConexao;
      var pProduto: TProdutoEntidade);
    procedure Consultar(pDescricao: String; pConexao: TConexao;
      var pDataSet: TDataSet);
  end;

implementation

{ TProdutoRepositorio }

procedure TProdutoRepositorio.Consultar(pDescricao: String;
  pConexao: TConexao; var pDataSet: TDataSet);
var
  lSql: string;
  lParam: TFDParams;
begin
  lParam := TFDParams.Create;
  try
    lParam.Add('DESCRICAO','%'+pDescricao.ToUpper+'%', ptInput);
    lSql:= 'SELECT CODIGO, DESCRICAO, PRECOVENDA FROM PRODUTO '+
      'WHERE UPPER(DESCRICAO) LIKE :DESCRICAO';
    pConexao.Conexao.ExecSQL(lSql, lParam, pDataSet);
  finally
    FreeAndNil(lParam);
  end;
end;

procedure TProdutoRepositorio.ObterProduto(pCodigo: integer;
  pConexao: TConexao; var pProduto: TProdutoEntidade);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  lQry.Connection := pConexao.ObterInstancia.Conexao;
  try
    lQry.Sql.Text := 'SELECT CODIGO, DESCRICAO, PRECOVENDA FROM PRODUTO WHERE CODIGO = :CODIGO';
    lQry.ParamByName('CODIGO').AsInteger := pCodigo;
    lQry.Close;
    lQry.Open;
    if lQry.RecordCount > 0 then
    begin
      lQry.First;
      pProduto.PopularObjeto(lQry);
    end;
  finally
    lQry.Close;
    FreeAndNil(lQry);
  end;
end;

end.
