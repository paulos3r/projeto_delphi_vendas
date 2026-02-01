unit uCadCondicaoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,uCondicaoPagamentoService,
  Vcl.Mask, Data.DB, ZAbstractRODataset, ZAbstractDataset,uDTMConexao, Vcl.Menus;

type
  TfrmCadCondicaoPagamento = class(TForm)
    Panel1: TPanel;
    btFechar: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btExcluir: TBitBtn;
    btPesquisar: TBitBtn;
    Panel2: TPanel;
    edCodigo: TEdit;
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    cbTipoPagamento: TComboBox;
    GroupBox1: TGroupBox;
    cbDuplicata: TCheckBox;
    cbBoleto: TCheckBox;
    cbCheque: TCheckBox;
    cbCartao: TCheckBox;
    cbDinheiro: TCheckBox;
    cbAcumulativo: TCheckBox;
    Label3: TLabel;
    procedure btPesquisarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
  private
    { Private declarations }
    FService:TCondicaoPagamentoService;

    procedure LimparEdits;
  public
    { Public declarations }
  end;

var
  frmCadCondicaoPagamento: TfrmCadCondicaoPagamento;

implementation

uses uPesCondicaoPagamento;

{$R *.dfm}


procedure TfrmCadCondicaoPagamento.FormCreate(Sender: TObject);
begin
  FService := TCondicaoPagamentoService.Create(dtmConexao.conOracle);
end;

procedure TfrmCadCondicaoPagamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FService);
end;

procedure TfrmCadCondicaoPagamento.btCancelarClick(Sender: TObject);
begin

  if edCodigo.Text=EmptyStr then begin
    abort;
  end;

  LimparEdits;
  ShowMessage('CANCELADO');
end;

procedure TfrmCadCondicaoPagamento.btExcluirClick(Sender: TObject);
begin
  if edCodigo.Text=EmptyStr then  begin
    FService.Excluir( StrToInt( edCodigo.Text ));
  end;
end;

procedure TfrmCadCondicaoPagamento.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadCondicaoPagamento.btGravarClick(Sender: TObject);
var nome,tipo_pagamento,forma_pagamento:string;
begin
  if cbDinheiro.Checked then
        forma_pagamento:='DINHEIRO'
      else if cbDuplicata.Checked then
        forma_pagamento:='DUPLICATA'
      else if cbBoleto.Checked then
        forma_pagamento:='BOLETO'
      else if cbCheque.Checked then
        forma_pagamento:='CHEQUE'
      else if cbCartao.Checked then
        forma_pagamento:='CARTAO'
      else if cbAcumulativo.Checked then
        forma_pagamento:='ACUMULATIVO'
      else
        raise Exception.Create('Forma de pagamento invalida');

  if cbTipoPagamento.ItemIndex = -1 then begin
    abort;
  end;

  nome:= Trim( edNome.Text );
  tipo_pagamento:= IntToStr( cbTipoPagamento.ItemIndex );

  if edCodigo.Text=EmptyStr then begin
    FService.Gravar(nome,tipo_pagamento,forma_pagamento);
  end
  else begin
    FService.Alterar( StrToInt( edCodigo.Text ) , nome,tipo_pagamento,forma_pagamento);
  end;

  ShowMessage('Registro gravado com sucesso!');

  LimparEdits;

end;

procedure TfrmCadCondicaoPagamento.btPesquisarClick(Sender: TObject);
var forma_pagamento:string;
begin
  frmPesCondicaoPagamento:=TfrmPesCondicaoPagamento.Create(Self);
  frmPesCondicaoPagamento.ShowModal;

  try

    if frmPesCondicaoPagamento.ShowModal = mrOk then begin

      edCodigo.Text := IntToStr( frmPesCondicaoPagamento.id );
      edNome.Text   := frmPesCondicaoPagamento.descricao;
      cbTipoPagamento.ItemIndex:= StrToInt( frmPesCondicaoPagamento.tipo );

      forma_pagamento:= frmPesCondicaoPagamento.forma;

      if forma_pagamento='DINHEIRO' then
        cbDinheiro.Checked:=true
      else if  forma_pagamento='DUPLICATA' then
        cbDuplicata.Checked:=true
      else if  forma_pagamento='BOLETO' then
        cbBoleto.Checked:= true
      else if  forma_pagamento='CHEQUE' then
        cbCheque.Checked:=true
      else if  forma_pagamento='CARTAO' then
        cbCartao.Checked:=true
      else if  forma_pagamento='ACUMULATIVO' then
        cbAcumulativo.Checked:=true
      else
        raise Exception.Create('Forma de pagamento invalida');
    end;
  finally
    frmPesCondicaoPagamento.Release;
  end;

end;

procedure TfrmCadCondicaoPagamento.LimparEdits;
var i: Integer;
begin
  for i := 0 to ComponentCount -1  do begin
    if Components[i] is TLabeledEdit then
      TLabeledEdit(Components[i]).Text := EmptyStr
    else if Components[i] is TEdit then
      TEdit(Components[i]).Text := EmptyStr;
  end;

  cbTipoPagamento.ItemIndex:=-1;

  cbDinheiro.Checked:=false;
  cbDuplicata.Checked:=false;
  cbBoleto.Checked:=false;
  cbCheque.Checked:=false;
  cbCartao.Checked:=false;
  cbAcumulativo.Checked:=false;
end;

end.
