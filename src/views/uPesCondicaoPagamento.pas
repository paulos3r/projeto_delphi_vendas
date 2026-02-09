unit uPesCondicaoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uCondicaoPagamentoService,uDTMConexao;

type
  TfrmPesCondicaoPagamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btOk: TButton;
    btCancelar: TButton;
    cbPesCondicaoPagamentoFiltros: TComboBox;
    Label1: TLabel;
    edPesCondicaoPagamentoPesquisa: TEdit;
    dgPesCondicaoPagamento: TDBGrid;
    Label2: TLabel;
    dsPesCondicaoPagamento: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edPesCondicaoPagamentoPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btCancelarClick(Sender: TObject);
    procedure dgPesCondicaoPagamentoDblClick(Sender: TObject);
  private
    { Private declarations }
    FService:TCondicaoPagamentoService;
    procedure TrocarDataSet(ADataset:TDataSet);
    procedure SelecionarRegistro;

  public
    { Public declarations }
    id       :Integer;
    descricao:String;
    tipo     :String;
    forma    :String;
  end;

var
  frmPesCondicaoPagamento: TfrmPesCondicaoPagamento;

implementation

{$R *.dfm}

{$REGION '___CRIATE E DESTROI___'}

procedure TfrmPesCondicaoPagamento.FormCreate(Sender: TObject);
begin
  FService := TCondicaoPagamentoService.Create(dtmConexao.conOracle);
end;

procedure TfrmPesCondicaoPagamento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FService);
end;

{$ENDREGION}


{$REGION '___FUNCIONALIDADES___'}

procedure TfrmPesCondicaoPagamento.FormShow(Sender: TObject);
begin
  TrocarDataSet( FService.Listar );
  dgPesCondicaoPagamento.DataSource:=dsPesCondicaoPagamento;
end;

procedure TfrmPesCondicaoPagamento.TrocarDataSet(ADataset: TDataSet);
begin
  dsPesCondicaoPagamento.DataSet:=ADataset;
end;

procedure TfrmPesCondicaoPagamento.SelecionarRegistro;
begin
  if  ( dsPesCondicaoPagamento.DataSet = nil   ) or
      ( dsPesCondicaoPagamento.DataSet.IsEmpty ) then
    exit;

    // preciso passar esse resultado para tela de cadastro
  id:=dsPesCondicaoPagamento.DataSet.FieldByName('condicao_id').AsInteger;
  descricao:=dsPesCondicaoPagamento.DataSet.FieldByName('descricao').AsString;
  tipo:=dsPesCondicaoPagamento.DataSet.FieldByName('tipo_pagamento').AsString;
  forma:=dsPesCondicaoPagamento.DataSet.FieldByName('forma_pagamento').AsString;

end;

procedure TfrmPesCondicaoPagamento.dgPesCondicaoPagamentoDblClick( Sender: TObject );
begin
  SelecionarRegistro;
  ModalResult :=mrOk;
end;

procedure TfrmPesCondicaoPagamento.btCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesCondicaoPagamento.edPesCondicaoPagamentoPesquisaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState );
begin

  if key <> VK_RETURN  then
    Exit;

    Key:=0;

  case cbPesCondicaoPagamentoFiltros.ItemIndex of
    -1:
        TrocarDataSet( FService.Listar );
    0:
        TrocarDataSet(
          FService.PesquisarPorNome(edPesCondicaoPagamentoPesquisa.Text)
        );
    1:
        TrocarDataSet( FService.PesquisarPorId( StrToIntDef( edPesCondicaoPagamentoPesquisa.Text,0) ));
  end
end;

{$ENDREGION}

end.
