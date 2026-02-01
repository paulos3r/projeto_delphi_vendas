unit uCategoriaRepository;

interface

uses uCategoria,ZConnection,ZDataset, System.SysUtils;

type
  TCategoriaRepository = class

  public
    constructor Create(AConexao:TZConnection);
    destructor Destroy; override;

    procedure Inserir(ACategoria:TCategoria);
    procedure Alterar(ACategoria:TCategoria);
    procedure Excluir(AId:Integer);

    function BuscarPorId(AId : Integer):TCategoria;
    function BuscarPorDescricao(ADescricao:String):TCategoria;
    function Listar:TZQuery;

  private
    oCategoria:TCategoria;
    dbConexao:TZConnection;

  end;

implementation

{ TCategoriaRepository }

{$REGION '___CONSTRUCTOR E DESTROY___'}
constructor TCategoriaRepository.Create(AConexao: TZConnection);
begin
  dbConexao:=AConexao;
end;

destructor TCategoriaRepository.Destroy;
begin

  if Assigned(dbConexao) then begin
    FreeAndNil(dbConexao);
  end;

  inherited;
end;
{$ENDREGION}

{$REGION '___FUNCIONALIDADES___'}

procedure TCategoriaRepository.Alterar(ACategoria: TCategoria);
var qry:TZQuery;
begin
  try
    qry:= TZQuery.Create(nil);
    qry.Connection:= dbConexao;

    qry.SQL.Add(
    ' UPDATE categorias ' +
    ' SET descricao= :descricao ' +
    ' WHERE categoria_id= :categoria_id '
    );

    qry.ParamByName('categoria_id').AsInteger := ACategoria.categoria_id;
    qry.ParamByName('descricao').AsString     := ACategoria.descricao;

    try
      qry.ExecSQL;
    except
      qry.Free;
    end;

  finally

    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;

end;

procedure TCategoriaRepository.Excluir(AId:Integer);
var qry:TZQuery;
begin

  try

    qry := TZQuery.Create(nil);
    qry.Connection:= dbConexao;

    qry.SQL.Clear;
    qry.SQL.Add(
    ' DELETE FROM categorias ' +
    ' WHERE categoria_id= :categoria_id '
    );
    qry.ParamByName('categoria_id').AsInteger := AId;

    try
      qry.ExecSQL;
    except
      qry.Free;
    end;

  finally
    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;

end;

procedure TCategoriaRepository.Inserir(ACategoria: TCategoria);
var qry:TZQuery;
begin
  try
    qry:= TZQuery.Create(nil);
    qry.Connection:= dbConexao;


    qry.SQL.Add('INSERT INTO categorias (descricao) values (:descricao)');

    qry.ParamByName('descricao').AsString     := ACategoria.descricao;
    qry.ExecSQL;

  finally

    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;
end;

function TCategoriaRepository.BuscarPorDescricao(ADescricao: String): TCategoria;
var qry:TZQuery;
begin
  try
    qry:= TZQuery.Create(nil);
    qry.Connection := dbConexao;

    qry.SQL.Add(
    ' SELECT categoria_id, descricao ' +
    ' FROM categorias ' +
    ' WHERE descricao= :descricao '
    );

    qry.ParamByName('descricao').AsString := ADescricao;
    qry.Open;

    if not qry.IsEmpty then begin
      Result := TCategoria.Create;
      Result.categoria_id := qry.FieldByName('categoria_id').AsInteger;
      Result.descricao := qry.FieldByName('descricao').AsString;
    end;

  finally
    qry.Free;
  end;

end;

function TCategoriaRepository.Listar: TZQuery;
begin

end;

function TCategoriaRepository.BuscarPorId(AId: Integer): TCategoria;
var qry:TZQuery;
begin
  try
    qry:= TZQuery.Create(nil);
    qry.Connection:=dbConexao;

    qry.SQL.Clear;

    qry.SQL.Add(
      ' SELECT categoria_id, descricao ' +
      ' FROM categorias ' +
      ' WHERE categoria_id = :categoria_id' );

    qry.ParamByName('categoria_id').AsInteger:=AId;
    qry.Open;

    if not qry.IsEmpty then begin

      Result:= TCategoria.Create;
      Result.categoria_id:= qry.FieldByName('categoria_id').AsInteger;
      Result.descricao:=  qry.FieldByName('descricao').AsString;
    end;

  finally
    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;
end;
{$ENDREGION}

end.
