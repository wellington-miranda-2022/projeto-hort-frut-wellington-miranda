inherited frm_ConsultaCompras: Tfrm_ConsultaCompras
  Caption = 'Tela de Consulta de Compras'
  PixelsPerInch = 96
  TextHeight = 18
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'Cod_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fornecedor_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Fornecedor'
            Width = 263
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Lote_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Lote'
            Width = 74
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Total'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FormPag_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Forma Pag'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Usuario_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Usu'#225'rio'
            Width = 93
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataVenc_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimento'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Prazo_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Prazo / Dias'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Frete_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Frete'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Situacao_CompTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Situa'#231#227'o'
            Width = 151
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
    TableName = 'tbl_CompTotal.db'
    Left = 795
    Top = 93
    object tbl_ModeloCod_CompTotal: TIntegerField
      FieldName = 'Cod_CompTotal'
    end
    object tbl_ModeloFornecedor_CompTotal: TStringField
      FieldName = 'Fornecedor_CompTotal'
      Size = 60
    end
    object tbl_ModeloLote_CompTotal: TStringField
      FieldName = 'Lote_CompTotal'
    end
    object tbl_ModeloData_CompTotal: TDateField
      FieldName = 'Data_CompTotal'
    end
    object tbl_ModeloTotal_CompTotal: TCurrencyField
      FieldName = 'Total_CompTotal'
    end
    object tbl_ModeloFormPag_CompTotal: TStringField
      FieldName = 'FormPag_CompTotal'
      Size = 30
    end
    object tbl_ModeloUsuario_CompTotal: TStringField
      FieldName = 'Usuario_CompTotal'
      Size = 30
    end
    object tbl_ModeloDataVenc_CompTotal: TDateField
      FieldName = 'DataVenc_CompTotal'
    end
    object tbl_ModeloPrazo_CompTotal: TIntegerField
      FieldName = 'Prazo_CompTotal'
    end
    object tbl_ModeloFrete_CompTotal: TCurrencyField
      FieldName = 'Frete_CompTotal'
    end
    object tbl_ModeloSituacao_CompTotal: TStringField
      FieldName = 'Situacao_CompTotal'
      Size = 30
    end
  end
end
