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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 319
    Align = alLeft
    TabOrder = 0
    object btFechar: TBitBtn
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
      OnClick = btFecharClick
    end
    object btGravar: TBitBtn
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
      OnClick = btGravarClick
    end
    object btCancelar: TBitBtn
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
      OnClick = btCancelarClick
    end
    object btExcluir: TBitBtn
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
      OnClick = btExcluirClick
    end
    object btPesquisar: TBitBtn
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
      OnClick = btPesquisarClick
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
    object edCodigo: TEdit
      Left = 6
      Top = 43
      Width = 121
      Height = 23
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edNome: TEdit
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
    object cbTipoPagamento: TComboBox
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
      object cbDuplicata: TCheckBox
        Left = 16
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Duplicata'
        TabOrder = 0
      end
      object cbBoleto: TCheckBox
        Left = 16
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Boleto'
        TabOrder = 1
      end
      object cbCheque: TCheckBox
        Left = 16
        Top = 88
        Width = 97
        Height = 17
        Caption = 'Cheque'
        TabOrder = 2
      end
      object cbCartao: TCheckBox
        Left = 200
        Top = 24
        Width = 97
        Height = 17
        Caption = 'Cart'#227'o'
        TabOrder = 3
      end
      object cbDinheiro: TCheckBox
        Left = 200
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Dinheiro'
        TabOrder = 4
      end
      object cbAcumulativo: TCheckBox
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
