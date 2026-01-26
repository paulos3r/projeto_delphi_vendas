unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  uDTMConexao, cCadCategoria, uEnumEstadoCadastro;

type
  TfrmCadCategorias = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    dbNavegar: TDBNavigator;
    btnExcluir: TBitBtn;
    qryListagem: TFDQuery;
    dtsListagem: TDataSource;
    Panel2: TPanel;
    mksPesquisar: TMaskEdit;
    btnListagemPesquisa: TBitBtn;
    grdListagem: TDBGrid;
    tblManutencao: TTabSheet;
    qryListagemcategoria_id: TIntegerField;
    qryListagemdescricao: TWideStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    oCategoria:TCategoria;
    EstadoDoCadastro:TEstadoDoCadastro;

    { Private declarations }

    function CamposDeCriterioObrigatorio: Boolean;
    function Excluir:Boolean;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;

    procedure LimparEdits;

  public
    { Public declarations }
  end;

var
  frmCadCategorias: TfrmCadCategorias;

implementation

{$R *.dfm}


{$REGION '___FUNCIONALIDADE DOS BOTOES___'}

procedure TfrmCadCategorias.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(qryListagem.FieldByName('categoria_id').AsInteger) then begin
    edtCategoriaId.Text:= IntToStr( oCategoria.categoria_id );
    edtDescricao.Text:= oCategoria.descricao;
  end
  else begin
    btnCancelar.Click;
    abort;
  end;


  tabListagem.TabVisible:=false;
  pgcPrincipal.ActivePage:= tblManutencao;

end;

procedure TfrmCadCategorias.btnCancelarClick(Sender: TObject);
begin
  tabListagem.TabVisible := true;
  pgcPrincipal.ActivePage := tabListagem;
  ShowMessage('CANCELADO')
end;

procedure TfrmCadCategorias.btnExcluirClick(Sender: TObject);
begin
  ShowMessage('DELETADO');

  qryListagem.Refresh;
end;

procedure TfrmCadCategorias.btnGravarClick(Sender: TObject);
begin

  //oCategoria.categoria_id:=100;

  if ( CamposDeCriterioObrigatorio ) then begin
    abort;
  end;


  if edtDescricao.Text <> EmptyStr then begin
    ShowMessage('Campo obrigatório');
    edtDescricao.SetFocus;
    abort;
  end;

  oCategoria.descricao:=edtDescricao.Text;

  oCategoria.Gravar;

  ShowMessage('GRAVADO');

  qryListagem.Refresh;
end;

procedure TfrmCadCategorias.btnNovoClick(Sender: TObject);
begin
  tabListagem.TabVisible := false;
  pgcPrincipal.ActivePage := tblManutencao;
  ShowMessage('NOVO');
end;

{$ENDREGION}


{$REGION '___EVENTS FORM___'}

procedure TfrmCadCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryListagem.Close;

  if Assigned(oCategoria) then begin
    FreeAndNil(oCategoria);
  end;
end;

procedure TfrmCadCategorias.FormCreate(Sender: TObject);
begin
 qryListagem.Connection := dtmConexao.FDConnection1; //criar a conexao sempre que criar
 dtsListagem.DataSet := qryListagem;                 // vincuklar datasurce
 grdListagem.DataSource := dtsListagem;              // vincular na grid

 oCategoria:= TCategoria.Create(dtmConexao.FDConnection1);
end;

procedure TfrmCadCategorias.FormShow(Sender: TObject);
begin

  pgcPrincipal.ActivePageIndex := 0;

  if (qryListagem.SQL.Text<>EmptyStr) then begin
    qryListagem.Open;
  end;
end;

{$ENDREGION}


{$REGION '___PROCEDURES___'}

procedure TfrmCadCategorias.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmCadCategorias.grdListagemTitleClick(Column: TColumn);
begin
  qryListagem.IndexFieldNames:=Column.FieldName;
end;

procedure TfrmCadCategorias.LimparEdits;
var i: Integer;
begin
  for i := 0 to ComponentCount -1  do begin
    if Components[i] is TLabeledEdit then
      TLabeledEdit(Components[i]).Text := EmptyStr
    else if Components[i] is TEdit then
      TEdit(Components[i]).Text := EmptyStr;
  end;

end;
{$ENDREGION}


{$REGION '___FUNÇÕES___'}

function TfrmCadCategorias.CamposDeCriterioObrigatorio:Boolean;
var i:Integer;
begin
  Result:=False;

  for i := 0 to ComponentCount - 1  do begin
    if (Components[i] is TLabeledEdit)
    and ( TLabeledEdit(Components[i]).Tag = 1 )
    and ( TLabeledEdit(Components[i]).Text=EmptyStr) then begin
      MessageDlg( ( TLabeledEdit( Components[i] ).EditLabel.Caption) + ' é um campo de critério obrigatório!', mtInformation,[mbOK],0);

      TLabeledEdit(Components[i]).SetFocus;

      Result:=true;
      Break;
    end;


  end;

end;

function TfrmCadCategorias.Excluir: Boolean;
begin

  if oCategoria.Selecionar(qryListagem.FieldByName('categoria_id').AsInteger) then begin
    Result := oCategoria.Excluir;
  end;

end;

function TfrmCadCategorias.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtCategoriaId.Text<>EmptyStr then begin
    oCategoria.categoria_id := StrToInt( edtCategoriaId.Text );
  end
  else begin
    oCategoria.categoria_id:=0;
  end;

  oCategoria.descricao:=edtDescricao.Text;

  if (EstadoDoCadastro=ecInserir) then  begin
    Result := oCategoria.Gravar;
  end
  else if (EstadoDoCadastro=ecAlterar) then begin
    Result:=oCategoria.Atualizar;
  end;


end;

{$ENDREGION}

end.
