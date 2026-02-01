object frmPesCondicaoPagamento: TfrmPesCondicaoPagamento
  Left = 0
  Top = 0
  Caption = 'Pesquisa de condi'#231#227'o de pagamento'
  ClientHeight = 448
  ClientWidth = 618
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
    Width = 618
    Height = 419
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 32
      Height = 15
      Caption = 'Filtros'
    end
    object Label2: TLabel
      Left = 184
      Top = 16
      Width = 46
      Height = 15
      Caption = 'Pesquisa'
    end
    object cbPesCondicaoPagamentoFiltros: TComboBox
      Left = 8
      Top = 37
      Width = 145
      Height = 23
      TabOrder = 0
      Items.Strings = (
        'Nome'
        'C'#243'digo')
    end
    object edPesCondicaoPagamentoPesquisa: TEdit
      Left = 184
      Top = 37
      Width = 425
      Height = 23
      TabOrder = 1
      OnKeyDown = edPesCondicaoPagamentoPesquisaKeyDown
    end
    object dgPesCondicaoPagamento: TDBGrid
      Left = 8
      Top = 80
      Width = 601
      Height = 333
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dgPesCondicaoPagamentoDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 419
    Width = 618
    Height = 29
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 104
      Height = 27
      Align = alLeft
      Caption = '&Ok'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 518
      Top = 1
      Width = 99
      Height = 27
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object dsPesCondicaoPagamento: TDataSource
    Left = 496
    Top = 104
  end
end
