unit ConsultaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmConsultaPadrao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNome: TEdit;
    btPesquisar: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btSelcionar: TButton;
    btCancelar: TButton;
    DataSource: TDataSource;
    procedure btPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    FObjeto: TObject;
    FDataSet: TDataSet;
    procedure Pesquisar(); virtual; abstract;
  public
    { Public declarations }
    constructor Create(Sender: TComponent; pObjeto: TObject); overload;
  end;

var
  frmConsultaPadrao: TfrmConsultaPadrao;

implementation

{$R *.dfm}

{ TfrmConsultaPadrao }

procedure TfrmConsultaPadrao.btPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

constructor TfrmConsultaPadrao.Create(Sender: TComponent; pObjeto: TObject);
begin
  Inherited Create(Sender);
  FObjeto := pObjeto;
end;

procedure TfrmConsultaPadrao.FormShow(Sender: TObject);
begin
  FDataSet := TDataSet.Create(Self);
end;

end.
