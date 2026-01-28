unit uCategoriaService;

interface

uses uCategoriaRepository, uCategoria;

type
  TCategoriaService=class

  public
    constructor Create(ARepository:TCategoriaRepository);

    procedure Salvar(ACategoria:TCategoria);
    procedure Excluir(AId: Integer);

  private
    FRepository:TCategoriaRepository;
    oCategoria:TCategoria;

  end;


implementation

{ TCategoriaService }

constructor TCategoriaService.Create(ARepository: TCategoriaRepository);
begin

end;

procedure TCategoriaService.Excluir(AId: Integer);
begin

end;

procedure TCategoriaService.Salvar(ACategoria: TCategoria);
begin

end;

end.
