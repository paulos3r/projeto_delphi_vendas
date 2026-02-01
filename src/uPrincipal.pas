unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    mnuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    CAIXA1: TMenuItem;
    PRODUTO3: TMenuItem;
    UNIDADE1: TMenuItem;
    NCM1: TMenuItem;
    CUSTOEPRECO1: TMenuItem;
    ESTOQUE1: TMenuItem;
    CLIENTE3: TMenuItem;
    CONDIODEPAGAMENTO1: TMenuItem;
    N6: TMenuItem;
    ORAMENTO1: TMenuItem;
    VENDAS2: TMenuItem;
    N7: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CONDIODEPAGAMENTO1Click(Sender: TObject);
    procedure CLIENTE3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategorias,uCadCondicaoPagamento, uCadCliente, uDTMConexao;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  frmCadCategorias:=TfrmCadCategorias.Create(self);
  frmCadCategorias.ShowModal;
  frmCadCategorias.Release;
end;

procedure TfrmPrincipal.CLIENTE3Click(Sender: TObject);
begin
  frmCadCliente:=TfrmCadCliente.create(Self);
  frmCadCliente.ShowModal;
  frmCadCliente.Release;
end;

procedure TfrmPrincipal.CONDIODEPAGAMENTO1Click(Sender: TObject);
begin

  frmCadCondicaoPagamento:=TfrmCadCondicaoPagamento.Create(Self);
  frmCadCondicaoPagamento.ShowModal;
  frmCadCondicaoPagamento.Release;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(dtmConexao) then begin
    FreeAndNil(dtmConexao);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dtmConexao := TdtmConexao.Create(Self);


  with dtmConexao.conOracle do begin
    SQLHourGlass:=true;

    LibraryLocation:= 'C:\oracle\instantclient_21_20\oci.dll';
    Protocol:='oracle';
    HostName:='localhost';
    Port:=1521;
    User:='VENDAS';
    Password:='vendas';
    Database:='//localhost:1521/XEPDB1';

    LoginPrompt:= false;

    Connected:=true;
  end;
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
