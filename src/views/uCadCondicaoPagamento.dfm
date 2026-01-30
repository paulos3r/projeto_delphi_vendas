object frmCadCondicaoPagamento: TfrmCadCondicaoPagamento
  Left = 0
  Top = 0
  Caption = 'Cadastro de Condi'#231#227'o de Pagamento'
  ClientHeight = 319
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 319
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = -6
    ExplicitHeight = 509
    object BitBtn1: TBitBtn
      Left = 1
      Top = 293
      Width = 143
      Height = 25
      Align = alBottom
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 104
      ExplicitTop = 640
      ExplicitWidth = 75
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 1
      Width = 143
      Height = 25
      Align = alTop
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 72
      ExplicitTop = 328
      ExplicitWidth = 75
    end
    object BitBtn3: TBitBtn
      Left = 1
      Top = 26
      Width = 143
      Height = 25
      Align = alTop
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 2
      ExplicitTop = 32
      ExplicitWidth = 198
    end
    object BitBtn4: TBitBtn
      Left = 1
      Top = 51
      Width = 143
      Height = 25
      Align = alTop
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 2
      ExplicitTop = 63
      ExplicitWidth = 199
    end
    object BitBtn5: TBitBtn
      Left = 1
      Top = 160
      Width = 144
      Height = 25
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn5Click
    end
  end
  object Panel2: TPanel
    Left = 145
    Top = 0
    Width = 513
    Height = 319
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 150
    object Label1: TLabel
      Left = 6
      Top = 22
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 144
      Top = 22
      Width = 33
      Height = 15
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 6
      Top = 96
      Width = 103
      Height = 15
      Caption = 'Tipo de Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 6
      Top = 43
      Width = 121
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 144
      Top = 43
      Width = 353
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 6
      Top = 117
      Width = 121
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'A Vista'
        'A Prazo')
    end
    object GroupBox1: TGroupBox
      Left = 144
      Top = 96
      Width = 345
      Height = 121
      Caption = '   Forma de Pagamentos   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object CheckBox1: TCheckBox
        Left = 16
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Duplicata'
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Boleto'
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 88
        Width = 97
        Height = 17
        Caption = 'Cheque'
        TabOrder = 2
      end
      object CheckBox4: TCheckBox
        Left = 200
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Cart'#227'o'
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Left = 200
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Dinheiro'
        TabOrder = 4
      end
      object CheckBox6: TCheckBox
        Left = 200
        Top = 88
        Width = 97
        Height = 17
        Caption = 'Acumulativo'
        TabOrder = 5
      end
    end
  end
end
