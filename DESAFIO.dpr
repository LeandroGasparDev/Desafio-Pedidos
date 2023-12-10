program DESAFIO;

uses
  Vcl.Forms,
  uPedidos in 'uPedidos.pas' {frmPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.Run;
end.
