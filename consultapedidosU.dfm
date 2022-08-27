inherited frm_ConsultaPedidos: Tfrm_ConsultaPedidos
  Left = 163
  Top = 176
  Caption = 'Tela de Consulta de Pedidos'
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
            FieldName = 'Cod_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CodVenda_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'ID Venda'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Total'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cliente_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 248
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Usuario_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Usu'#225'rio'
            Width = 132
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Frete_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Frete'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Status_PedTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Status'
            Width = 161
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
    TableName = 'tbl_PedTotal.db'
    Left = 787
    Top = 93
    object tbl_ModeloCod_PedTotal: TIntegerField
      FieldName = 'Cod_PedTotal'
    end
    object tbl_ModeloTotal_PedTotal: TCurrencyField
      FieldName = 'Total_PedTotal'
    end
    object tbl_ModeloCodVenda_PedTotal: TIntegerField
      FieldName = 'CodVenda_PedTotal'
    end
    object tbl_ModeloCliente_PedTotal: TStringField
      FieldName = 'Cliente_PedTotal'
      Size = 60
    end
    object tbl_ModeloUsuario_PedTotal: TStringField
      FieldName = 'Usuario_PedTotal'
      Size = 30
    end
    object tbl_ModeloData_PedTotal: TDateField
      FieldName = 'Data_PedTotal'
    end
    object tbl_ModeloFrete_PedTotal: TCurrencyField
      FieldName = 'Frete_PedTotal'
    end
    object tbl_ModeloStatus_PedTotal: TStringField
      FieldName = 'Status_PedTotal'
      Size = 30
    end
  end
  object tbl_Items: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Pedido.DB'
    Left = 819
    Top = 93
    object tbl_ItemsCod_PedTotal: TIntegerField
      FieldName = 'Cod_PedTotal'
    end
    object tbl_ItemsCod_Produto: TIntegerField
      FieldName = 'Cod_Produto'
    end
    object tbl_ItemsProduto_Pedido: TStringField
      FieldName = 'Produto_Pedido'
      Size = 60
    end
    object tbl_ItemsValor_Pedido: TCurrencyField
      FieldName = 'Valor_Pedido'
    end
    object tbl_ItemsQuantidade_Pedido: TFloatField
      FieldName = 'Quantidade_Pedido'
    end
    object tbl_ItemsTotal_Pedido: TCurrencyField
      FieldName = 'Total_Pedido'
    end
    object tbl_ItemsCliente_Pedido: TStringField
      FieldName = 'Cliente_Pedido'
      Size = 60
    end
    object tbl_ItemsData_Pedido: TDateField
      FieldName = 'Data_Pedido'
    end
    object tbl_ItemsUsuario_Pedido: TStringField
      FieldName = 'Usuario_Pedido'
      Size = 30
    end
    object tbl_ItemsFornecedor_Pedido: TStringField
      FieldName = 'Fornecedor_Pedido'
      Size = 60
    end
  end
  object tbl_Fornecedores: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Fornecedores.DB'
    Left = 707
    Top = 93
  end
  object tbl_Compras: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Compras.DB'
    Left = 851
    Top = 93
    object tbl_ComprasCod_Compra: TIntegerField
      FieldName = 'Cod_Compra'
    end
    object tbl_ComprasCod_CompTotal: TIntegerField
      FieldName = 'Cod_CompTotal'
    end
    object tbl_ComprasProduto_Compra: TStringField
      FieldName = 'Produto_Compra'
      Size = 60
    end
    object tbl_ComprasUnid_Compra: TStringField
      FieldName = 'Unid_Compra'
      Size = 30
    end
    object tbl_ComprasQuantidade_Compra: TFloatField
      FieldName = 'Quantidade_Compra'
    end
    object tbl_ComprasValor_Compra: TCurrencyField
      FieldName = 'Valor_Compra'
    end
    object tbl_ComprasTotal_Compra: TCurrencyField
      FieldName = 'Total_Compra'
    end
    object tbl_ComprasId_Pedido: TIntegerField
      FieldName = 'Id_Pedido'
    end
  end
end
