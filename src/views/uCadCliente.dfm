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
  TextHeight = 15
  object pnlGrupoBotao: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 582
    Align = alLeft
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 24
      Top = 24
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 2
      Top = 259
      Width = 127
      Height = 25
      Align = alCustom
      Caption = 'Pesquisar'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 1
      Top = 556
      Width = 127
      Height = 25
      Align = alBottom
      Caption = '&Fechar'
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 1
      Top = 1
      Width = 127
      Height = 25
      Align = alTop
      Caption = 'Gravar'
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 1
      Top = 51
      Width = 127
      Height = 25
      Align = alTop
      Caption = 'Excluir'
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      Left = 1
      Top = 26
      Width = 127
      Height = 25
      Align = alTop
      Caption = 'Cancelar'
      TabOrder = 5
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
      object LabeledEdit1: TLabeledEdit
        Left = 220
        Top = 80
        Width = 153
        Height = 23
        EditLabel.Width = 107
        EditLabel.Height = 15
        EditLabel.Caption = 'Data de Nascimento'
        TabOrder = 2
        Text = ''
      end
      object LabeledEdit2: TLabeledEdit
        Left = 13
        Top = 80
        Width = 156
        Height = 23
        EditLabel.Width = 24
        EditLabel.Height = 15
        EditLabel.Caption = 'CGC'
        TabOrder = 3
        Text = ''
      end
      object RadioGroup1: TRadioGroup
        Left = 528
        Top = 25
        Width = 145
        Height = 81
        Caption = 'Status'
        TabOrder = 4
      end
      object rbAtivo: TRadioButton
        Left = 568
        Top = 50
        Width = 65
        Height = 21
        Caption = 'ATIVO'
        Checked = True
        TabOrder = 5
        TabStop = True
      end
      object rbInativo: TRadioButton
        Left = 568
        Top = 77
        Width = 65
        Height = 17
        Caption = 'INATIVO'
        TabOrder = 6
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
        object GroupBox1: TGroupBox
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
        object GroupBox2: TGroupBox
          Left = 9
          Top = 128
          Width = 662
          Height = 137
          Caption = '    Dados de Contatos   '
          TabOrder = 1
          object LabeledEdit10: TLabeledEdit
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
          object LabeledEdit3: TLabeledEdit
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
        object LabeledEdit4: TLabeledEdit
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
        object LabeledEdit5: TLabeledEdit
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
        object LabeledEdit6: TLabeledEdit
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
        object LabeledEdit7: TLabeledEdit
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
        object LabeledEdit8: TLabeledEdit
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
