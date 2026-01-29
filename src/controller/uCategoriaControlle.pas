unit uCategoriaControlle;

interface

uses uCategoria, ZConnection;

type
  TCategoriaControlle = class

  private

  public

    constructor Create(AConn:TZConnection);

    procedure Inserir(AId:Integer; ADescricao:String);
    procedure Alterar(AId:Integer; ADescricao:String);
    procedure Excluir(AId:Integer; ADescricao:String);

    function BuscarPorId(AId : Integer):TCategoria;
    function Listar:String;

  end;

implementation

{ TCategoriaController }

procedure TCategoriaController.Alterar(AId: Integer; ADescricao: String);
begin

end;

function TCategoriaController.BuscarPorId(AId: Integer): TCategoria;
begin

end;

constructor TCategoriaController.Create(AConn: TZConnection);
begin

end;

procedure TCategoriaController.Excluir(AId: Integer; ADescricao: String);
begin

end;

procedure TCategoriaController.Inserir(AId: Integer; ADescricao: String);
begin

end;

function TCategoriaController.Listar: String;
begin

end;

end.
