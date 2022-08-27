inherited frm_ConsultaProdutos: Tfrm_ConsultaProdutos
  Caption = 'Tela de Consulta de Produtos'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited DBGrid1: TDBGrid
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Cod_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Tipo_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fornecedores_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'Fornecedor'
            Width = 301
            Visible = True
          end>
      end
    end
    inherited DBNavigator1: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds_Padrao: TDataSource
    DataSet = tbl_Modelo
  end
  object tbl_Modelo: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Produto.DB'
    Left = 795
    Top = 93
    object tbl_ModeloCod_Produto: TIntegerField
      FieldName = 'Cod_Produto'
    end
    object tbl_ModeloDescricao_Produto: TStringField
      FieldName = 'Descricao_Produto'
      Size = 30
    end
    object tbl_ModeloTipo_Produto: TStringField
      FieldName = 'Tipo_Produto'
      Size = 10
    end
    object tbl_ModeloQtd_Produto: TFloatField
      FieldName = 'Qtd_Produto'
    end
    object tbl_ModeloFornecedores_Produto: TStringField
      FieldName = 'Fornecedores_Produto'
      Size = 30
    end
  end
end
