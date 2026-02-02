unit uClienteService;

interface

uses System.SysUtils,uCliente, uClienteRepository, ZConnection, data.DB;

type
  TClienteService = class
    private
      FRepository:TClienteRepository;

      procedure Validar(ANome, AStatus, ACpf_cnpj:string; ALimite: Double; ACondicao_id: Integer);

    public
      constructor Create(AConn: TZConnection);
      destructor Destroy; override;

      procedure Gravar(
        ANome,AStatus,ACpf_cnpj,ATelefone,AEmail,AEndereco,ABairro,ACidade,AUf,ACep:string;

        ALimite:Double;
        AData_Nascimento:TDate;
        AData_cadastro: TDateTime;

        ACondicao_id:Integer
      );
      procedure Alterar(
        CId:Integer;
        ANome,AStatus,ACpf_cnpj,ATelefone,AEmail,AEndereco,ABairro,ACidade,AUf,ACep:string;

        ALimite:Double;
        AData_Nascimento:TDate;
        AData_cadastro: TDateTime;

        ACondicao_id:Integer
      );
      procedure Excluir(const CId:Integer);

      function PesquisarPorId(const CId:Integer): TDataSet;
      function PesquisarPorCpfCnpj(const ACpfCnpj:String): TDataSet;
      function PesquisarPorNome(const ANome:String): TDataSet;

      function Listar:TDataSet;
  end;
implementation

{ TCliente }

{$REGION 'MyRegion'}
constructor TClienteService.Create(AConn: TZConnection);
begin
  FRepository := TClienteRepository.Create(AConn);
end;

destructor TClienteService.Destroy;
begin
  FreeAndNil(FRepository);
  inherited;
end;
{$ENDREGION}


procedure TClienteService.Alterar(CId: Integer; ANome, AStatus, ACpf_cnpj, ATelefone,
  AEmail, AEndereco, ABairro, ACidade, AUf, ACep: string; ALimite: Double;
  AData_Nascimento: TDate; AData_cadastro: TDateTime; ACondicao_id: Integer);
var
  cliente : TCliente;
begin
  cliente := TCliente.Create;

  Validar(ANome,AStatus,ACpf_cnpj,ALimite,ACondicao_id);

  cliente.DefinirId( ACondicao_id );
  cliente.data_nascimento := AData_Nascimento;
  cliente.status   := AStatus;
  cliente.cpf_cnpj := ACpf_cnpj;

  cliente.limite := ALimite;
  cliente.telefone := ATelefone;
  cliente.email    := AEmail;
  cliente.data_cadastro := AData_cadastro;

  cliente.endereco := AEndereco;
  cliente.bairro   := ABairro;
  cliente.cidade  := ACidade;
  cliente.uf      := AUf;
  cliente.cep     := ACep;

  cliente.condicao_id:= ACondicao_id;

  FRepository.Gravar(cliente);

end;

procedure TClienteService.Excluir(const CId: Integer);
begin

end;

procedure TClienteService.Gravar(ANome, AStatus, ACpf_cnpj, ATelefone, AEmail,
  AEndereco, ABairro, ACidade, AUf, ACep: string; ALimite: Double;
  AData_Nascimento: TDate; AData_cadastro: TDateTime; ACondicao_id: Integer);
var
  cliente : TCliente;
begin
  cliente := TCliente.Create;

  Validar(ANome,AStatus,ACpf_cnpj,ALimite,ACondicao_id);

  //cliente.DefinirId( ACondicao_id );
  cliente.nome := ANome;
  cliente.data_nascimento := AData_Nascimento;
  cliente.status   := AStatus;
  cliente.cpf_cnpj := ACpf_cnpj;

  cliente.limite := ALimite;
  cliente.telefone := ATelefone;
  cliente.email    := AEmail;
  cliente.data_cadastro := AData_cadastro;

  cliente.endereco := AEndereco;
  cliente.bairro   := ABairro;
  cliente.cidade  := ACidade;
  cliente.uf      := AUf;
  cliente.cep     := ACep;

  cliente.condicao_id:= ACondicao_id;

  FRepository.Gravar(cliente);
end;

function TClienteService.Listar: TDataSet;
begin

end;

function TClienteService.PesquisarPorCpfCnpj(const ACpfCnpj: String): TDataSet;
begin

end;

function TClienteService.PesquisarPorId(const CId: Integer): TDataSet;
begin

end;

function TClienteService.PesquisarPorNome(const ANome: String): TDataSet;
begin

end;

procedure TClienteService.Validar(ANome, AStatus, ACpf_cnpj:string; ALimite: Double; ACondicao_id: Integer);
begin
  //verificar se os campos estão em branco
  if ANome= EmptyStr then raise Exception.Create('Error Message');
  if AStatus= EmptyStr then raise Exception.Create('Error Message');
  if ACpf_cnpj= EmptyStr then raise Exception.Create('Error Message');
  if ALimite<0 then raise Exception.Create('Error Message');
  if ACondicao_id<0 then raise Exception.Create('Error Message');

  //regra de entidade
  if not ACpf_cnpj.Length in [11,13]  then raise Exception.Create('Error Message');
end;

end.
