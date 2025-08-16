unit cliente.repositorio;

interface

uses
  Util.Conexao, cliente.entidade, FireDAC.Comp.Client, System.SysUtils,
  Data.DB, FireDaC.Stan.Param;

type
  TClienteRepositorio = class
  public
    procedure ObterCliente(pCodigo: integer; pConexao: TConexao;
      var pCliente: TClienteEntidade);
    procedure Consultar(pNome: String; pConexao: TConexao;
      var pDataSet: TDataSet);
  end;

implementation

{ TClienteRepositorio }

procedure TClienteRepositorio.Consultar(pNome: String;
  pConexao: TConexao; var pDataSet: TDataSet);
var
  lSql: string;
  lParam : TFDParams;
begin
  lParam := TFDParams.Create;
  try
    lParam.Add('NOME', '%'+pNome.ToUpper()+'%', ptInput);
    lSql:= 'SELECT CODIGO, NOME, CIDADE, UF FROM CLIENTE '+
      'WHERE UPPER(NOME) LIKE :NOME';
    pConexao.Conexao.ExecSQL(lSql, lParam, pDataSet);
  finally
    FreeAndNil(lParam);
  end;
end;

procedure TClienteRepositorio.ObterCliente(pCodigo: integer;
  pConexao: TConexao; var pCliente: TClienteEntidade);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  lQry.Connection := pConexao.ObterInstancia.Conexao;
  try
    lQry.Sql.Text := 'SELECT CODIGO, NOME, CIDADE, UF FROM CLIENTE WHERE CODIGO = :CODIGO';
    lQry.ParamByName('CODIGO').AsInteger := pCodigo;
    lQry.Close;
    lQry.Open;
    if lQry.RecordCount > 0 then
    begin
      lQry.First;
      pCliente.PopularObjeto(lQry);
    end;
  finally
    lQry.Close;
    FreeAndNil(lQry);
  end;
end;

end.
