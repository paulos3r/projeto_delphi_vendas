unit uCategoria;

interface

uses System.Classes,System.SysUtils,Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs, FireDAC.Comp.Client,ZConnection,ZDataset;

type
  TCategoria = class

  private
    ConexaoDB:TZConnection;

    Fcategoria_id:Integer;
    Fdescricao:String;
    function getCategoria_id: Integer;
    function getDescricao: String;

    procedure setCategoria_id(const Value: Integer);
    procedure setDescricao(const Value: String);

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;

    function Gravar:Boolean;
    function Atualizar:Boolean;
    function Inserir:Boolean;
    function Excluir:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property categoria_id:Integer read getCategoria_id write setCategoria_id;
    property descricao:String     read getDescricao    write setDescricao;


  end;

implementation

{ TCategoria }

{$REGION '___CONSTRUCTOR E DESTRUCTOR___'}
constructor TCategoria.Create(aConexao:TZConnection);
begin
 ConexaoDB:=aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$ENDREGION}

{$REGION '___GET___'}
function TCategoria.getCategoria_id: Integer;
begin

  Result :=self.Fcategoria_id;

end;

function TCategoria.getDescricao: String;
begin

  Result := self.Fdescricao;

end;
{$ENDREGION}

{$REGION '___SET___'}
procedure TCategoria.setCategoria_id(const Value: Integer);
begin

  Self.Fcategoria_id := Value;

end;

procedure TCategoria.setDescricao(const Value: String);
begin

  Self.Fdescricao := Value;

end;
{$ENDREGION}

{$REGION '___FUNCIONALIDADES___'}
function TCategoria.Atualizar: Boolean;
var qry:TZQuery;
begin
  try
    qry:= TZQuery.Create(nil);
    qry.Connection:= ConexaoDB;

    qry.SQL.Clear;
    qry.SQL.Add(
    ' UPDATE categorias ' +
    ' SET descricao= :descricao ' +
    ' WHERE categoria_id= :categoria_id '
    );

    qry.ParamByName('categoria_id').AsInteger := Self.Fcategoria_id;
    qry.ParamByName('descricao').AsString     := Self.Fdescricao;

    try
      qry.ExecSQL;
      Result:=true;
    except
      Result:=false;
    end;

  finally

    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;

end;

function TCategoria.Excluir: Boolean;
var qry:TZQuery;
begin
  if MessageDlg(
      'Apagar o Registro: ' +#13+#13+
      'Código: ' + IntToStr(Fcategoria_id)+#13+
      'Descrição: '+ Fdescricao,
        mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin

    Result:=false;
    abort;

  end;


  try

    qry := TZQuery.Create(nil);
    qry.Connection:= ConexaoDB;

    qry.SQL.Clear;
    qry.SQL.Add(
    ' DELETE FROM categorias ' +
    ' WHERE categoria_id= :categoria_id '
    );
    qry.ParamByName('categoria_id').AsInteger := Self.Fcategoria_id;

    try
      qry.ExecSQL;
      Result := true;
    except
      Result:=false;
    end;

  finally
    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;

end;

function TCategoria.Gravar: Boolean;
begin
end;

function TCategoria.Inserir: Boolean;
var qry:TZQuery;
begin
  try
    qry:= TZQuery.Create(nil);
    qry.Connection:= ConexaoDB;

    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO categorias (descricao) values (:descricao)');

    qry.ParamByName('descricao').AsString     := Self.Fdescricao;

    try
      qry.ExecSQL;
      Result:=true;
    except
      Result:=false;
    end;

  finally

    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
var qry:TZQuery;
begin
  try
    qry:= TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;

    qry.SQL.Clear;

    qry.SQL.Add(
      ' SELECT categoria_id, descricao ' +
      ' FROM categorias ' +
      ' WHERE categoria_id = :categoria_id' );

    qry.ParamByName('categoria_id').AsInteger :=id;

    try
      qry.Open;

      Self.Fcategoria_id := qry.FieldByName('categoria_id').AsInteger;
      Self.Fdescricao    := qry.FieldByName('descricao').AsString;
      
      Result:=true;
    except
      Result:=false;
    end;

  finally
    if Assigned(qry) then begin
      FreeAndNil(qry);
    end;

  end;
end;
{$ENDREGION}

end.
