object frm_NewContaCorrentes: Tfrm_NewContaCorrentes
  Left = 319
  Top = 193
  BorderStyle = bsDialog
  Caption = 'Tela de Cadastro de Conta Corrente'
  ClientHeight = 395
  ClientWidth = 741
  Color = clHighlight
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Trebuchet MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 741
    Height = 395
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Geral'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 733
        Height = 343
        Align = alClient
        Color = clGradientInactiveCaption
        ParentColor = False
        TabOrder = 0
        object Label1: TLabel
          Left = 35
          Top = 46
          Width = 57
          Height = 16
          Caption = 'Agencia:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 674
          Top = 124
          Width = 26
          Height = 24
          Cursor = crHandPoint
          Glyph.Data = {
            AA030000424DAA03000000000000360000002800000011000000110000000100
            1800000000007403000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF39D54239D54239D54239D542
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF39D54239D54239D54239D542FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3ED7473E
            D7473ED7473ED747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3ED7473ED7473ED7473ED747FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF3ED7473ED7473ED7473ED747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00F6FCF642D94B42D94B42D94B42D94B42D94B42D94B42D94B42D9
            4B42D94B42D94B42D94B42D94B42D94B42D94BF6FCF6FFFFFF0042D94B42D94B
            42D94B42D94B42D94B42D94B42D94B42D94B42D94B42D94B42D94B42D94B42D9
            4B42D94B42D94B42D94BFFFFFF0045DB4F45DB4F45DB4F45DB4F45DB4F45DB4F
            45DB4F45DB4F45DB4F45DB4F45DB4F45DB4F45DB4F45DB4F45DB4F45DB4FFFFF
            FF00F3FDF446DB5046DB5046DB5046DB5046DB5046DB5046DB5046DB5046DB50
            46DB5046DB5046DB5046DB5046DB50F3FDF4FFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF46DB5046DB5046DB5046DB50FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4CDE564C
            DE564CDE564CDE56FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4CDE564CDE564CDE564CDE56FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF4CDE564CDE564CDE564CDE56FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50E05A50E05A50E0
            5A50E05AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3FDF450E05A50E05AF3FDF4FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = SpeedButton1Click
        end
        object Label3: TLabel
          Left = 52
          Top = 131
          Width = 40
          Height = 16
          Caption = 'Nome:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 49
          Top = 89
          Width = 44
          Height = 16
          Caption = 'Banco:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 321
          Top = 46
          Width = 43
          Height = 16
          Caption = 'Conta:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBCheckBox1: TDBCheckBox
          Left = 641
          Top = 88
          Width = 56
          Height = 17
          Cursor = crHandPoint
          Caption = 'Ativo'
          DataField = 'Ativo_ContaCorrente'
          DataSource = ds_ContasCorrentes
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object btnGravar: TBitBtn
          Left = 488
          Top = 288
          Width = 113
          Height = 37
          Caption = '&Gravar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Open Sans'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnGravarClick
          Glyph.Data = {
            A2070000424DA207000000000000360000002800000019000000190000000100
            1800000000006C070000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFFFFFF00FCFC
            FCFCFCFCFCFCFCF2F2F2DFDFDFD6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
            D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6DFDFDF
            FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCCA7498CA7498D5759CC15986B0
            8196C6CDCACAD1CFCAD3CFC6CDCABFC4C1B9BDBAADAEACA9A9A6A5A4A1A2A09D
            923B63BF7596AD5275A24D6EFCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCD1
            779CBF6C8DBF6C8DB1527BB28397CFDBD78A5F70A35B7BA35B7BC6C5C2BDB3B2
            AC9E9EA39495A796999A9794903C63BB7394A24B6CA24B6CFCFCFCFCFCFCFFFF
            FF00FCFCFCFCFCFCFCFCFCCA7699C17192C27193AD5077BA90A1FEFFFFA2838F
            B06F8CB06F8CE2E5E5D8D3D4C6BDBDBBB1B2B6A8A8A19E9B953F66BB7393A850
            72A85072FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCCB789AC27595C37394
            AE4E76BD93A5FFFFFFAC909AB77390B77390EDF1F0E2E1E1D0CBCBC6C0BFC0B5
            B5ACA9A7984167B87292AB5174AB5174FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFC
            FCFCFCCB7A9CC37595C27595AD5177C097ABFFFFFFB18E9BB85F85B96488F4F9
            F8ECEDECDCDAD9D2CCCCCBC3C4BAB9B5994269B57091AD5275AD5275FCFCFCFC
            FCFCFFFFFF00FCFCFCFCFCFCFCFCFCCC7D9EC47997C47797B05679BD99AADFD4
            D6BCA6AAC3ACB0D7BDBFF6FAFAF5F9F9ECF0EFE4E7E4DEDEDDB9AFB09D4169AF
            6C8BB1557AB1557AFCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCCE82A2C67E
            9DC87A9ABD5E87B5547EA33A68A53A68AC416EA63767A02F609D2B5D9B2C5E9B
            2A5F992B5D9B2E609C3D68A64C73A55073B45A7EFCFCFCFCFCFCFFFFFF00FCFC
            FCFCFCFCFCFCFCCF84A3CB7E9EAF6585BD92A1BC8C9EBE8F9FBF8C9EBE899CBC
            8799BB8599BB8396B98093B87F90B77E91B67D90BB8495BB8395A44E72B55B80
            FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCD287A6C77899AA6786FBFCFCFA
            FBFBFAFBFBFAFAFAF9FAFAF8F9F9F7F8F9F7F8F8F6F8F7F6F7F7F6F7F7F5F7F6
            FFFFFFBC8496A25171B75A82FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCD4
            8CAAC77C9BAC6985FBFDFDFBFCFCFBFCFBFAFBFBF9FBFBF9FAFAF8FAF9F7F9F9
            F6F7F8F6F7F8F6F7F7F6F6F6FFFFFFBD8697A45170BC5D86FCFCFCFCFCFCFFFF
            FF00FCFCFCFCFCFCFCFCFCD590ABCA7E9EAC6B88EAE4E3EAE4E3EAE4E3EAE4E3
            EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3BE8798A555
            74BF628AFCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCD591ADCB819EAD6D89
            FCFDFDFBFDFDFBFCFCFBFCFCF9FBFBF9FAFAF9FAFAF9F9FAF7F9F9F7F8F7F6F8
            F7F6F7F7FFFFFFBE8898A65575C3658BFCFCFCFCFCFCFFFFFF00FCFCFCFCFCFC
            FCFCFCD797B2CD87A2AF6F8CFDFDFDFCFDFDFCFDFDFBFCFCFAFBFBFAFBFBF9FA
            FAF9FAFAF8F9F9F8F9F8F7F8F8F7F8F7FFFFFFC0899AAC597AC86A92FCFCFCFC
            FCFCFFFFFF00FCFCFCFCFCFCFCFCFCD998B2CE89A4AF748DEAE4E3EAE4E3EAE4
            E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3C0
            8A9AB05D7CCA6C94FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCDD9EB8D18D
            A9B0768EFDFEFEFCFDFDFCFDFEFBFDFDFBFCFCFBFCFCFAFBFBFAFBFAF9F9FAF8
            F9F9F7F9F8F8F8F8FFFFFFC18B9BB45F7FCF7198FCFCFCFCFCFCFFFFFF00FCFC
            FCFCFCFCFCFCFCEBAAC5E39EB9B37993EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EA
            E4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3EAE4E3C18B9BBE6787E684AD
            FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCAE7A9191506AB57F96F9F7F6F7
            F5F4F5F2F1F3F0EEEFEAE8EDE8E5ECE7E4EBE6E3EBE6E3ECE7E4ECE8E4EDE9E5
            EEEBE7C18B9B9150697D5066FCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCD6
            83A3D683A3C77797D189A5D189A5D188A4D088A4CF87A3CF86A2CF85A1CE85A2
            CE849FCD839FCD829FCD829ECD829ECB7A99CE7597D67A9FFCFCFCFCFCFCFFFF
            FF00FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFFFFFF00FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFFFFFF00FCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFFFFFF00}
        end
        object btnCancelar: TBitBtn
          Left = 608
          Top = 288
          Width = 113
          Height = 37
          Caption = '&Cancelar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Open Sans'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = btnCancelarClick
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000017000000180000000100
            180000000000C0060000C40E0000C40E00000000000000000000F1F1F1F1F1F1
            F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
            F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F100
            0000FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FB
            F7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FB
            F7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F100
            0000FBF7F3FBF7F3FBF7F3FBF7F3ECE8E99896B5CAC7CAFBF7F3FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F39F9FC24758E3515EC3F3
            EFEEFBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3EEEAE8FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3EEEBED6D76
            D2465CEC2036D1BCBFE6FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3D4
            D0D38A89B0FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3
            FBF7F3F0ECF17079E34159E43146DD6873D6DFDEEEFBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3FBF7F37678BD8F8DB6FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F100
            0000FBF7F3FBF7F3FBF7F3FBF7F3979AEC344CDD1C37DD3A47B9C5C7E9FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3B7B5C53441C9DCD9D9FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3E4E1EA5362D01632D81A
            30CBAAA8B8FBF7F3FBF7F3FBF7F3FBF7F3E4E1DF3447D1797EB6FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3CCCAE2364BDA122EDA3440B5D7D3D2FBF7F3FBF7F3F2EEEC5B64BA2B3FD3E3
            E0DFFBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3BEBEED1F36D0102DDE5459A8F0ECE9FBF7F37075
            BE1B36EEA7A7C0FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F100
            0000FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3B9B8EE2138D31E38E0
            5C62AC6067B31532F3646CBFFBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FB
            F7F3CCCBEE2235BF0D26D30E2BE14553CBE6E3E6FBF7F3FBF7F3FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3FBF7F3F0ECEB9F9FCE142CD10922DB031CD33948C7C4C7EDFBF7F3FB
            F7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3BAB7C75C65BC1833E40727EB2E41CF656ED4091E
            D13D49B6C7C8DEFBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F100
            0000FBF7F3FBF7F3FBF7F3FBF7F3D7D3D69092BD6D7BE6546AF94057F54154D7
            CDCBDDFBF7F3A9ABEC2D45F5424DB1BEBBC7FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3B3B1C06572CF8998F88796FA7A
            8AF67E87D9D9D5DBFBF7F3FBF7F3FBF7F3D6D4EF8791F5636ED18E8EA6EEEAE8
            FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3DBDBE396A3
            F87283E98D98E8AEAFD1F2EEEFFBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F5F1F1C3
            C2F18B91ED6467A7B2B0BAFBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F100
            0000FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FB
            F7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3
            FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000FBF7F3FBF7F3FBF7F3FBF7F3FBF7
            F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FB
            F7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3FBF7F3F1F1F1000000}
        end
        object editAgencia: TDBEdit
          Left = 96
          Top = 40
          Width = 217
          Height = 24
          Ctl3D = False
          DataField = 'Agencia_ContaCorrente'
          DataSource = ds_ContasCorrentes
          ParentCtl3D = False
          TabOrder = 0
          OnEnter = editAgenciaEnter
          OnExit = editAgenciaExit
          OnKeyPress = editAgenciaKeyPress
        end
        object editConta: TDBEdit
          Left = 368
          Top = 40
          Width = 331
          Height = 24
          Ctl3D = False
          DataField = 'Conta_ContaCorrente'
          DataSource = ds_ContasCorrentes
          ParentCtl3D = False
          TabOrder = 1
          OnEnter = editContaEnter
          OnExit = editContaExit
          OnKeyPress = editContaKeyPress
        end
        object cbBanco: TComboBox
          Left = 96
          Top = 84
          Width = 513
          Height = 26
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ItemHeight = 18
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnEnter = cbBancoEnter
          OnExit = cbBancoExit
        end
        object editDescricao: TEdit
          Left = 96
          Top = 124
          Width = 576
          Height = 24
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
          OnEnter = editDescricaoEnter
          OnExit = editDescricaoExit
        end
        object GroupBox2: TGroupBox
          Left = 404
          Top = 166
          Width = 297
          Height = 57
          TabOrder = 6
          object Label5: TLabel
            Left = 11
            Top = 21
            Width = 121
            Height = 25
            Caption = 'Saldo Inicial:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object editSaldo: TEdit
            Left = 136
            Top = 15
            Width = 152
            Height = 33
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Trebuchet MS'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Text = 'R$ 0,00'
            OnClick = editSaldoClick
            OnEnter = editSaldoEnter
            OnExit = editSaldoExit
          end
        end
        object Button1: TButton
          Left = 48
          Top = 184
          Width = 75
          Height = 25
          Caption = 'teste'
          TabOrder = 8
          OnClick = Button1Click
        end
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 343
        Width = 733
        Height = 19
        Panels = <>
      end
    end
  end
  object ds_ContasCorrentes: TDataSource
    DataSet = tbl_ContasCorrentes
    Left = 532
    Top = 45
  end
  object tbl_ContasCorrentes: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_ContaCorrente.DB'
    Left = 564
    Top = 45
    object tbl_ContasCorrentesCod_ContaCorrente: TAutoIncField
      FieldName = 'Cod_ContaCorrente'
      ReadOnly = True
    end
    object tbl_ContasCorrentesDescricao_ContaCorrente: TStringField
      FieldName = 'Descricao_ContaCorrente'
      Size = 60
    end
    object tbl_ContasCorrentesAgencia_ContaCorrente: TStringField
      FieldName = 'Agencia_ContaCorrente'
      Size = 60
    end
    object tbl_ContasCorrentesBanco_ContaCorrente: TStringField
      FieldName = 'Banco_ContaCorrente'
      Size = 60
    end
    object tbl_ContasCorrentesAtivo_ContaCorrente: TStringField
      FieldName = 'Ativo_ContaCorrente'
      Size = 1
    end
    object tbl_ContasCorrentesId_Conta: TIntegerField
      FieldName = 'Id_Conta'
    end
    object tbl_ContasCorrentesConta_ContaCorrente: TStringField
      FieldName = 'Conta_ContaCorrente'
      Size = 30
    end
    object tbl_ContasCorrentesSaldo_ContaCorrente: TCurrencyField
      FieldName = 'Saldo_ContaCorrente'
    end
  end
  object tbl_Contas: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Contas.db'
    Left = 596
    Top = 45
    object tbl_ContasId_Conta: TAutoIncField
      FieldName = 'Id_Conta'
      ReadOnly = True
    end
    object tbl_ContasDescricao_Conta: TStringField
      FieldName = 'Descricao_Conta'
      Size = 60
    end
    object tbl_ContasCodigo_Conta: TStringField
      FieldName = 'Codigo_Conta'
      Size = 5
    end
    object tbl_ContasAtivo_Conta: TStringField
      FieldName = 'Ativo_Conta'
      Size = 1
    end
  end
  object ds_Conta: TDataSource
    DataSet = tbl_Contas
    Left = 600
    Top = 8
  end
  object tbl_Movimentacao: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Movimentacao.db'
    Left = 628
    Top = 45
    object tbl_MovimentacaoCod_Movimentacao: TAutoIncField
      FieldName = 'Cod_Movimentacao'
      ReadOnly = True
    end
    object tbl_MovimentacaoId_Movimentacao: TIntegerField
      FieldName = 'Id_Movimentacao'
    end
    object tbl_MovimentacaoData_Movimentacao: TDateField
      FieldName = 'Data_Movimentacao'
    end
    object tbl_MovimentacaoHistorico_Movimentacao: TStringField
      FieldName = 'Historico_Movimentacao'
      Size = 60
    end
    object tbl_MovimentacaoDebito_Movimentacao: TCurrencyField
      FieldName = 'Debito_Movimentacao'
    end
    object tbl_MovimentacaoCredito_Movimentacao: TCurrencyField
      FieldName = 'Credito_Movimentacao'
    end
    object tbl_MovimentacaoConciliado_Movimentacao: TStringField
      FieldName = 'Conciliado_Movimentacao'
      Size = 3
    end
    object tbl_MovimentacaoExtrato_Movimentacao: TGraphicField
      FieldName = 'Extrato_Movimentacao'
      BlobType = ftGraphic
    end
  end
end
