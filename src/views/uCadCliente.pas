unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls, uClienteService;

type
  TfrmCadCliente = class(TForm)
    pnlGrupoBotao: TPanel;
    btnPesquisar: TBitBtn;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    edCodigo: TLabeledEdit;
    edNome: TLabeledEdit;
    pgDadosPrincipais: TPageControl;
    pgPrincipal: TTabSheet;
    pgEndereco: TTabSheet;
    edFormaPagamento: TLabeledEdit;
    edEndereco: TLabeledEdit;
    edBairro: TLabeledEdit;
    edCidade: TLabeledEdit;
    edEstado: TLabeledEdit;
    edCep: TLabeledEdit;
    edLimite: TLabeledEdit;
    edEmail: TLabeledEdit;
    gbDadosDoCrediario: TGroupBox;
    gbDadosDeContato: TGroupBox;
    edTelefone: TLabeledEdit;
    rgStatus: TRadioGroup;
    rbAtivo: TRadioButton;
    rbInativo: TRadioButton;
    Label1: TLabel;
    dtpDataNascimento: TDateTimePicker;
    medCpfCnpj: TMaskEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    FService: TClienteService;

    function RemoverMascara(const aValue:string):string;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses uDTMConexao;

procedure TfrmCadCliente.btnGravarClick(Sender: TObject);
var nome:string;
  data_Nascimento:TDate;
  status:String;
  cpf_cnpj:string;

  condicao_id:Integer;
  limite:Double;
  telefone:string;
  email:string;

  endereco:string;
  bairro:string;
  cidade:string;
  uf:string;
  cep:string;

  FData_cadastro: TDateTime;
begin

  nome := edNome.Text;
  data_Nascimento:= dtpDataNascimento.Date;
  if rbAtivo.Enabled=true then status:='ATIVO' else status:='INATIVO';

  cpf_cnpj := RemoverMascara( medCpfCnpj.text );

  condicao_id := StrToIntDef( edFormaPagamento.Text,0);
  limite := StrToIntDef( edLimite.Text,0);
  telefone:= edTelefone.Text;
  email:= edEmail.Text;

  endereco := edEndereco.Text;
  bairro:= edBairro.Text;
  cidade:= edCidade.Text;
  uf := edEstado.Text;
  cep:= edCep.Text;


  FService.Gravar(nome,status,cpf_cnpj,telefone,email,endereco,bairro,cidade,uf,cep,limite,data_Nascimento,Now,condicao_id);

end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  FService := TClienteService.Create(dtmConexao.conOracle);
end;

function TfrmCadCliente.RemoverMascara(const aValue: string): string;
var cValue:Char;
begin
  Result:='';

  for cValue in aValue do
      if cValue in ['0'..'9'] then
        Result:=Result + cValue;
end;

end.
