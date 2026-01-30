object frmCadCategorias: TfrmCadCategorias
  Left = 0
  Top = 0
  Align = alCustom
  BorderStyle = bsDialog
  Caption = 'Cadastro de categorias'
  ClientHeight = 575
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 811
    Height = 534
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 803
        Height = 81
        Align = alTop
        TabOrder = 0
        object mksPesquisar: TMaskEdit
          Left = 8
          Top = 28
          Width = 289
          Height = 23
          TabOrder = 0
          Text = 'Pesquise por nome ou id'
        end
        object btnListagemPesquisa: TBitBtn
          Left = 303
          Top = 27
          Width = 106
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 81
        Width = 803
        Height = 423
        Align = alClient
        DataSource = dtsListagem
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = grdListagemDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CATEGORIA_ID'
            Title.Caption = 'ID'
            Width = 132
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 374
            Visible = True
          end>
      end
    end
    object tblManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
      object edtCategoriaId: TLabeledEdit
        Left = 11
        Top = 48
        Width = 86
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtDescricao: TLabeledEdit
        Tag = 1
        Left = 11
        Top = 104
        Width = 500
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
        Text = ''
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 534
    Width = 811
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnNovo: TBitBtn
      Left = 44
      Top = 6
      Width = 75
      Height = 25
      Caption = 'NOVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TBitBtn
      Left = 141
      Top = 6
      Width = 75
      Height = 25
      Caption = 'ALTERAR'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnCancelar: TBitBtn
      Left = 238
      Top = 6
      Width = 75
      Height = 25
      Caption = 'CANCELAR'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 338
      Top = 6
      Width = 75
      Height = 25
      Caption = 'GRAVAR'
      TabOrder = 3
      OnClick = btnGravarClick
    end
    object btnExcluir: TBitBtn
      Left = 440
      Top = 6
      Width = 75
      Height = 25
      Caption = 'EXCLUIR'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object qryListagem: TZQuery
    Connection = dtmConexao.conOracle
    SQL.Strings = (
      'SELECT CATEGORIA_ID, DESCRICAO FROM CATEGORIAS')
    Params = <>
    Left = 436
    Top = 42
  end
  object dtsListagem: TDataSource
    DataSet = qryListagem
    Left = 524
    Top = 42
  end
end
