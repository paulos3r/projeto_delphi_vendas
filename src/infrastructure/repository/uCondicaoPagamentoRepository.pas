unit uCondicaoPagamentoRepository;

interface

uses System.SysUtils, uCondicaoPagamento, Data.DB, ZConnection, ZDataset;


type
  TCondicaoPagamentoRepository = class
    public
      constructor Create(AConn:TZConnection);
      destructor Destroy; override;

      procedure Gravar(ACondicaoPagamento:TCondicaoPagamento);
      procedure Alterar(ACondicaoPagamento:TCondicaoPagamento);
      procedure Excluir(AId:Integer);

      function PesquisarPorId(AId:Integer): TCondicaoPagamento;
      function PesquisarPorNome(ANome:String): TCondicaoPagamento;

      function Listar:TDataSet;
    private
      dbConexao:TZConnection;

      function NovaQuery:TZQuery;

  end;

implementation

{ TCondicaoPagamentoRepository }

{$REGION '___ CONSTRUCTOR E DESTRUCTOR ___'}
constructor TCondicaoPagamentoRepository.Create(AConn: TZConnection);
begin
  dbConexao:=AConn;
end;

destructor TCondicaoPagamentoRepository.Destroy;
begin

  if Assigned(dbConexao) then  begin
    FreeAndNil( dbConexao );
  end;

  inherited;
end;
{$ENDREGION}


procedure TCondicaoPagamentoRepository.Alterar(ACondicaoPagamento: TCondicaoPagamento );
var qry:TZQuery;
begin

end;

procedure TCondicaoPagamentoRepository.Excluir( AId: Integer);
var qry:TZQuery;
begin

end;

procedure TCondicaoPagamentoRepository.Gravar( ACondicaoPagamento: TCondicaoPagamento );
begin

end;

function TCondicaoPagamentoRepository.Listar: TDataSet;
var qry:TZQuery;
begin
  Result:=nil;
end;

function TCondicaoPagamentoRepository.NovaQuery: TZQuery;
begin
  Result:=TZQuery.Create(nil);
  Result.Connection:=dbConexao;
end;

function TCondicaoPagamentoRepository.PesquisarPorId( AId: Integer): TCondicaoPagamento;
var qry:TZQuery;
begin

  Result:=nil;

end;

function TCondicaoPagamentoRepository.PesquisarPorNome( ANome: String ): TCondicaoPagamento;
var qry:TZQuery;
begin

  Result:= nil;
end;

end.
