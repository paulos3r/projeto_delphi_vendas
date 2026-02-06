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
  uCondicaoPagamentoService in 'src\services\uCondicaoPagamentoService.pas',
  uCliente in 'src\domain\uCliente.pas',
  uClienteRepository in 'src\infrastructure\repository\uClienteRepository.pas',
  uCadCliente in 'src\views\uCadCliente.pas' {frmCadCliente},
  uClienteService in 'src\services\uClienteService.pas',
  uPesCliente in 'src\views\uPesCliente.pas' {frmPesCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TdtmConexao, dtmConexao);
  dtmConexao.Conectar;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);

  Application.Run;
end.
