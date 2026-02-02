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
      procedure Alterar(ACliente:TCliente);
      procedure Excluir(AId:Integer);

      function PesquisarPorId(AId:Integer): TZQuery;
      function PesquisarPorNome(const cNome:String): TZQuery;
      function PesquisarPorCpfCnpj(const cCnpj_cpf:String): TZQuery;

      function Listar:TZQuery;

  end;

implementation

{ TClienteRepository }


{$REGION '___ CREATE E DESTROY ___'}

constructor TClienteRepository.Create(AConn: TZConnection);
begin
  dbConexao:=AConn;
end;

destructor TClienteRepository.Destroy;
begin

  inherited;
end;

{$ENDREGION}

{$REGION '___ FUNCIONALIDADES ____'}

function TClienteRepository.NovaQuery: TZQuery;
begin
  try
    Result:= TZQuery.Create(nil);
    Result.Connection:=dbConexao;
  except on E:Exception do
    begin
      raise Exception.Create('Error Message');
    end;

  end;
end;

procedure TClienteRepository.Alterar(ACliente: TCliente);
var qry:TZQuery;
begin
  qry:= NovaQuery;

  try

    qry.SQL.Add(
      ' update CLIENTES ' +
      ' set  NOME= :NOME, ' +
      ' DATA_NASCIMENTO= :NASCIMENTO, ' +
      ' STATUS= :STATUS, ' +
      ' CPF_CNPJ= :CGC, ' +

      ' TELEFONE= :TELEFONE, ' +
      ' EMAIL= :EMAIL, ' +
      ' DATA_CADASTRO= :CADASTRO, ' +
      ' CONDICAO_ID= :CONDICAO, ' +
      ' LIMITE= :LIMITE, ' +

      ' ENDERECO= :ENDERECO, ' +
      ' BAIRRO= :BAIRRO, ' +
      ' CIDADE= :CIDADE, ' +
      ' UF= :UF, ' +
      ' CEP= :CEP ' +
      ' where CLEINTE_ID= :ID'
    );

    qry.ParamByName('NOME').AsString := ACliente.nome;
    qry.ParamByName('NASCIMENTO').AsDate := ACliente.data_nascimento;
    qry.ParamByName('STATUS').AsString   := ACliente.status;
    qry.ParamByName('CGC').AsString      := ACliente.cpf_cnpj;

    qry.ParamByName('TELEFONE').AsString := ACliente.telefone;
    qry.ParamByName('EMAIL').AsString    := ACliente.email;
    qry.ParamByName('CADASTRO').AsDateTime := ACliente.data_cadastro;
    qry.ParamByName('CONDICAO').AsInteger  := ACliente.condicao_id;
    qry.ParamByName('LIMITE').AsDouble     := ACliente.limite;

    qry.ParamByName('ENDERECO').AsString   := ACliente.endereco;
    qry.ParamByName('BAIRRO').AsString     := ACliente.bairro;
    qry.ParamByName('CIDADE').AsString     := ACliente.cidade;
    qry.ParamByName('UF').AsString         := ACliente.uf;
    qry.ParamByName('CEP').AsString        := ACliente.cep;


    qry.ParamByName('ID').AsInteger := ACliente.cliente_id;

    qry.ExecSQL;

  finally
    qry.Free;
  end;
end;

procedure TClienteRepository.Excluir(AId: Integer);
var qry:TZQuery;
begin
  qry:= NovaQuery;

  try

    qry.SQL.Add( ' delete from CLIENTES where CLIENTE_ID= :ID ' );

    qry.ParamByName('ID').AsInteger := AId;

    qry.ExecSQL;

  finally
    qry.Free;
  end;
end;

