inherited frm_ConsultaClientes: Tfrm_ConsultaClientes
  Caption = 'Tela de Consulta de Clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 18
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited DBGrid1: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'Cod_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Nome'
            Width = 269
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Endere'#231'o'
            Width = 306
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Bairro'
            Width = 125
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cidade_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Cidade'
            Width = 153
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UF_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'UF'
            Width = 24
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Telefone'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Celular_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Celular'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Empresa_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Empresa'
            Width = 179
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RG_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'RG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'CPF'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_Cad'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 107
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Privilegio_Cliente'
            Title.Alignment = taCenter
            Title.Caption = 'Privil'#233'gio'
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
    TableName = 'tbl_Cliente.DB'
    Left = 787
    Top = 93
    object tbl_ModeloCod_Cliente: TIntegerField
      FieldName = 'Cod_Cliente'
    end
    object tbl_ModeloNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 50
    end
    object tbl_ModeloEndereco_Cliente: TStringField
      FieldName = 'Endereco_Cliente'
      Size = 50
    end
    object tbl_ModeloBairro_Cliente: TStringField
      FieldName = 'Bairro_Cliente'
      Size = 30
    end
    object tbl_ModeloCidade_Cliente: TStringField
      FieldName = 'Cidade_Cliente'
    end
    object tbl_ModeloUF_Cliente: TStringField
      FieldName = 'UF_Cliente'
      Size = 2
    end
    object tbl_ModeloTelefone_Cliente: TStringField
      FieldName = 'Telefone_Cliente'
      Size = 12
    end
    object tbl_ModeloCelular_Cliente: TStringField
      FieldName = 'Celular_Cliente'
      Size = 11
    end
    object tbl_ModeloEmpresa_Cliente: TStringField
      FieldName = 'Empresa_Cliente'
    end
    object tbl_ModeloRG_Cliente: TStringField
      FieldName = 'RG_Cliente'
      Size = 14
    end
    object tbl_ModeloCPF_Cliente: TStringField
      FieldName = 'CPF_Cliente'
      Size = 14
    end
    object tbl_ModeloData_Cad: TDateField
      FieldName = 'Data_Cad'
    end
    object tbl_ModeloPrivilegio_Cliente: TStringField
      FieldName = 'Privilegio_Cliente'
      Size = 10
    end
  end
end
