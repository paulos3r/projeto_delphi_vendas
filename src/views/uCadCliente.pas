unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls;

type
  TfrmCadCliente = class(TForm)
    pnlGrupoBotao: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    edCodigo: TLabeledEdit;
    edNome: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    pgDadosPrincipais: TPageControl;
    pgPrincipal: TTabSheet;
    pgEndereco: TTabSheet;
    edFormaPagamento: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    edLimite: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LabeledEdit3: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    rbAtivo: TRadioButton;
    rbInativo: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

end.
