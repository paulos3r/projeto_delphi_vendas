unit uCategoriaRepository;

interface

uses uCategoria;

type
  TCategoriaRepository = class

  public

    procedure Inserir(ACategoria:TCategoria);
    procedure Alterar(ACategoria:TCategoria);
    procedure Excluir(ACategoria:TCategoria);

    function BuscarPorId(AId : Integer):TCategoria;

  private
    oCategoria:TCategoria;

  end;

implementation

{ TCategoriaRepository }

procedure TCategoriaRepository.Alterar(ACategoria: TCategoria);
begin

end;

function TCategoriaRepository.BuscarPorId(AId: Integer): TCategoria;
begin

end;

procedure TCategoriaRepository.Excluir(ACategoria: TCategoria);
begin

end;

procedure TCategoriaRepository.Inserir(ACategoria: TCategoria);
begin

end;

end.
