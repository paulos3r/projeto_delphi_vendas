unit uDTMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Comp.UI, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TdtmConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
    // Garante que não exista lixo
  FDConnection1.Close;
  FDConnection1.Params.Clear;

  // Driver
  FDPhysPgDriverLink1.VendorLib := 'libpq.dll';

  // Parâmetros da conexão
  with FDConnection1.Params do begin
    Values['DriverID'] := 'PG';
    Values['Server'] := '127.0.0.1';
    Values['Port'] := '5432';
    Values['Database'] := 'VENDAS';
    Values['User_Name'] := 'postgres';
    Values['Password'] := 'DADOS';
  end;

  // 🔴 ESSENCIAL PARA PG
  FDConnection1.Params.Values['UseSSL'] := '0';

  FDConnection1.LoginPrompt := False;

  // Conecta
  FDConnection1.Connected := True;
end;

end.
