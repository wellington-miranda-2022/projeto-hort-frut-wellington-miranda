object frm_Ajustes: Tfrm_Ajustes
  Left = 329
  Top = 143
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Tela de Ajustes no Sistema'
  ClientHeight = 364
  ClientWidth = 955
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 345
    Width = 955
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 369
    Height = 345
    Caption = 'Configura'#231#245'es:'
    TabOrder = 1
    object Label1: TLabel
      Left = 88
      Top = 24
      Width = 178
      Height = 13
      Caption = 'Mudar cor dos paineis do sistema:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 144
      Width = 219
      Height = 13
      Caption = 'Primeira conta padr'#227'o do plano de contas:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 232
      Width = 148
      Height = 13
      Caption = 'Conta de d'#233'bito autom'#225'tico:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 184
      Width = 206
      Height = 13
      Caption = 'Conta corrente para cr'#233'dito autom'#225'tico:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 8
      Top = 40
      Width = 345
      Height = 41
      BiDiMode = bdLeftToRight
      Caption = 'Escolha uma cor clicando aqui...'
      Color = clMenuHighlight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBiDiMode = False
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = Panel1Click
    end
    object cbPlanoConta: TComboBox
      Left = 16
      Top = 160
      Width = 337
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbPlanoContaChange
    end
    object cbContaDebito: TComboBox
      Left = 16
      Top = 248
      Width = 337
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnChange = cbContaDebitoChange
    end
    object cbContaCredito: TComboBox
      Left = 16
      Top = 200
      Width = 337
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = cbContaCreditoChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 376
    Top = 0
    Width = 577
    Height = 345
    Caption = 'Lista de Ajustes'
    TabOrder = 2
    object dbAjustes: TDBGrid
      Left = 8
      Top = 16
      Width = 561
      Height = 321
      Cursor = crHandPoint
      Align = alCustom
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = DataSource1
      FixedColor = 7165253
      Font.Charset = ANSI_CHARSET
      Font.Color = 7165253
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDblClick = dbAjustesDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Cod_Ajuste'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao_Ajuste'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 384
          Visible = True
        end
        item
          Alignment = taCenter
          Color = 2866169
          Expanded = False
          FieldName = 'Ajustes_AJuste'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'Ajustes'
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 696
    Top = 136
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'HortiFrut'
    RequestLive = True
    SQL.Strings = (
      'Select * from tbl_Ajustes')
    Left = 696
    Top = 168
  end
  object ColorDialog1: TColorDialog
    Left = 224
    Top = 88
  end
  object tbl_Ajustes: TTable
    Active = True
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Ajustes.db'
    Left = 696
    Top = 200
    object tbl_AjustesCod_Ajuste: TAutoIncField
      FieldName = 'Cod_Ajuste'
      ReadOnly = True
    end
    object tbl_AjustesDescricao_Ajuste: TStringField
      FieldName = 'Descricao_Ajuste'
      Size = 100
    end
    object tbl_AjustesAjustes_AJuste: TFloatField
      FieldName = 'Ajustes_AJuste'
    end
  end
  object tbl_ContaCorrente: TTable
    Active = True
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_ContaCorrente.db'
    Left = 560
    Top = 136
    object tbl_ContaCorrenteCod_ContaCorrente: TAutoIncField
      FieldName = 'Cod_ContaCorrente'
      ReadOnly = True
    end
    object tbl_ContaCorrenteDescricao_ContaCorrente: TStringField
      FieldName = 'Descricao_ContaCorrente'
      Size = 60
    end
    object tbl_ContaCorrenteAgencia_ContaCorrente: TStringField
      FieldName = 'Agencia_ContaCorrente'
      Size = 60
    end
    object tbl_ContaCorrenteBanco_ContaCorrente: TStringField
      FieldName = 'Banco_ContaCorrente'
      Size = 60
    end
    object tbl_ContaCorrenteAtivo_ContaCorrente: TStringField
      FieldName = 'Ativo_ContaCorrente'
      Size = 1
    end
    object tbl_ContaCorrenteId_Conta: TIntegerField
      FieldName = 'Id_Conta'
    end
    object tbl_ContaCorrenteConta_ContaCorrente: TStringField
      FieldName = 'Conta_ContaCorrente'
      Size = 30
    end
    object tbl_ContaCorrenteSaldo_ContaCorrente: TCurrencyField
      FieldName = 'Saldo_ContaCorrente'
    end
  end
end
