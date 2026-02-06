object frmPesCliente: TfrmPesCliente
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Clientes'
  ClientHeight = 407
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 368
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitHeight = 105
    object lbBuscar: TLabel
      Left = 10
      Top = 16
      Width = 56
      Height = 15
      Caption = 'Buscar Por'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 192
      Top = 32
      Width = 329
      Height = 23
      EditLabel.Width = 31
      EditLabel.Height = 15
      EditLabel.Caption = 'Todos'
      TabOrder = 0
      Text = ''
      TextHint = 'dasd'
    end
    object cbBuscarPor: TComboBox
      Left = 9
      Top = 32
      Width = 152
      Height = 23
      TabOrder = 1
      Items.Strings = (
        'C'#243'digo'
        'Nome')
    end
    object dgPesCliente: TDBGrid
      Left = 0
      Top = 88
      Width = 558
      Height = 280
      DataSource = dsPesCliente
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dgPesClienteDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 368
    Width = 558
    Height = 39
    Align = alBottom
    TabOrder = 1
    object btOk: TButton
      Left = 0
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
    end
    object btCancelar: TBitBtn
      Left = 483
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btCancelarClick
    end
  end
  object dsPesCliente: TDataSource
    Left = 384
    Top = 112
  end
end
