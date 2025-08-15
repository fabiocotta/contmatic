unit controller.produto;

interface

uses
  produto.entidade, Data.DB, Produto.Repositorio, Util.Conexao,
  System.SysUtils;

type
  TProdutoControlador = class
  private

  public
    procedure ObterProduto(pCodigo: integer; var pCliente: TProdutoEntidade);
    procedure Consultar(pDescricao: String; var pDataSet: TDataSet);
  end;

implementation

{ TProdutoControlador }

procedure TProdutoControlador.Consultar(pDescricao: String;
  var pDataSet: TDataSet);
var
  lProdutoRepositorio : TProdutoRepositorio;
begin
  lProdutoRepositorio := TProdutoRepositorio.Create;
  try
    try
      lProdutoRepositorio.Consultar(pDescricao, TConexao.ObterInstancia, pDataSet);
    except
      on e: Exception do
        raise Exception.Create('Erro ao consultar o produto! Messagem tecnica: '+e.Message);
    end;
  finally
    FreeAndNil(lProdutoRepositorio);
  end;
end;

procedure TProdutoControlador.ObterProduto(pCodigo: integer;
  var pCliente: TProdutoEntidade);
var
  lProdutoRepositorio : TProdutoRepositorio;
begin
  lProdutoRepositorio := TProdutoRepositorio.Create;
  try
    try
      lProdutoRepositorio.ObterProduto(pCodigo, TConexao.ObterInstancia, pCliente);
    except
      on e: Exception do
        raise Exception.Create('Erro ao obter o produto! Messagem tecnica: '+e.Message);
    end;
  finally
    FreeAndNil(lProdutoRepositorio);
  end;
end;

end.
