unit Pedido;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Util.Conexao, ClienteConsulta, cliente.entidade, controller.cliente,
  controller.produto, produto.entidade, System.UITypes, ProdutoConsulta,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, controller.pedido,
  pedido.entidade, PedidoConsulta, pedidoproduto.entidade, Util.Enumerados,
  midaslib;

type
  TfrmPedidos = class(TForm)
    pnlHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNumeroPedido: TEdit;
    dtpDataEmissao: TDateTimePicker;
    edtClienteCodigo: TEdit;
    btCliente: TButton;
    edtClienteNome: TEdit;
    btConsultaPedido: TButton;
    btCancelarPedido: TButton;
    pcPedidos: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtProdutoCodigo: TEdit;
    btProduto: TButton;
    edtProdutoDescricao: TEdit;
    edtValorUnitario: TEdit;
    edtQuantidade: TEdit;
    btAdicionar: TButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btGravarPedido: TButton;
    btCancelarOperacao: TButton;
    Panel4: TPanel;
    btRemover: TButton;
    Panel5: TPanel;
    Label7: TLabel;
    edtValorTotalPedido: TEdit;
    procedure btConsultaPedidoClick(Sender: TObject);
    procedure btClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

procedure TfrmPedidos.btClienteClick(Sender: TObject);
var
  lFrmClienteConsultaGUI : TfrmClienteConsulta;
  lCliente: TClienteEntidade;
begin
  lCliente := TClienteEntidade.Create;
  lFrmClienteEntidade := TfrmClienteConsulta.Create(self, lCliente);
  try
    if lFrmClienteConsulta.ShowModal = mrOk then
    begin
      edtClienteCodigo.Text := lCliente.Codigo.ToString;
      edtClienteNome.Text := lCliente.Nome
    end;
  finally
    FreeAndNil(lCliente);
    FreeAndNil(lFrmClienteConsulta);
  end;


end;

procedure TfrmPedidos.btConsultaPedidoClick(Sender: TObject);
  var
  lFrmPedidoConsulta : TfrmPedidoConsulta;
  lPedido: TPedidoEntidade;
  lPedidoControlador: TPedidoControlador;
begin
  lPedido := TPedidoEntidade.Create;
  lPedidoControlador := TPedidoControlador.Create;
  lFrmPedidoConsulta := TfrmPedidoConsulta.Create(self, lPedido, otpConsulta);
  try
    if lFrmPedidoConsulta.ShowModal = mrOk then
    begin
      try
        LimpaCampos;
        lPedidoControlador.ObterPedido(lPedido.NumeroPedido, lPedido);
        if lPedido.NumeroPedido = 0 then
          MessageDlg('Numero do pedido não encontrado!', TMsgDlgType.mtWarning, [mbOK], 0)
        else
          PopularControles(lPedido);
      except
        on E: Exception do
        begin
          MessageDlg('Erro ao consultar pedido de numero '+lPedido.NumeroPedido.ToString+
            ' ! mensagem tecnica: '+E.Message, TMsgDlgType.mtError, [mbOK], 0);
        end;
      end;
    end;
  finally
    FreeAndNil(lPedido);
    FreeAndNil(lPedidoControlador);
    FreeAndNil(lFrmPedidoConsulta);
  end;

end;

end.
