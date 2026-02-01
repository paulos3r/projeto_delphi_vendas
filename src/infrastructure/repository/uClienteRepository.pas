unit uClienteRepository;

interface

uses System.SysUtils, uCliente, uCondicaoPagamentoRepository, ZConnection, ZDataset, Data.DB;

type
  TClienteRepository=class

    private
      dbConexao:TZConnection;

      function NovaQuery:TZQuery;

    public
      constructor Create(AConn: TZConnection);
      destructor Destroy; override;

      procedure Gravar(ACliente:TCliente);
      procedure Alterar(ACondicaoPagamento:TCliente);
      procedure Excluir(AId:Integer);

      function PesquisarPorId(AId:Integer): TCliente;
      function PesquisarPorNome(const cNome:String): TCliente;
      function PesquisarPorCpfCnpj(const cCnpj_cpf:String): TCliente;

      function Listar:TDataSet;

  end;

implementation

{ TClienteRepository }

procedure TClienteRepository.Alterar(ACondicaoPagamento: TCliente);
begin

end;

constructor TClienteRepository.Create(AConn: TZConnection);
begin

end;

destructor TClienteRepository.Destroy;
begin

  inherited;
end;

procedure TClienteRepository.Excluir(AId: Integer);
begin

end;

procedure TClienteRepository.Gravar(ACliente: TCliente);
begin

end;

function TClienteRepository.Listar: TDataSet;
begin

end;

function TClienteRepository.NovaQuery: TZQuery;
begin

end;

function TClienteRepository.PesquisarPorCpfCnpj(
  const cCnpj_cpf: String): TCliente;
begin

end;

function TClienteRepository.PesquisarPorId(AId: Integer): TCliente;
begin

end;

function TClienteRepository.PesquisarPorNome(const cNome: String): TCliente;
begin

end;

end.
