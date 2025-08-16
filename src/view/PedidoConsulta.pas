unit PedidoConsulta;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  pedido.entidade, util.enumerados;

type
  TfrmPedidoConsulta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNumeroPedido: TEdit;
    btConfirmar: TButton;
    btCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
  private
    FPedido: TPedidoEntidade;
    FOperacao: TOperacaoTelaPedido;
    function VerificaCampos: boolean;

    { Private declarations }
  public
    constructor Create(Sender: TComponent; pPedido: TPedidoEntidade;
      pOperacao: TOperacaoTelaPedido);
    { Public declarations }
  end;

var
  frmPedidoConsulta: TfrmPedidoConsulta;

implementation

{$R *.dfm}

procedure TfrmPedidoConsulta.btCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPedidoConsulta.btConfirmarClick(Sender: TObject);
begin
  if VerificaCampos then
  begin
    FPedido.NumeroPedido := StrToInt(edtNumeroPedido.Text);
    ModalResult := mrOk;
  end;
end;

constructor TfrmPedidoConsulta.Create(Sender: TComponent;
  pPedido: TPedidoEntidade; pOperacao: TOperacaoTelaPedido);
begin
  inherited Create(Sender);
  FPedido := pPedido;
  FOperacao := pOperacao;
end;

procedure TfrmPedidoConsulta.edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8, #127])) then
    key := #0;
end;

function TfrmPedidoConsulta.VerificaCampos: boolean;
begin
  Result := True;
  if edtNumeroPedido.Text = '' then
  begin
    MessageDlg('Numero do Pedido não informado! Preencha. ', TMsgDlgType.mtWarning, [mbOK], 0);
    edtNumeroPedido.SetFocus;
    Result := false;
  end
end;

procedure TfrmPedidoConsulta.FormShow(Sender: TObject);
begin
  if FOperacao = otpConsulta then
    self.Caption := 'Consulta pedido'
  else
    self.Caption := 'Cancelamento de pedido';
end;
end.
