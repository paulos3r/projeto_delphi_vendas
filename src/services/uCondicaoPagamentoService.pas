unit uCondicaoPagamentoService;

interface

uses System.SysUtils, uCondicaoPagamento, uCondicaoPagamentoRepository, ZConnection, Data.DB;

type
  TCondicaoPagamentoService=class

    private
      FRepository:TCondicaoPagamentoRepository;

      procedure Validar( ADescricao, ATipo_pagamento, AForma_pagamento:String );

    public
      constructor Create(AConn: TZConnection);
      destructor Destroy; override;

      procedure Gravar(ADescricao,ATipo_pagamento, AForma_pagamento:String );
      procedure Alterar(const CId:Integer; ADescricao,ATipo_pagamento, AForma_pagamento:String );
      procedure Excluir(const CId:Integer);

      function PesquisarPorId(const CId:Integer): TDataSet;
      function PesquisarPorNome(const ADescricao:String): TDataSet;

      function Listar:TDataSet;

  end;

implementation

{ TCondicaoPagamentoService }


constructor TCondicaoPagamentoService.Create(AConn:TZConnection);
begin
 inherited Create;

 FRepository := TCondicaoPagamentoRepository.Create(AConn);

end;

destructor TCondicaoPagamentoService.Destroy;
begin
  FreeAndNil(FRepository);
  inherited;
end;

procedure TCondicaoPagamentoService.Alterar(const CId:Integer; ADescricao,ATipo_pagamento, AForma_pagamento:String);
var condicao:TCondicaoPagamento;
begin
  Validar(ADescricao, ATipo_pagamento, AForma_pagamento);

  condicao := TCondicaoPagamento.Create;
  try
  condicao.DefinirId(CId);
  condicao.descricao:=ADescricao;
  condicao.tipoPagamento:=ATipo_pagamento;
  condicao.formaPagamento:=AForma_pagamento;

  FRepository.Alterar(condicao);
  finally
    condicao.Free;
  end;
end;

procedure TCondicaoPagamentoService.Excluir(const CId:Integer);
begin
  FRepository.Excluir(CId);
end;

procedure TCondicaoPagamentoService.Gravar(ADescricao,ATipo_pagamento, AForma_pagamento:String);
var condicao:TCondicaoPagamento;
begin

  Validar(ADescricao, ATipo_pagamento, AForma_pagamento);

  condicao := TCondicaoPagamento.Create;
  try

    condicao.descricao := ADescricao;
    condicao.tipoPagamento := ATipo_pagamento;
    condicao.formaPagamento := AForma_pagamento;

    FRepository.Gravar(condicao);

  finally
    condicao.Free;
  end;
end;

function TCondicaoPagamentoService.Listar: TDataSet;
begin
  Result := FRepository.Listar;
end;

function TCondicaoPagamentoService.PesquisarPorId(const CId:Integer): TDataSet;
begin
  Result := FRepository.PesquisarPorId(CId);
end;

function TCondicaoPagamentoService.PesquisarPorNome( const ADescricao: String ): TDataSet;
begin
  Result := FRepository.PesquisarPorNome(ADescricao);
end;

procedure TCondicaoPagamentoService.Validar(ADescricao, ATipo_pagamento, AForma_pagamento:String);
var CA_PRASO, CA_VISTA:string;
begin
  CA_VISTA:='0';
  CA_PRASO:='1';

  if Trim(ADescricao)='' then begin
    raise Exception.Create('A descricao da condição de pagamento é obrigatória');
  end;

  if not (ATipo_pagamento <> CA_VISTA) and not (ATipo_pagamento <> CA_PRASO) then begin
    raise Exception.Create('O nome da tipo de pagamento é obrigatória');
  end;

  if Trim(AForma_pagamento)='' then begin
    raise Exception.Create('O nome da condição de pagamento é obrigatória');
  end;

end;

end.
