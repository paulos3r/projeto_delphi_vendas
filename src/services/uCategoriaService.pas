unit uCategoriaService;

interface

uses uCategoriaRepository, uCategoria, ZConnection,ZDataset, System.SysUtils, Vcl.Dialogs, Vcl.Controls;

type
  TCategoriaService=class

  public
    constructor Create(AConn:TZConnection);

    procedure Salvar(ADescricao:String);
    procedure Excluir(AId:Integer; ADescricao:String);
    procedure Alterar(AId:Integer; ADescricao:String);

    function Listar: TZQuery;
    function BuscarPorId(AId:Integer):TCategoria;
    function BuscarPorDescricao(ADescricao:String):TCategoria;

  private
    FRepository:TCategoriaRepository;
    oCategoria:TCategoria;

  end;


implementation

{ TCategoriaService }

{$REGION '___constructor___'}

function TCategoriaService.BuscarPorDescricao(ADescricao: String): TCategoria;
begin

  if ADescricao=EmptyStr then begin
    raise Exception.Create('Descrição não pode ser nulo ou vazio');
  end;

  Result:=FRepository.BuscarPorDescricao(ADescricao);
end;

function TCategoriaService.BuscarPorId(AId: Integer):TCategoria;
var categoria: TCategoria;
begin
  Result := FRepository.BuscarPorId(AId);
end;

constructor TCategoriaService.Create(AConn:TZConnection);
begin
  FRepository:=TCategoriaRepository.Create(AConn);
end;

{$ENDREGION}

procedure TCategoriaService.Salvar(ADescricao:String);
var categoria: TCategoria;
begin
  if Trim(ADescricao)=EmptyStr then begin
    raise Exception.Create('Descricao Obrigatória');
  end;

  categoria.descricao:=ADescricao;

  FRepository.Inserir(categoria);

end;


procedure TCategoriaService.Excluir(AId:Integer; ADescricao:String);
var ACategoria: TCategoria;
begin
  if MessageDlg(
      'Apagar o Registro: ' +#13+#13+
      'Código: ' + IntToStr(AId)+#13+
      'Descrição: '+ ADescricao,
        mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
    abort;
  end;

  ACategoria.categoria_id := AId;

  FRepository.Excluir(AId);

end;

procedure TCategoriaService.Alterar(AId:Integer; ADescricao:String);
var categoria: TCategoria;
begin
  if Trim(ADescricao)=EmptyStr then begin
    raise Exception.Create('Descricao Obrigatória');
  end;

  categoria.categoria_id := AId;
  categoria.descricao    := ADescricao;

  FRepository.Alterar(categoria)
end;

function TCategoriaService.Listar: TZQuery;
begin
end;

end.
