unit ClienteConsulta;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Controller.Cliente,
  cliente.entidade,
  ConsultaPadrao;


type
  TfrmClienteConsulta = class(TfrmConsultaPadrao)
  procedure btSelcionarClick(Sender: TObject);
  private
    { Private declarations }
     procedure Pesquisar(); override;
  public
    { Public declarations }
  end;

var
  frmClienteConsulta: TfrmClienteConsulta;

implementation

{$R *.dfm}

procedure TfrmClienteConsulta.btSelcionarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(DataSource.DataSet) then
    MessageDlg('É necessario pesquisar primeiro um item antes de selecionar!', TMsgDlgType.mtWarning, [mbOK], 0)
  else if DataSource.DataSet.RecordCount = 0 then
    MessageDlg('Não item a ser selecionado!', TMsgDlgType.mtWarning, [mbOK], 0)
  else
  begin
    TClienteEntidade(FObjeto).PopularObjeto(DataSource.DataSet);
    ModalResult := mrOk;
  end;
end;

procedure TfrmClienteConsulta.Pesquisar;
var
  lClienteControlador: TClienteControlador;
begin
  inherited;
  lClienteControlador := TClienteControlador.Create;
  try
    lClienteControlador.Consultar(edtNome.Text, FDataSet);
    DataSource.DataSet := FDataSet;
  finally
    FreeAndNil(lClienteControlador);
  end;
end;


end.
