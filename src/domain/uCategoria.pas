unit uCategoria;

interface

uses System.Classes,System.SysUtils,Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs;

type
  TCategoria = class

  private

    Fcategoria_id:Integer;
    Fdescricao:String;
    function getCategoria_id: Integer;
    function getDescricao: String;

    procedure setCategoria_id(const Value: Integer);
    procedure setDescricao(const Value: String);

  public

  published
    property categoria_id:Integer read getCategoria_id write setCategoria_id;
    property descricao:String     read getDescricao    write setDescricao;

  end;

implementation

{ TCategoria }

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

end.
