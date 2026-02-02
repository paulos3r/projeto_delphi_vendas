object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de cliente'
  ClientHeight = 582
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlGrupoBotao: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 582
    Align = alLeft
    TabOrder = 0
    object btnPesquisar: TBitBtn
      Left = 2
      Top = 259
      Width = 127
      Height = 25
      Align = alCustom
      Caption = 'Pesquisar'
      TabOrder = 0
    end
    object btnFechar: TBitBtn
      Left = 1
      Top = 556
      Width = 127
      Height = 25
      Align = alBottom
      Caption = '&Fechar'
      TabOrder = 1
    end
    object btnGravar: TBitBtn
      Left = 1
      Top = 1
      Width = 127
      Height = 25
      Align = alTop
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = btnGravarClick
    end
    object btnExcluir: TBitBtn
      Left = 1
      Top = 51
      Width = 127
      Height = 25
      Align = alTop
      Caption = 'Excluir'
      TabOrder = 3
    end
    object btnCancelar: TBitBtn
      Left = 1
      Top = 26
      Width = 127
      Height = 25
      Align = alTop
      Caption = 'Cancelar'
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 129
    Top = 0
    Width = 697
    Height = 582
    Align = alClient
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 695
      Height = 112
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 230
        Top = 60
        Width = 108
        Height = 15
        Caption = 'Data De Nascimento'
      end
      object Label2: TLabel
        Left = 18
        Top = 60
        Width = 21
        Height = 15
        Caption = 'CPF'
      end
      object edCodigo: TLabeledEdit
        Left = 13
        Top = 24
        Width = 68
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        TabOrder = 0
        Text = ''
      end
      object edNome: TLabeledEdit
        Left = 96
        Top = 24
        Width = 409
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        TabOrder = 1
        Text = ''
      end
      object rgStatus: TRadioGroup
        Left = 528
        Top = 25
        Width = 145
        Height = 81
        Caption = 'Status'
        TabOrder = 2
      end
      object rbAtivo: TRadioButton
        Left = 568
        Top = 50
        Width = 65
        Height = 21
        Caption = 'ATIVO'
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object rbInativo: TRadioButton
        Left = 568
        Top = 77
        Width = 65
        Height = 17
        Caption = 'INATIVO'
        TabOrder = 4
      end
      object dtpDataNascimento: TDateTimePicker
        Left = 225
        Top = 80
        Width = 186
        Height = 23
        Date = 46054.000000000000000000
        Time = 0.857674004626460400
        TabOrder = 5
      end
      object medCpfCnpj: TMaskEdit
        Left = 13
        Top = 80
        Width = 120
        Height = 23
        EditMask = '999.999.999-99;1;_'
        MaxLength = 14
        TabOrder = 6
        Text = '   .   .   -  '
      end
    end
    object pgDadosPrincipais: TPageControl
      Left = 1
      Top = 113
      Width = 695
      Height = 468
      ActivePage = pgPrincipal
      Align = alClient
      TabOrder = 1
      object pgPrincipal: TTabSheet
        Caption = 'Principal'
        object gbDadosDoCrediario: TGroupBox
          Left = 9
          Top = 3
          Width = 664
          Height = 102
          Caption = '   Dados do Credi'#225'rio    '
          TabOrder = 0
          object edLimite: TLabeledEdit
            Left = 245
            Top = 48
            Width = 161
            Height = 23
            EditLabel.Width = 33
            EditLabel.Height = 15
            EditLabel.Caption = 'Limite'
            TabOrder = 0
            Text = ''
          end
          object edFormaPagamento: TLabeledEdit
            Left = 22
            Top = 48
            Width = 162
            Height = 23
            EditLabel.Width = 114
            EditLabel.Height = 15
            EditLabel.Caption = 'Forma de Pagamento'
            TabOrder = 1
            Text = ''
          end
        end
        object gbDadosDeContato: TGroupBox
          Left = 9
          Top = 128
          Width = 662
          Height = 137
          Caption = '    Dados de Contatos   '
          TabOrder = 1
          object edEmail: TLabeledEdit
            Left = 22
            Top = 50
            Width = 358
            Height = 23
            EditLabel.Width = 29
            EditLabel.Height = 15
            EditLabel.Caption = 'Email'
            TabOrder = 0
            Text = ''
          end
          object edTelefone: TLabeledEdit
            Left = 408
            Top = 50
            Width = 233
            Height = 23
            EditLabel.Width = 44
            EditLabel.Height = 15
            EditLabel.Caption = 'Telefone'
            TabOrder = 1
            Text = ''
          end
        end
      end
      object pgEndereco: TTabSheet
        Caption = 'Endere'#231'o'
        ImageIndex = 1
        object edEndereco: TLabeledEdit
          Left = 3
          Top = 40
          Width = 382
          Height = 23
          EditLabel.Width = 49
          EditLabel.Height = 15
          EditLabel.Caption = 'Endere'#231'o'
          TabOrder = 0
          Text = ''
        end
        object edBairro: TLabeledEdit
          Left = 409
          Top = 40
          Width = 216
          Height = 23
          EditLabel.Width = 31
          EditLabel.Height = 15
          EditLabel.Caption = 'Bairro'
          TabOrder = 1
          Text = ''
        end
        object edCidade: TLabeledEdit
          Left = 3
          Top = 96
          Width = 216
          Height = 23
          EditLabel.Width = 37
          EditLabel.Height = 15
          EditLabel.Caption = 'Cidade'
          TabOrder = 2
          Text = ''
        end
        object edEstado: TLabeledEdit
          Left = 256
          Top = 96
          Width = 113
          Height = 23
          EditLabel.Width = 35
          EditLabel.Height = 15
          EditLabel.Caption = 'Estado'
          TabOrder = 3
          Text = ''
        end
        object edCep: TLabeledEdit
          Left = 409
          Top = 96
          Width = 216
          Height = 23
          EditLabel.Width = 19
          EditLabel.Height = 15
          EditLabel.Caption = 'cep'
          TabOrder = 4
          Text = ''
        end
      end
    end
  end
end
