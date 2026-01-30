unit uCondicaoPagamentoService;

interface

uses System.SysUtils, uCondicaoPagamento, uCondicaoPagamentoRepository, ZConnection, ZDataset, Data.DB;

type
  TCondicaoPagamentoService=class

    private
      FRepository:TCondicaoPagamentoRepository;

      procedure Validar(ACondicaoPagamento:TCondicaoPagamento);

    public
      constructor Create(ARepository:TCondicaoPagamentoRepository);
      destructor Destroy; override;

      procedure Gravar(ACondicaoPagamento:TCondicaoPagamento);
      procedure Alterar(ACondicaoPagamento:TCondicaoPagamento);
      procedure Excluir(AId:Integer);

      function PesquisarPorId(AId:Integer): TCondicaoPagamento;
      function PesquisarPorNome(const ANome:String): TCondicaoPagamento;

      function Listar:TDataSet;

  end;

implementation

{ TCondicaoPagamentoService }

procedure TCondicaoPagamentoService.Alterar(
  ACondicaoPagamento: TCondicaoPagamento);
begin

end;

constructor TCondicaoPagamentoService.Create(
  ARepository: TCondicaoPagamentoRepository);
begin
 inherited Create;
 FRepository:= ARepository;
end;

destructor TCondicaoPagamentoService.Destroy;
begin
  FRepository.Free;
  inherited;
end;

procedure TCondicaoPagamentoService.Excluir(AId: Integer);
begin

end;

procedure TCondicaoPagamentoService.Gravar(
  ACondicaoPagamento: TCondicaoPagamento);
begin
  Validar(ACondicaoPagamento);
  FRepository.Gravar(ACondicaoPagamento);
end;

function TCondicaoPagamentoService.Listar: TDataSet;
begin

end;

function TCondicaoPagamentoService.PesquisarPorId(
  AId: Integer): TCondicaoPagamento;
begin

end;

function TCondicaoPagamentoService.PesquisarPorNome(
  const ANome: String): TCondicaoPagamento;
begin

end;

procedure TCondicaoPagamentoService.Validar(
  ACondicaoPagamento: TCondicaoPagamento);
begin
  if Trim(ACondicaoPagamento.nome)='' then begin
    raise Exception.Create('O nome da condição de pagamento é obrigatória');
  end;


end;

end.
