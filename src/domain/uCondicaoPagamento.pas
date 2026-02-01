unit uCondicaoPagamento;

interface

type
  TCondicaoPagamento = class

  private
    FCondicaoId    :Integer;
    FDescricao     :String;
    FTipoPagamento :string;
    FFormaPagamento:String;

    procedure SetCondicaoId(const Value: Integer);
  public

  published
    property condicaoId:Integer    read FCondicaoId;
    property descricao:String      read FDescricao      write FDescricao;
    property tipoPagamento:string  read FTipoPagamento  write FTipoPagamento;    //0,1 0 A VISTA 1 A PRAZO
    property formaPagamento:String read FFormaPagamento write FFormaPagamento;  //forma_pagamento IN ('BOLETO', 'DINHEIRO','CARTAO','CHEQUE','DUPLICATA','ACUMULATIVO'))

    procedure DefinirId(AId:Integer);
  end;

implementation

{ TCondicaoPagamento }

procedure TCondicaoPagamento.DefinirId(AId: Integer);
begin
  FCondicaoId:=AId;
end;

procedure TCondicaoPagamento.SetCondicaoId(const Value: Integer);
begin
  FCondicaoId:=Value;
end;

end.
