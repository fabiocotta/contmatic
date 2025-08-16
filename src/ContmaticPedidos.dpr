program ContmaticPedidos;

uses
  Vcl.Forms,
  Pedido in 'view\Pedido.pas' {frmPedidos},
  controller.pedido in 'controller\controller.pedido.pas',
  pedido.entidade in 'entidade\pedido.entidade.pas',
  util.conexao in 'util\util.conexao.pas',
  util.enumerados in 'util\util.enumerados.pas',
  pedido.repositorio in 'model\pedido.repositorio.pas',
  cliente.entidade in 'entidade\cliente.entidade.pas',
  pedidoproduto.entidade in 'entidade\pedidoproduto.entidade.pas',
  produto.entidade in 'entidade\produto.entidade.pas',
  controller.cliente in 'controller\controller.cliente.pas',
  controller.produto in 'controller\controller.produto.pas',
  controller.pedidoproduto in 'controller\controller.pedidoproduto.pas',
  cliente.repositorio in 'model\cliente.repositorio.pas',
  produto.repositorio in 'model\produto.repositorio.pas',
  pedidoproduto.repositorio in 'model\pedidoproduto.repositorio.pas',
  PedidoConsulta in 'view\PedidoConsulta.pas' {frmPedidoConsulta},
  ConsultaPadrao in 'view\ConsultaPadrao.pas' {frmConsultaPadrao},
  ConsultaProduto in 'view\ConsultaProduto.pas' {frmConsultaProduto},
  ClienteConsulta in 'view\ClienteConsulta.pas' {frmClienteConsulta},
  uDataModule in 'util\uDataModule.pas' {DMConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TfrmPedidoConsulta, frmPedidoConsulta);
  Application.CreateForm(TfrmConsultaPadrao, frmConsultaPadrao);
  Application.CreateForm(TfrmConsultaProduto, frmConsultaProduto);
  Application.CreateForm(TfrmClienteConsulta, frmClienteConsulta);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
