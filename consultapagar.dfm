inherited frm_ConsultaPagar: Tfrm_ConsultaPagar
  Caption = 'Tela de Consulta de Contas a Pagar'
  PixelsPerInch = 96
  TextHeight = 18
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'Cod_ContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Documentos_ContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fornecedor_ContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'Fornecedor'
            Width = 193
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao_ContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Width = 238
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_ContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 105
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_ContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'Data Emiss'#227'o'
            Width = 132
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_VencContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimento'
            Width = 99
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd_ParcelasContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd Parcelas'
            Width = 95
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Pago_ContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'Pago'
            Width = 100
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
    Active = True
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_ContasPagar.DB'
    Left = 787
    Top = 85
    object tbl_ModeloCod_ContasPagar: TIntegerField
      FieldName = 'Cod_ContasPagar'
    end
    object tbl_ModeloDocumentos_ContasPagar: TStringField
      FieldName = 'Documentos_ContasPagar'
    end
    object tbl_ModeloFornecedor_ContasPagar: TStringField
      FieldName = 'Fornecedor_ContasPagar'
      Size = 60
    end
    object tbl_ModeloDescricao_ContasPagar: TStringField
      FieldName = 'Descricao_ContasPagar'
      Size = 100
    end
    object tbl_ModeloValor_ContasPagar: TCurrencyField
      FieldName = 'Valor_ContasPagar'
    end
    object tbl_ModeloData_ContasPagar: TDateField
      FieldName = 'Data_ContasPagar'
    end
    object tbl_ModeloData_VencContasPagar: TDateField
      FieldName = 'Data_VencContasPagar'
    end
    object tbl_ModeloQtd_ParcelasContasPagar: TIntegerField
      FieldName = 'Qtd_ParcelasContasPagar'
    end
    object tbl_ModeloPago_ContasPagar: TStringField
      FieldName = 'Pago_ContasPagar'
      Size = 10
    end
  end
end
