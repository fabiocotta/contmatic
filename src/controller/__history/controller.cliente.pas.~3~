unit controller.cliente;

interface

uses
  cliente.entidade, cliente.repositorio, Util.Conexao, System.SysUtils,
  Data.DB;

type
  TClienteControlador = class
  private

  public
    procedure ObterCliente(pCodigo: integer; var pCliente: TClienteEntidade);
    procedure Consultar(pNome: String; var pDataSet: TDataSet);
  end;


implementation

{ TClienteControlador }

procedure TClienteControlador.Consultar(pNome: String; var pDataSet: TDataSet);
var
  lClienteRepositorio : TClienteRepositorio;
begin
  lClienteRepositorio := TClienteRepositorio.Create;
  try
    try
      lClienteRepositorio.Consultar(pNome, TConexao.ObterInstancia, pDataSet);
    except
      on e: Exception do
        raise Exception.Create('Erro ao consultar o cliente!'+e.Message);
    end;
  finally
    FreeAndNil(lClienteRepositorio);
  end;
end;

procedure TClienteControlador.ObterCliente(pCodigo: integer;
  var pCliente: TClienteEntidade);
var
  lClienteRepositorio : TClienteRepositorio;
begin
  lClienteRepositorio := TClienteRepositorio.Create;
  try
    try
      lClienteRepositorio.ObterCliente(pCodigo, TConexao.ObterInstancia, pCliente);
    except
      on e: Exception do
        raise Exception.Create('Erro ao obter o cliente!'+e.Message);
    end;
  finally
    FreeAndNil(lClienteRepositorio);
  end;
end;

end.
