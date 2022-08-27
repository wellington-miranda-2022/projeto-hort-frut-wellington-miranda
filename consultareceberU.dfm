inherited frm_ConsultaReceber: Tfrm_ConsultaReceber
  Caption = 'Tela de Consulta de Contas a Receber'
  PixelsPerInch = 96
  TextHeight = 18
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'Cod_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cliente_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 252
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Num_DocContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Documento'
            Width = 161
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 107
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Data Emiss'#227'o'
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_VencContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimento'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Tipo_ReceitaContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo Receita'
            Width = 254
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Quitado_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Quitado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Falta_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Falta'
            Width = 96
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Recebido_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Recebido'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Obs_ContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd_ParcContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd Parc'
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
    TableName = 'tbl_ContasReceber.DB'
    Left = 795
    Top = 93
    object tbl_ModeloCod_ContasReceber: TIntegerField
      FieldName = 'Cod_ContasReceber'
    end
    object tbl_ModeloCliente_ContasReceber: TStringField
      FieldName = 'Cliente_ContasReceber'
      Size = 60
    end
    object tbl_ModeloNum_DocContasReceber: TStringField
      FieldName = 'Num_DocContasReceber'
    end
    object tbl_ModeloQtd_ParcContasReceber: TIntegerField
      FieldName = 'Qtd_ParcContasReceber'
    end
    object tbl_ModeloValor_ContasReceber: TCurrencyField
      FieldName = 'Valor_ContasReceber'
    end
    object tbl_ModeloData_ContasReceber: TDateField
      FieldName = 'Data_ContasReceber'
    end
    object tbl_ModeloData_VencContasReceber: TDateField
      FieldName = 'Data_VencContasReceber'
    end
    object tbl_ModeloTipo_ReceitaContasReceber: TStringField
      FieldName = 'Tipo_ReceitaContasReceber'
      Size = 60
    end
    object tbl_ModeloQuitado_ContasReceber: TDateField
      FieldName = 'Quitado_ContasReceber'
    end
    object tbl_ModeloFalta_ContasReceber: TCurrencyField
      FieldName = 'Falta_ContasReceber'
    end
    object tbl_ModeloRecebido_ContasReceber: TCurrencyField
      FieldName = 'Recebido_ContasReceber'
    end
    object tbl_ModeloObs_ContasReceber: TStringField
      FieldName = 'Obs_ContasReceber'
      Size = 100
    end
  end
end
