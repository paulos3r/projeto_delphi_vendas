unit uCondicaoPagamentoRepository;

interface

uses System.SysUtils, uCondicaoPagamento, Data.DB, ZConnection, ZDataset;


type
  TCondicaoPagamentoRepository = class

    private
      FConexao:TZConnection;
      function NovaQuery:TZQuery;

    public

      constructor Create(AConn:TZConnection);

      procedure Gravar(ACondicao:TCondicaoPagamento);
      procedure Alterar(ACondicao:TCondicaoPagamento);
      procedure Excluir(AId:Integer);

      function PesquisarPorId(AId:Integer): TZQuery;
      function PesquisarPorNome(ADescricao:String): TZQuery;

      function Listar:TZQuery;
  end;

implementation

{ TCondicaoPagamentoRepository }

{$REGION '___ CONSTRUCTOR E DESTRUCTOR ___'}

{ CONSTRUTOR }
constructor TCondicaoPagamentoRepository.Create(AConn: TZConnection);
begin
  inherited Create;
  FConexao:=AConn;
end;

{$ENDREGION}


{  QUERY BASE }
function TCondicaoPagamentoRepository.NovaQuery: TZQuery;
begin
  Result:=TZQuery.Create(nil);
  Result.Connection:=FConexao;
end;

{$REGION 'MyRegion'}

procedure TCondicaoPagamentoRepository.Alterar(ACondicao:TCondicaoPagamento);
var qry:TZQuery;
begin
  qry := NovaQuery;

  try
    qry.SQL.Add(
    ' UPDATE condicoes_pagamento   ' +
    ' SET descricao = :descricao,    ' +
    '    tipo_pagamento= :tipo_pagamento,  ' +
    '    forma_pagamento= :forma_pagamento  ' +
    ' WHERE condicao_id= :condicao_id'
    );

    qry.ParamByName('descricao').AsString        := ACondicao.descricao;
    qry.ParamByName('tipo_pagamento').AsString   := ACondicao.tipoPagamento;
    qry.ParamByName('forma_pagamento').AsString  := ACondicao.formaPagamento;
    qry.ParamByName('condicao_id').AsInteger     := ACondicao.condicaoId;


    qry.ExecSQL;

  finally

    if Assigned(qry) then begin
      qry.Free;
    end;

  end;

end;

procedure TCondicaoPagamentoRepository.Excluir( AId: Integer);
var qry:TZQuery;
begin
  qry := NovaQuery;

  try

    qry.SQL.Add(' DELETE FROM condicoes_pagamento WHERE condicao_id= :condicao_id ' );

    qry.ParamByName('condicao_id').AsInteger := AId;

    qry.ExecSQL;

  finally
    qry.Free;
  end;

end;

procedure TCondicaoPagamentoRepository.Gravar(ACondicao:TCondicaoPagamento );
var qry:TZQuery;
begin
    qry := NovaQuery;

  try
    qry.SQL.Add(
    ' INSERT INTO condicoes_pagamento( descricao, tipo_pagamento, forma_pagamento ) '+
    ' VALUES ( :descricao, :tipo_pagamento, :forma_pagamento ) '
    );

    qry.ParamByName('descricao').AsString         :=  ACondicao.descricao;
    qry.ParamByName('tipo_pagamento').AsInteger    :=  StrToInt( ACondicao.tipoPagamento );
    qry.ParamByName('forma_pagamento').AsString   :=  ACondicao.formaPagamento;

    qry.ExecSQL;
  finally
    qry.Free;
  end;

end;

function TCondicaoPagamentoRepository.Listar: TZQuery;
begin
  try
    Result := NovaQuery;

    Result.SQL.Text := ' SELECT condicao_id, descricao, tipo_pagamento, forma_pagamento FROM condicoes_pagamento ';

    Result.Open;
  except on E:Exception do
    begin
      Result.Free;
      raise;
    end;

  end;

end;

function TCondicaoPagamentoRepository.PesquisarPorId( AId: Integer): TZQuery;
begin
  try
    Result := NovaQuery;

    Result.SQL.text := (
      ' SELECT condicao_id, descricao, tipo_pagamento, forma_pagamento  ' +
      ' FROM condicoes_pagamento ' +
      ' WHERE condicao_id = :condicao_id ');

    Result.ParamByName('condicao_id').AsInteger := AId;
    Result.Open;
  except on E:Exception do
    begin
      Result.Free;
      raise;
    end;

  end;
end;

function TCondicaoPagamentoRepository.PesquisarPorNome(ADescricao : String ): TZQuery;
var qry:TZQuery;
begin
  Result := NovaQuery;
  try
    Result.SQL.Text :=
      ' SELECT condicao_id, descricao, tipo_pagamento, forma_pagamento ' +
      ' FROM condicoes_pagamento ' +
      ' WHERE descricao like :descricao ';

    Result.ParamByName('descricao').AsString := '%' + ADescricao + '%';

    Result.Open;

  except on E:Exception do
    begin
      Result.free;
      raise;
    end;

  end;

end;

{$ENDREGION}

end.
