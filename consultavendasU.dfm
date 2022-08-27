inherited frm_ConsultaVendas: Tfrm_ConsultaVendas
  Caption = 'Tela de Consulta de Vendas'
  PixelsPerInch = 96
  TextHeight = 18
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CodVendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cliente_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 298
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Usuario_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Usu'#225'rio'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Total'
            Width = 119
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 157
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataVenc_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimento'
            Width = 129
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Prazo_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Prazo'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FormPag_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Forma Pag'
            Width = 121
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Situacao_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Situa'#231#227'o'
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Frete_VendTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Frete'
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
    TableName = 'tbl_VendTotal.DB'
    Left = 787
    Top = 85
    object tbl_ModeloCodVendTotal: TIntegerField
      FieldName = 'CodVendTotal'
    end
    object tbl_ModeloCliente_VendTotal: TStringField
      FieldName = 'Cliente_VendTotal'
      Size = 60
    end
    object tbl_ModeloUsuario_VendTotal: TStringField
      FieldName = 'Usuario_VendTotal'
      Size = 40
    end
    object tbl_ModeloTotal_VendTotal: TCurrencyField
      FieldName = 'Total_VendTotal'
    end
    object tbl_ModeloData_VendTotal: TDateField
      FieldName = 'Data_VendTotal'
    end
    object tbl_ModeloDataVenc_VendTotal: TDateField
      FieldName = 'DataVenc_VendTotal'
    end
    object tbl_ModeloPrazo_VendTotal: TIntegerField
      FieldName = 'Prazo_VendTotal'
    end
    object tbl_ModeloFormPag_VendTotal: TStringField
      FieldName = 'FormPag_VendTotal'
      Size = 30
    end
    object tbl_ModeloSituacao_VendTotal: TStringField
      FieldName = 'Situacao_VendTotal'
      Size = 30
    end
    object tbl_ModeloFrete_VendTotal: TCurrencyField
      FieldName = 'Frete_VendTotal'
    end
  end
end