procedure TClienteRepository.Gravar(ACliente: TCliente);
var qry:TZQuery;
begin
  qry:= NovaQuery;

  try

    qry.SQL.Add(
      ' insert into CLIENTES ( NOME,DATA_NASCIMENTO,STATUS,CPF_CNPJ,TELEFONE,EMAIL,DATA_CADASTRO,CONDICAO_ID,LIMITE,ENDERECO,BAIRRO,CIDADE,UF,CEP)' +
      ' values ( :NOME, :NASCIMENTO, :STATUS, :CGC, :TELEFONE, :EMAIL, :CADASTRO, :CONDICAO, :LIMITE, :ENDERECO, :BAIRRO, :CIDADE, :UF, :CEP ) '
    );

    qry.ParamByName('NOME').AsString := ACliente.nome;
    qry.ParamByName('NASCIMENTO').AsDate := ACliente.data_nascimento;
    qry.ParamByName('STATUS').AsString   := ACliente.status;
    qry.ParamByName('CGC').AsString      := ACliente.cpf_cnpj;

    qry.ParamByName('TELEFONE').AsString := ACliente.telefone;
    qry.ParamByName('EMAIL').AsString    := ACliente.email;
    qry.ParamByName('CADASTRO').AsDateTime := ACliente.data_cadastro;
    qry.ParamByName('CONDICAO').AsInteger  := ACliente.condicao_id;
    qry.ParamByName('LIMITE').AsDouble     := ACliente.limite;

    qry.ParamByName('ENDERECO').AsString   := ACliente.endereco;
    qry.ParamByName('BAIRRO').AsString     := ACliente.bairro;
    qry.ParamByName('CIDADE').AsString     := ACliente.cidade;
    qry.ParamByName('UF').AsString         := ACliente.uf;
    qry.ParamByName('CEP').AsString        := ACliente.cep;

    qry.ExecSQL;

  finally
    qry.Free;
  end;
end;

function TClienteRepository.Listar: TZQuery;
begin
  Result:= NovaQuery;
  try
    Result.SQL.Text :=
      ' select NOME,DATA_NASCIMENTO,STATUS,CPF_CNPJ,TELEFONE,EMAIL,DATA_CADASTRO,CONDICAO_ID,LIMITE,ENDERECO,BAIRRO,CIDADE,UF,CEP ' +
      ' from CLIENTES';
    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

function TClienteRepository.PesquisarPorCpfCnpj( const cCnpj_cpf: String ): TZQuery;
begin
  Result:= NovaQuery;
  try
    Result.SQL.Text :=
      ' select NOME,DATA_NASCIMENTO,STATUS,CPF_CNPJ,TELEFONE,EMAIL,DATA_CADASTRO,CONDICAO_ID,LIMITE,ENDERECO,BAIRRO,CIDADE,UF,CEP ' +
      ' from CLIENTES ' +
      ' where CPF_CNPJ= :CGC ';

    Result.ParamByName('CGC').AsString := cCnpj_cpf;

    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

function TClienteRepository.PesquisarPorId(AId: Integer): TZQuery;
begin
  Result:= NovaQuery;
  try
    Result.SQL.Text :=
      ' select NOME,DATA_NASCIMENTO,STATUS,CPF_CNPJ,TELEFONE,EMAIL,DATA_CADASTRO,CONDICAO_ID,LIMITE,ENDERECO,BAIRRO,CIDADE,UF,CEP ' +
      ' from CLIENTES ' +
      ' where CLIENTE_ID= :ID';

    Result.ParamByName('ID').AsInteger := AId;

    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

function TClienteRepository.PesquisarPorNome(const cNome: String): TZQuery;
begin
  Result:= NovaQuery;
  try
    Result.SQL.Text :=
      ' select NOME,DATA_NASCIMENTO,STATUS,CPF_CNPJ,TELEFONE,EMAIL,DATA_CADASTRO,CONDICAO_ID,LIMITE,ENDERECO,BAIRRO,CIDADE,UF,CEP ' +
      ' from CLIENTES ' +
      ' where NOME LIKE = :NOME ';
    Result.ParamByName('NOME').AsString := '''%' + cNome + '%''';
    Result.Open;
  except
    Result.Free;
    raise;
  end;
end;

{$ENDREGION}


end.
