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
    Button1: TButton;
    Button2: TButton;
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
    procedure Button2Click(Sender: TObject);
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
  {
    quando eu fecho a aplicação uPrincipal passa por aqui, mais eu estou matando a aplicação quando fecho
    validar se esse processo esta certo
  }
  // ShowMessage('entra aqui');
  FreeAndNil(FService);

end;

{$ENDREGION}

{$REGION '___FUNCIONALIDADES___'}
procedure TfrmPesCondicaoPagamento.FormShow(Sender: TObject);
begin
  dsPesCondicaoPagamento.DataSet:=FService.Listar;
  dgPesCondicaoPagamento.DataSource:=dsPesCondicaoPagamento;
end;

procedure TfrmPesCondicaoPagamento.SelecionarRegistro;
begin
  if not Assigned(dsPesCondicaoPagamento.DataSet) then exit;
  if dsPesCondicaoPagamento.DataSet.IsEmpty then exit;

    // preciso passar esse resultado para tela de cadastro
  id:=dsPesCondicaoPagamento.DataSet.FieldByName('condicao_id').AsInteger;
  descricao:=dsPesCondicaoPagamento.DataSet.FieldByName('descricao').AsString;
  tipo:=dsPesCondicaoPagamento.DataSet.FieldByName('tipo_pagamento').AsString;
  forma:=dsPesCondicaoPagamento.DataSet.FieldByName('forma_pagamento').AsString;

  ModalResult :=mrOk;
  //PostMessage(Self.Handle, WM_CLOSE, 0, 0);
end;

procedure TfrmPesCondicaoPagamento.TrocarDataSet(ADataset: TDataSet);
begin

  dsPesCondicaoPagamento.DataSet:=ADataset;
end;

procedure TfrmPesCondicaoPagamento.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesCondicaoPagamento.dgPesCondicaoPagamentoDblClick(
  Sender: TObject);
begin
  SelecionarRegistro;
end;

procedure TfrmPesCondicaoPagamento.edPesCondicaoPagamentoPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_RETURN  then begin
    Key:=0;

    case cbPesCondicaoPagamentoFiltros.ItemIndex of
      -1:
        begin
          TrocarDataSet( FService.Listar );
        end;
      0:
        begin
          TrocarDataSet(
            FService.PesquisarPorNome(edPesCondicaoPagamentoPesquisa.Text)
          );
        end;
      1:
        begin
          TrocarDataSet( FService.PesquisarPorId( StrToIntDef( edPesCondicaoPagamentoPesquisa.Text,0) ));
        end;
    end

  end;

end;

{$ENDREGION}


end.
