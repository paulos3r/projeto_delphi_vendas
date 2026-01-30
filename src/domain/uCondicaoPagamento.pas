unit uCondicaoPagamento;

interface

type
  TCondicaoPagamento = class

  private
    FCondicaoId    :Integer;
    FNome          :String;
    FTipoPagamento :String;
    FFormaPagamento:String;

  public

  published
    property condicaoId:Integer    read FCondicaoId;
    property nome:String           read FNome           write FNome;
    property tipoPagamento:String  read FTipoPagamento  write FTipoPagamento;
    property formaPagamento:String read FFormaPagamento write FFormaPagamento;

  end;

implementation
end.
