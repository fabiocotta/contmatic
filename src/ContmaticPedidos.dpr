program ContmaticPedidos;

uses
  Vcl.Forms,
  uPedido in 'view\uPedido.pas' {frmPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.Run;
end.
