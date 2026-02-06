unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.ComCtrls, uClienteService, uPesCondicaoPagamento, uPesCliente;

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
    Panel3: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    FService: TClienteService;
    FIdCondicaoPagamento:Integer;

    procedure LimparCampos;

    function RemoverMascara(const aValue:string):string;
  public
    { Public declarations }
  end;

var
  frmCadCliente : TfrmCadCliente;
  frmPesCondicao: TfrmPesCondicaoPagamento;
  frmPesCliete  : TfrmPesCliente;

implementation

{$R *.dfm}

uses uDTMConexao, uCliente;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg(
      'Apagar o Registro: ' +#13+#13+
      'Código: ' + edCodigo.Text +#13+
      'Nome: '+ edNome.Text,
        mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
    abort;
  end;

  FService.Excluir(StrToInt( edCodigo.Text));
end;

procedure TfrmCadCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

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

  condicao_id := FIdCondicaoPagamento; //StrToIntDef( edFormaPagamento.Text,0);
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

procedure TfrmCadCliente.btnPesquisarClick(Sender: TObject);
var cliente : TCliente; idCliente:Integer;
begin
  // busca o cadastro de cliente e me retorna o id do cadastro
  frmPesCliete:= TfrmPesCliente.Create(Self);
  frmPesCliete.ShowModal;
  try
    idCliente:= frmPesCliete.id;
  finally
    frmCadCliente.Release;
  end;
  // pego o id e consulto todos os dados para peencher a tela
  cliente := TCliente.Create;
  cliente := FService.PesquisarPorId(idCliente);


  edCodigo.Text := IntToStr( cliente.cliente_id ) ;
  edNome.Text := cliente.nome;
  dtpDataNascimento.Date := cliente.data_nascimento;
  rbAtivo.Enabled:= cliente.status='ATIVO';

  medCpfCnpj.text := cliente.cpf_cnpj;

  edLimite.Text := FloatToStr( cliente.limite ) ;
  edTelefone.Text := cliente.telefone;
  edEmail.Text := cliente.email;

  edEndereco.Text := cliente.endereco;
  edBairro.Text := cliente.bairro;
  edCidade.Text := cliente.cidade;
  edEstado.Text := cliente.uf;
  edCep.Text := cliente.cep;

  edFormaPagamento.Text := cliente.condicao.descricao;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  FService := TClienteService.Create(dtmConexao.conOracle);
end;

procedure TfrmCadCliente.LimparCampos;
var i:Integer;
begin
  for i := 0 to ComponentCount -1  do
  begin
    if Components[i] is TLabeledEdit then
    begin
      TLabeledEdit(Components[i]).Text := EmptyStr end
    else if Components[i] is TEdit then begin
      TEdit(Components[i]).Text := EmptyStr;
    end
    else if Components[i] is TMaskEdit then begin
      TMaskEdit(Components[i]).Text := EmptyStr;
    end
    else if Components[i] is TDateTimePicker then begin
      TDateTimePicker(Components[i]).Date := Now;
    end
    else if Components[i] is TRadioButton then begin
      TRadioButton(Components[i]).Checked := False;
    end
    else if Components[i] is TCheckBox then begin
      TCheckBox(Components[i]).Checked:=false;
    end;
  end;
end;

procedure TfrmCadCliente.Panel3Click(Sender: TObject);
begin
  frmPesCondicao := TfrmPesCondicaoPagamento.Create(Self);
  frmPesCondicao.ShowModal;
  try
    edFormaPagamento.Text:= frmPesCondicao.descricao;
    FIdCondicaoPagamento:= frmPesCondicao.id;
  finally
    frmPesCondicao.Release;
  end;

end;

function TfrmCadCliente.RemoverMascara(const aValue: string): string;
var cValue:Char;
begin
  Result:='';

  for cValue in aValue do
      if CharInSet( cValue, ['0'..'9'] ) then     // usado pela embarcadeiro
        Result:=Result + cValue;
end;

end.
