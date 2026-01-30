program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'src\uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'src\infrastructure\datamodule\uDTMConexao.pas' {dtmConexao: TDataModule},
  uCadCategorias in 'src\views\uCadCategorias.pas' {frmCadCategorias},
  uCategoria in 'src\domain\uCategoria.pas',
  uEnumEstadoCadastro in 'src\domain\uEnumEstadoCadastro.pas',
  uCategoriaRepository in 'src\infrastructure\repository\uCategoriaRepository.pas',
  uCategoriaService in 'src\services\uCategoriaService.pas',
  uCadCondicaoPagamento in 'src\views\uCadCondicaoPagamento.pas' {frmCadCondicaoPagamento},
  uPesCondicaoPagamento in 'src\views\uPesCondicaoPagamento.pas' {frmPesCondicaoPagamento},
  uCondicaoPagamentoRepository in 'src\infrastructure\repository\uCondicaoPagamentoRepository.pas',
  uCondicaoPagamento in 'src\domain\uCondicaoPagamento.pas',
  uCondicaoPagamentoService in 'src\services\uCondicaoPagamentoService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCondicaoPagamento, frmCadCondicaoPagamento);
  Application.CreateForm(TfrmPesCondicaoPagamento, frmPesCondicaoPagamento);
  Application.Run;
end.
