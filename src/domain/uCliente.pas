unit uCliente;

interface

uses uCondicaoPagamento;
type
  TCliente = class
    private
      FCliente_id:Integer;
      FNome:string;
      FCpf_cnpj:string;
      FTelefone:string;
      FEmail:string;
      FData_cadastro: TDateTime;
      FCondicao_id:TCondicaoPagamento;

    published
      property cliente_id:Integer  read FCliente_id;
      property nome:string         read FNome         write FNome;
      property cpf_cnpj:string     read FCpf_cnpj     write FCpf_cnpj;
      property email:string        read FEmail        write FEmail;
      property data_cadastro:TDateTime         read FData_cadastro  write FData_cadastro;
      property condicao_id:TCondicaoPagamento  read FCondicao_id    write FCondicao_id;
  end;

implementation

end.
