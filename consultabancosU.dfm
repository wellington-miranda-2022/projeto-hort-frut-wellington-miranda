inherited frm_ConsultaBancos: Tfrm_ConsultaBancos
  Left = 350
  Top = 124
  Caption = 'Tela de Consulta de Bancos'
  ClientHeight = 451
  ClientWidth = 779
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 18
  inherited Panel1: TPanel
    Width = 779
    Height = 451
    inherited Panel2: TPanel
      Width = 759
      Height = 413
      inherited GroupBox1: TGroupBox
        Width = 757
        inherited SpeedButton3: TSpeedButton
          Left = 671
        end
        inherited Panel3: TPanel
          Width = 401
          inherited btnPesquisar: TSpeedButton
            Left = 369
          end
          inherited editConsulta: TEdit
            Width = 366
            CharCase = ecNormal
          end
        end
      end
      inherited DBGrid1: TDBGrid
        Width = 757
        Height = 299
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Banco_Banco'
            Title.Alignment = taCenter
            Title.Caption = 'Banco'
            Width = 595
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Id_Banco'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 155
            Visible = True
          end>
      end
    end
    inherited DBNavigator1: TDBNavigator
      Top = 432
      Width = 777
      Hints.Strings = ()
    end
  end
  inherited ds_Padrao: TDataSource
    DataSet = tbl_Modelo1
    Left = 577
  end
  object tbl_Modelo1: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Bancos.DB'
    Left = 611
    Top = 85
    object tbl_Modelo1Id_Banco: TStringField
      FieldName = 'Id_Banco'
      Size = 3
    end
    object tbl_Modelo1Banco_Banco: TStringField
      FieldName = 'Banco_Banco'
      Size = 60
    end
  end
end
