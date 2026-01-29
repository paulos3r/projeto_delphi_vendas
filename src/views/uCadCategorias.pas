unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask,
  uDTMConexao, ZAbstractRODataset,ZAbstractDataset, ZDataset,
  uEnumEstadoCadastro, uCategoriaService, uCategoria;

type
  TfrmCadCategorias = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    Panel2: TPanel;
    mksPesquisar: TMaskEdit;
    btnListagemPesquisa: TBitBtn;
    tblManutencao: TTabSheet;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    grdListagem: TDBGrid;
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
    EstadoDoCadastro:TEstadoDoCadastro;
    oService:TCategoriaService;
    oCategoria:TCategoria;

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
var i:Integer; categoria:TCategoria;
begin

  categoria :=oService.BuscarPorId(qryListagem.FieldByName('categoria_id').AsInteger);

  if categoria<>nil then begin
    edtCategoriaId.Text:= IntToStr( categoria.categoria_id  );
    edtDescricao.Text:= categoria.descricao;
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
  ShowMessage('CANCELADO');

  LimparEdits;
end;

procedure TfrmCadCategorias.btnExcluirClick(Sender: TObject);
begin
  if tabListagem.TabVisible=true then begin
    ShowMessage('Item não foi selecionado para tela de manutenção');
    abort;
  end;

  oService.Excluir( StrToInt( edtCategoriaId.Text), edtDescricao.Text );

  tabListagem.TabVisible:=true;
  pgcPrincipal.ActivePage:=tabListagem;
  LimparEdits;
  qryListagem.Refresh;

end;

procedure TfrmCadCategorias.btnGravarClick(Sender: TObject);
begin

  if ( CamposDeCriterioObrigatorio ) then begin
    abort;
  end;

  if edtCategoriaId.Text <> EmptyStr then begin
    oService.Alterar( StrToInt( edtCategoriaId.Text), edtDescricao.Text );
  end
  else begin
    oService.Salvar( edtDescricao.Text);
  end;


  tabListagem.TabVisible := true;
  pgcPrincipal.ActivePage:=tabListagem;
  LimparEdits;
  qryListagem.Refresh;

end;

procedure TfrmCadCategorias.btnNovoClick(Sender: TObject);
begin
  tabListagem.TabVisible := false;
  pgcPrincipal.ActivePage := tblManutencao;
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
  try
    //conexão com banco oracle
    qryListagem.Connection := dtmConexao.conOracle;

    // preciso validar se o select está ok e se nao tem nem um problema
    with qryListagem do  begin
      Close;
      SQL.Clear;
      SQL.Text:= 'SELECT CATEGORIA_ID, DESCRICAO FROM CATEGORIAS';
      Open;
    end;

    dtsListagem.DataSet := qryListagem;
    grdListagem.DataSource := dtsListagem;

    oService:= TCategoriaService.Create(dtmConexao.conOracle);

  except on e:Exception do

      ShowMessage(
        'Não foi possível carregar as categorias.' + sLineBreak +
        'Verifique a conexão com o banco de dados e tente novamente.'
      );

  end;

end;

procedure TfrmCadCategorias.FormShow(Sender: TObject);
begin

  pgcPrincipal.ActivePageIndex := 0;

  if ( not qryListagem.SQL.Text.IsEmpty) then begin
    qryListagem.Open;
    qryListagem.Active:=true;
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

  if oService.BuscarPorId(qryListagem.FieldByName('categoria_id').AsInteger)<>nil then begin
    oService.Excluir( StrToInt(edtCategoriaId.Text) ,edtDescricao.Text);
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
    oService.Salvar(edtDescricao.Text);
  end
  else if (EstadoDoCadastro=ecAlterar) then begin
    oService.Alterar( StrToInt(edtCategoriaId.Text) ,edtDescricao.Text)
  end;

end;

{$ENDREGION}

end.
