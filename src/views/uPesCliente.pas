unit uPesCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, uClienteService, uDTMConexao;

type
  TfrmPesCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btOk: TButton;
    btCancelar: TBitBtn;
    LabeledEdit2: TLabeledEdit;
    cbBuscarPor: TComboBox;
    dgPesCliente: TDBGrid;
    lbBuscar: TLabel;
    dsPesCliente: TDataSource;
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgPesClienteDblClick(Sender: TObject);
  private
    { Private declarations }
    FService:TClienteService;
    procedure SelecionarRegistro;
  public
    { Public declarations }
    id:Integer;
  end;

var
  frmPesCliente: TfrmPesCliente;

implementation

{$R *.dfm}

procedure TfrmPesCliente.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesCliente.dgPesClienteDblClick(Sender: TObject);
begin
  SelecionarRegistro;
end;

procedure TfrmPesCliente.FormCreate(Sender: TObject);
begin
  FService :=  TClienteService.Create(dtmConexao.conOracle);
end;

procedure TfrmPesCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FService);
end;

procedure TfrmPesCliente.FormShow(Sender: TObject);
begin
  dsPesCliente.DataSet:=FService.Listar;
  dgPesCliente.DataSource:=dsPesCliente;
end;

procedure TfrmPesCliente.SelecionarRegistro;
begin
  if not Assigned(dsPesCliente.DataSet) then exit;
  if dsPesCliente.DataSet.IsEmpty then exit;

    // preciso passar esse resultado para tela de cadastro
  id:=dsPesCliente.DataSet.FieldByName('CLIENTE_ID').AsInteger;

  ModalResult :=mrOk;
end;

end.
