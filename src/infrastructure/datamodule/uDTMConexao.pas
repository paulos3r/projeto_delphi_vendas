unit uDTMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractConnection, ZConnection;

type
  TdtmConexao = class(TDataModule)
    conOracle: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Conectar;
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmConexao }

procedure TdtmConexao.Conectar;
begin
  if not conOracle.Connected then begin
    conOracle.Connected:=true;
  end;
end;

end.
