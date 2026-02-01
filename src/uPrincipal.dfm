object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 632
  ClientWidth = 958
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mainPrincipal
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object mainPrincipal: TMainMenu
    Left = 48
    Top = 64
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object CLIENTE1: TMenuItem
        Caption = 'CADASTROS'
        object CLIENTE3: TMenuItem
          Caption = 'CLIENTE'
          OnClick = CLIENTE3Click
        end
        object N6: TMenuItem
          Caption = '-'
        end
        object CONDIODEPAGAMENTO1: TMenuItem
          Caption = 'CONDI'#199#195'O DE PAGAMENTO'
          OnClick = CONDIODEPAGAMENTO1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object CATEGORIA1: TMenuItem
        Caption = 'CATEGORIA'
        OnClick = CATEGORIA1Click
      end
      object PRODUTO1: TMenuItem
        Caption = 'PRODUTO'
        object PRODUTO3: TMenuItem
          Caption = 'PRODUTO'
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object UNIDADE1: TMenuItem
          Caption = 'UNIDADE'
        end
        object NCM1: TMenuItem
          Caption = 'NCM'
        end
        object CUSTOEPRECO1: TMenuItem
          Caption = 'CUSTO E PRECO'
        end
        object ESTOQUE1: TMenuItem
          Caption = 'ESTOQUE'
        end
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuFechar: TMenuItem
        Caption = 'FECHAR'
        OnClick = mnuFecharClick
      end
    end
    object MOVIMENTAO1: TMenuItem
      Caption = 'MOVIMENTA'#199#195'O'
      object VENDAS1: TMenuItem
        Caption = 'VENDAS'
        object ORAMENTO1: TMenuItem
          Caption = 'OR'#199'AMENTO'
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object CAIXA1: TMenuItem
        Caption = 'CAIXA'
      end
    end
    object RELATRIO1: TMenuItem
      Caption = 'RELAT'#211'RIO'
      object CLIENTE2: TMenuItem
        Caption = 'CLIENTE'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object PRODUTO2: TMenuItem
        Caption = 'PRODUTO'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object VENDAS2: TMenuItem
        Caption = 'VENDAS'
      end
    end
  end
end
