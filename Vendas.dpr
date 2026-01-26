program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'datamodule\uDTMConexao.pas' {dtmConexao: TDataModule},
  uCadCategorias in 'views\uCadCategorias.pas' {frmCadCategorias},
  cCadCategoria in 'classes\cCadCategoria.pas',
  uEnumEstadoCadastro in 'classes\uEnumEstadoCadastro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.Run;
end.
