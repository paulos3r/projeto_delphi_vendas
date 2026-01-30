unit uCadCondicaoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,uCondicaoPagamentoRepository,
  Vcl.Mask;

type
  TfrmCadCondicaoPagamento = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label3: TLabel;
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    Repository:TCondicaoPagamentoRepository;
  public
    { Public declarations }
  end;

var
  frmCadCondicaoPagamento: TfrmCadCondicaoPagamento;

implementation

uses uPesCondicaoPagamento;

{$R *.dfm}

procedure TfrmCadCondicaoPagamento.BitBtn5Click(Sender: TObject);
begin
  frmPesCondicaoPagamento:=  TfrmPesCondicaoPagamento.Create(Self);
  frmPesCondicaoPagamento.ShowModal;
  frmPesCondicaoPagamento.Release;

end;

end.
