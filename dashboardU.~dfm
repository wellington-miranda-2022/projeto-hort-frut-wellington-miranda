object frm_Dashboard: Tfrm_Dashboard
  Left = 323
  Top = 140
  AlphaBlend = True
  AlphaBlendValue = 220
  BorderStyle = bsDialog
  Caption = 'Dashboard'
  ClientHeight = 489
  ClientWidth = 965
  Color = 15386264
  TransparentColorValue = 15386264
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
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 7
    Top = 10
    Width = 951
    Height = 455
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PageControl1: TPageControl
      Left = -1
      Top = 24
      Width = 953
      Height = 433
      ActivePage = TabSheet5
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Contas Pagar / Receber'
        object SpeedButton2: TSpeedButton
          Left = 0
          Top = 8
          Width = 96
          Height = 29
          Caption = 'Hoje'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 104
          Top = 8
          Width = 96
          Height = 29
          Caption = 'Amanh'#227
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton3Click
        end
        object SpeedButton4: TSpeedButton
          Left = 208
          Top = 8
          Width = 96
          Height = 29
          Caption = 'Pr'#243'x ... 7 Dias'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton4Click
        end
        object Label4: TLabel
          Left = 320
          Top = 16
          Width = 33
          Height = 23
          Caption = 'Dia,'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblData: TLabel
          Left = 357
          Top = 16
          Width = 39
          Height = 23
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 46
          Width = 126
          Height = 23
          Caption = 'Contas a Pagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 1
          Top = 220
          Width = 147
          Height = 23
          Caption = 'Contas a Receber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 648
          Top = 216
          Width = 233
          Height = 23
          Caption = 'N'#227'o h'#225' items para exibi'#231#227'o!'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBContasReceber: TDBGrid
          Left = 8
          Top = 243
          Width = 577
          Height = 151
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = ds_ContasReceber
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Trebuchet MS'
          TitleFont.Style = []
          OnDrawColumnCell = DBContasReceberDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'Num_DocContasReceber'
              Title.Alignment = taCenter
              Title.Caption = 'T'#237'tulo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Trebuchet MS'
              Title.Font.Style = [fsBold]
              Width = 156
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cliente_ContasReceber'
              Title.Alignment = taCenter
              Title.Caption = 'Fornecedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Trebuchet MS'
              Title.Font.Style = [fsBold]
              Width = 214
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Data_VencContasReceber'
              Title.Alignment = taCenter
              Title.Caption = 'Vencimento'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Trebuchet MS'
              Title.Font.Style = [fsBold]
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Falta_ContasReceber'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clBlack
              Title.Font.Height = -13
              Title.Font.Name = 'Trebuchet MS'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        object Chart1: TChart
          Left = 592
          Top = 69
          Width = 353
          Height = 325
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Color = clSilver
          BackWall.Pen.Visible = False
          BottomWall.Brush.Color = clWhite
          BottomWall.Brush.Style = bsClear
          Gradient.Direction = gdRightLeft
          Gradient.EndColor = clSilver
          Gradient.Visible = True
          LeftWall.Brush.Color = clWhite
          LeftWall.Brush.Style = bsClear
          MarginLeft = 5
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          AxisVisible = False
          BackColor = clSilver
          Chart3DPercent = 30
          ClipPoints = False
          Frame.Visible = False
          Legend.Alignment = laBottom
          Legend.ColorWidth = 15
          Legend.ShadowSize = 2
          Legend.TopPos = 0
          Legend.Visible = False
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DOptions.VertOffset = 1
          View3DOptions.Zoom = 101
          View3DWalls = False
          BevelOuter = bvNone
          TabOrder = 1
          object Series1: TPieSeries
            Marks.Arrow.Color = -1
            Marks.ArrowLength = 3
            Marks.Font.Charset = ANSI_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -9
            Marks.Font.Name = 'Tahoma'
            Marks.Font.Style = [fsBold]
            Marks.Frame.Visible = False
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clRed
            ShowInLegend = False
            ValueFormat = 'R$ #,##0.00###'
            CustomXRadius = 90
            CustomYRadius = 105
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1.000000000000000000
            PieValues.Order = loNone
            RotationAngle = 135
          end
        end
        object DBContasPagar: TDBGrid
          Left = 8
          Top = 70
          Width = 577
          Height = 141
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = ds_ContasPagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Trebuchet MS'
          TitleFont.Style = []
          OnDrawColumnCell = DBContasPagarDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'Num_DocContasDetalhes'
              Title.Alignment = taCenter
              Title.Caption = 'T'#237'tulo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fornecedor_ContasDetalhes'
              Title.Alignment = taCenter
              Title.Caption = 'Fornecedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 215
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Data_VencContasDetalhes'
              Title.Alignment = taCenter
              Title.Caption = 'Vencimento'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor_RestContasDetalhes'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Despesas / Receitas'
        ImageIndex = 1
        object Label6: TLabel
          Left = 322
          Top = 9
          Width = 145
          Height = 16
          Caption = 'Despesas vs. Receitas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 1710618
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox2: TGroupBox
          Left = 160
          Top = 32
          Width = 537
          Height = 105
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 0
          object Label7: TLabel
            Left = 230
            Top = 79
            Width = 20
            Height = 15
            Caption = 'At'#233
            Font.Charset = ANSI_CHARSET
            Font.Color = 1710618
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton5: TSpeedButton
            Left = 450
            Top = 71
            Width = 25
            Height = 23
            Glyph.Data = {
              26050000424D26050000000000003604000028000000100000000F0000000100
              080000000000F000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              000000000000290000000000697273737373737361722919000000697273BBBC
              BCBCBCBC7372722100005972727369696108BDBCBC7372710000592969000000
              000019BCBB737272110069190000000000197272721919000019690000000000
              0061190000000000007171000000000000196100000000000069190000191172
              727219000000000019690011727373BCBC19000000000069725900007273B3BC
              BCBD08616969B37372590000217273BBBCBCBDBDBCBCB3736900000019727261
              73B3BBBBB3737369000000000029000000000000000000000000000000190000
              00000000000000000000}
            OnClick = SpeedButton5Click
          end
          object Label13: TLabel
            Left = 33
            Top = 52
            Width = 37
            Height = 18
            Caption = 'Inicio:'
          end
          object Label14: TLabel
            Left = 264
            Top = 51
            Width = 27
            Height = 18
            Caption = 'Fim:'
          end
          object DataInicial: TDateTimePicker
            Left = 32
            Top = 71
            Width = 186
            Height = 24
            Date = 44108.558903807870000000
            Time = 44108.558903807870000000
            Font.Charset = ANSI_CHARSET
            Font.Color = 1710618
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DataFinal: TDateTimePicker
            Left = 263
            Top = 71
            Width = 186
            Height = 24
            Date = 44108.559046122680000000
            Time = 44108.559046122680000000
            Font.Charset = ANSI_CHARSET
            Font.Color = 1710618
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object cbContaCorrente_RvsD: TComboBox
            Left = 32
            Top = 26
            Width = 443
            Height = 23
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ItemHeight = 0
            ParentFont = False
            TabOrder = 2
            Text = 'CONTA CORRENTE ...'
          end
        end
        object GroupBox3: TGroupBox
          Left = 720
          Top = 56
          Width = 161
          Height = 329
          Caption = 'Op'#231#245'es:'
          TabOrder = 1
          object RadioButton1: TRadioButton
            Left = 16
            Top = 40
            Width = 113
            Height = 17
            Caption = 'Barras'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 1710618
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            OnClick = RadioButton1Click
          end
          object RadioButton2: TRadioButton
            Left = 16
            Top = 72
            Width = 113
            Height = 17
            Caption = 'Pizza'
            Font.Charset = ANSI_CHARSET
            Font.Color = 1710618
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = RadioButton2Click
          end
          object ckResultado: TCheckBox
            Left = 16
            Top = 272
            Width = 97
            Height = 17
            Caption = 'Resultado'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = 1710618
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            State = cbChecked
            TabOrder = 2
            OnClick = ckResultadoClick
          end
        end
        object Chart2: TChart
          Left = 160
          Top = 144
          Width = 537
          Height = 241
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          LeftWall.Brush.Color = clWhite
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          LeftAxis.StartPosition = 2.000000000000000000
          Legend.Font.Charset = ANSI_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -11
          Legend.Font.Name = 'Tahoma'
          Legend.Font.Style = [fsBold]
          View3D = False
          TabOrder = 2
          object Chart3: TChart
            Left = 0
            Top = 0
            Width = 537
            Height = 241
            AllowPanning = pmNone
            AllowZoom = False
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            BackWall.Pen.Visible = False
            Title.Text.Strings = (
              'TChart')
            Title.Visible = False
            AxisVisible = False
            Chart3DPercent = 30
            ClipPoints = False
            Frame.Visible = False
            Legend.Font.Charset = ANSI_CHARSET
            Legend.Font.Color = clBlack
            Legend.Font.Height = -11
            Legend.Font.Name = 'Tahoma'
            Legend.Font.Style = [fsBold]
            View3DOptions.Elevation = 315
            View3DOptions.Orthogonal = False
            View3DOptions.Perspective = 0
            View3DOptions.Rotation = 360
            View3DWalls = False
            TabOrder = 0
            Visible = False
            object Series3: TPieSeries
              Marks.ArrowLength = 8
              Marks.Font.Charset = DEFAULT_CHARSET
              Marks.Font.Color = clBlack
              Marks.Font.Height = -11
              Marks.Font.Name = 'Arial'
              Marks.Font.Style = [fsBold]
              Marks.Style = smsValue
              Marks.Transparent = True
              Marks.Visible = True
              SeriesColor = clRed
              ValueFormat = 'R$ #,##0.00###'
              OtherSlice.Text = 'Other'
              PieValues.DateTime = False
              PieValues.Name = 'Pie'
              PieValues.Multiplier = 1.000000000000000000
              PieValues.Order = loNone
            end
          end
          object Series2: TBarSeries
            Marks.ArrowLength = 20
            Marks.BackColor = 16777170
            Marks.Font.Charset = DEFAULT_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -11
            Marks.Font.Name = 'Arial'
            Marks.Font.Style = [fsBold]
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clRed
            ValueFormat = 'R$ #,##0.00###'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Vendas p/ Per'#237'odo'
        ImageIndex = 2
        object Panel3: TPanel
          Left = 13
          Top = 26
          Width = 233
          Height = 25
          BorderStyle = bsSingle
          Color = clCream
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          object editConsulta: TEdit
            Left = 0
            Top = 1
            Width = 229
            Height = 22
            BorderStyle = bsNone
            Color = clGradientInactiveCaption
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Open Sans'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'Digite seu texto aqui'
            OnChange = editConsultaChange
            OnClick = editConsultaClick
            OnExit = editConsultaExit
          end
        end
        object ListBox1: TListBox
          Left = 13
          Top = 55
          Width = 233
          Height = 335
          Color = clGradientInactiveCaption
          Ctl3D = False
          ItemHeight = 18
          ParentCtl3D = False
          TabOrder = 1
          OnClick = ListBox1Click
        end
        object Chart4: TChart
          Left = 255
          Top = 24
          Width = 683
          Height = 369
          AllowPanning = pmNone
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.Direction = gdBottomTop
          Gradient.EndColor = 14342874
          Gradient.Visible = True
          LeftWall.Brush.Color = clWhite
          LeftWall.Color = 14342874
          LeftWall.Dark3D = False
          LeftWall.Pen.Color = clSilver
          LeftWall.Size = 1
          MarginLeft = 5
          MarginRight = 4
          MarginTop = 20
          Title.Text.Strings = (
            '')
          LeftAxis.AxisValuesFormat = 'R$ #,##0.00###'
          LeftAxis.ExactDateTime = False
          LeftAxis.Grid.Color = clSilver
          LeftAxis.Grid.Style = psSolid
          LeftAxis.Grid.SmallDots = True
          LeftAxis.TickOnLabelsOnly = False
          Legend.HorizMargin = 11
          Legend.Inverted = True
          View3DOptions.Elevation = 360
          View3DOptions.HorizOffset = -7
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 100
          View3DOptions.Rotation = 360
          View3DOptions.VertOffset = -21
          View3DWalls = False
          TabOrder = 2
          object GroupBox4: TGroupBox
            Left = 592
            Top = 96
            Width = 87
            Height = 105
            Caption = 'Mostrar:'
            TabOrder = 0
            object ckVendas: TCheckBox
              Left = 8
              Top = 24
              Width = 73
              Height = 17
              Caption = 'Vendas'
              Checked = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              State = cbChecked
              TabOrder = 0
              OnClick = ckVendasClick
            end
            object ckCompras: TCheckBox
              Left = 8
              Top = 48
              Width = 77
              Height = 17
              Caption = 'Compras'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = ckComprasClick
            end
            object ckLucros: TCheckBox
              Left = 8
              Top = 72
              Width = 75
              Height = 17
              Caption = 'Lucros'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = ckLucrosClick
            end
          end
          object ck3d: TCheckBox
            Left = 593
            Top = 204
            Width = 41
            Height = 17
            Cursor = crHandPoint
            Caption = '3D'
            Checked = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            State = cbChecked
            TabOrder = 1
            OnClick = ck3dClick
          end
          object RadioGroup1: TRadioGroup
            Left = 8
            Top = 8
            Width = 561
            Height = 49
            Caption = 'Alterar tipo de gr'#225'fico:'
            Columns = 4
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemIndex = 0
            Items.Strings = (
              'Linhas'
              'Barras'
              'Horiz. Barras'
              #193'rea')
            Constraints.MinWidth = 5
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnClick = RadioGroup1Click
          end
          object Series4: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = 8421631
            Title = 'Vendas'
            LinePen.Color = clRed
            LinePen.Width = 3
            Pointer.Draw3D = False
            Pointer.InflateMargins = True
            Pointer.Pen.Color = clMaroon
            Pointer.Style = psCircle
            Pointer.Visible = True
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series5: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = 16744576
            Title = 'Compras'
            LinePen.Color = 16744448
            LinePen.Width = 3
            Pointer.InflateMargins = True
            Pointer.Pen.Color = clBlue
            Pointer.Style = psCircle
            Pointer.Visible = True
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series6: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = 10143323
            Title = 'Lucros'
            LinePen.Color = 4259584
            LinePen.Width = 3
            Pointer.InflateMargins = True
            Pointer.Style = psCircle
            Pointer.Visible = True
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series7: TBarSeries
            Active = False
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = 8421631
            Title = 'Vendas'
            ValueFormat = 'R$ #,##0.00###'
            BarPen.Visible = False
            MultiBar = mbNone
            SideMargins = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series8: TBarSeries
            Active = False
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = 16744576
            Title = 'Compras'
            ValueFormat = 'R$ #,##0.00###'
            BarPen.Visible = False
            MultiBar = mbNone
            SideMargins = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series9: TBarSeries
            Active = False
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = 10143323
            Title = 'Lucros'
            ValueFormat = 'R$ #,##0.00###'
            BarPen.Visible = False
            Dark3D = False
            MultiBar = mbNone
            SideMargins = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series10: THorizBarSeries
            Marks.ArrowLength = 20
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = 8421631
            Title = 'Vendas'
            ValueFormat = 'R$ #,##0.00###'
            BarPen.Visible = False
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loNone
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series11: THorizBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = False
            SeriesColor = 16744576
            Title = 'Compras'
            BarPen.Visible = False
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loNone
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series12: THorizBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = False
            SeriesColor = 10143323
            Title = 'Lucros'
            BarPen.Visible = False
            MultiBar = mbNone
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loNone
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series13: TAreaSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = 8421631
            Title = 'Vendas'
            AreaLinesPen.Visible = False
            DrawArea = True
            LinePen.Color = 4194432
            LinePen.Width = 4
            LinePen.Visible = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series14: TAreaSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = 16744576
            Title = 'Compras'
            AreaLinesPen.Visible = False
            DrawArea = True
            LinePen.Visible = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series15: TAreaSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = 11454043
            Title = 'Lucros'
            AreaLinesPen.Visible = False
            DrawArea = True
            LinePen.Visible = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object ckVendTotal: TCheckBox
          Left = 13
          Top = 8
          Width = 132
          Height = 17
          Caption = 'Todas as Vendas'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 3
          OnClick = ckVendTotalClick
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Balan'#231'o Vendas p/Cliente'
        ImageIndex = 3
        object SpeedButton8: TSpeedButton
          Left = 220
          Top = 24
          Width = 29
          Height = 25
          Cursor = crHandPoint
          Glyph.Data = {
            82060000424D8206000000000000420000002800000014000000140000000100
            20000300000040060000983A0000983A000000000000000000000000FF0000FF
            0000FF00000000000000000000000000000000000000000000010000000E0000
            0B280000203F00002A500000295700001F5207051744153D1759003800840035
            0088002B017D00070024000A0000000000000000000000000000000000000411
            5A0002072A10071968530C2588990E2C9EC90F2FA5DD0F2EA7E20D29A3E40921
            9CE10E1C95DC296C5DE929B043FB22AD3FFD0D7719E5000B0043005C00000000
            000000000000000000000F2DA2000E2B9E101135AA931542BEEE1C57D2FF1D5A
            D5FF1C57D4FF1A52D0FF1D4ECDFF204BC8FF2144C6FF367D7EFF4EDB75FF3DDA
            6FFF1C8A37F40F15308A00000030000000190000000200000000133DC100133C
            BF301C55D2EC1F5FD9FF2269DFFF2166DDFF2062DAFF1C5AD7FF2F67C5FF2E8B
            6EFF298D61FF2C9E50FF4DDD79FF41DC72FF21A23FFF13722FE80A6C13D60134
            03800000000800000000184BCB001749CA262165DCE52674E6FF2674E6FF2571
            E4FF236CE0FF2063DDFF2F6FC0FF44BF67FF49E474FF47E175FF4BE47EFF47E0
            7AFF3ED86DFF3AD568FF27B948FF0449079800000009000000001C58D9001A53
            D615236CE2CA297EEDFF2A80EEFF287CEBFF2674E6FF226AE2FF3074C3FF4EC6
            70FF5FF18AFF5BEC88FF53E984FF4BE47EFF4DE17DFF4EDE7CFF32BF54FF044D
            089400000008000000001B5DDC00011BB6022572E5952C87F3FF2E8BF6FF2B85
            F1FF2677E9FF216AE1FF3174CFFF3A9A7AFF40A279FF42B166FF5CE986FF4CE6
            7EFF2EB045F62C9738BB219B2FA6035C064D0000000100000000000000002777
            E8002674E93E2D87F4E93092FBFF2F85EFFF628BCFFF6F87BCFF4468C0FF255A
            D1FF2657D0FF3A8D84FF5DEB85FF4EE980FF1A932BE7000D003C001D00000000
            00000000000000000000000000002776EF00236AEA03297DED702B86F3EE3883
            E8FFB1BACBFFB4BABDFF949CACFF3C57B4FF1B4ACEFF348781FE50D368F74CD3
            6BF71B952AD50013002C00250000000000000000000000000000000000000000
            00002474E7002476EC052370E04C2E79E1CE65A9F0FF5BAAF4FF58A6EDFF4985
            D6FF183FB2E62D54839710811B430C8C0B38057F072D00370005004500000000
            00000000000000000000000000000000000000000000328CE2002C7FCF2E47A0
            F4D456AFFFFF58B0FFFF54AEFFFF4DAAFFFF3381CFDE091E3460000000050000
            0000000000000000000000000000000000000000000000000000000000000000
            00002677BC0000276302429DF38F60B5FEFF66B9FFFF64B7FFFF60B5FFFF5BB2
            FFFF4EA9FCFE235E94AA0000001C020508000000000000000000000000000000
            0000000000000000000000000000000000002F94EE00248CE91454ADFBCA70BF
            FFFF71C0FFFF6FBFFFFF6BBBFFFF64B7FFFF5BB2FFFF3680C4CD01080E410000
            0004000000000000000000000000000000000000000000000000000000000000
            00002F91EE002789E52660B4FDE47DC6FFFF7DC7FFFF7AC5FFFF74C1FFFF6CBC
            FFFF64B8FFFF3991D9EC013E5CA2000101270003040000000000000000000000
            000000000000000000000000000000252300177BC1000D71B3535EB0EFF889CE
            FFFF89CEFFFF85CBFFFF7CC6FFFF72BFFEFF4AA5E5FF1C8AC7FF006792E00012
            1A4400FFFF000000000000000000000000000000000000000000000000000030
            2E00046BA40000669D664EA1D5FF92D4FFFF94D5FFFF8DD0FFFF82CAFFFF6BBB
            F5FF1288BDFF0085B8FF0075A3E50023314B0000000000000000000000000000
            00000000000000000000000000000000000000699D0000659A562382B4F986CB
            F5FF98D8FFFF8FD2FFFF85CCFFFF52ACE3FF0389BCFF008EC1FF0079A7E00024
            323C0093CE000000000000000000000000000000000000000000000000000000
            000000689C0000679B2C026DA1E2318FBFFF66B5E3FF67B7E8FF51ACE0FF1891
            C5FF008FC2FF0092C6FF0076A1BC000C121B00141C0000000000000000000000
            00000000000000000000000000000000000000679C0000619705006B9F880073
            A7FA057CAFFF0682B5FF0287BAFF008DC0FF0093C6FF008FC1E900658A590000
            0002000305000000000000000000000000000000000000000000000000000000
            00000000000000679A0000669A13006EA27F0076A8CF007BADDB007FB1C40086
            B8C6008ABCBD007FAD5E002E3F08004F6B000000000000000000000000000000
            000000000000}
          OnClick = SpeedButton8Click
        end
        object Chart5: TChart
          Left = 272
          Top = 31
          Width = 609
          Height = 354
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Title.Text.Strings = (
            'Clientes')
          AxisVisible = False
          LeftAxis.AxisValuesFormat = 'R$ #,##0.00###'
          Legend.Alignment = laBottom
          Legend.DividingLines.Visible = True
          Legend.Font.Charset = DEFAULT_CHARSET
          Legend.Font.Color = clGray
          Legend.Font.Height = -8
          Legend.Font.Name = 'Arial'
          Legend.Font.Style = [fsBold]
          Legend.LegendStyle = lsValues
          Legend.TextStyle = ltsPlain
          View3D = False
          View3DWalls = False
          TabOrder = 0
          object BarSeries1: TBarSeries
            ColorEachPoint = True
            Marks.ArrowLength = 20
            Marks.Font.Charset = DEFAULT_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -11
            Marks.Font.Name = 'Arial'
            Marks.Font.Style = [fsBold]
            Marks.Frame.Visible = False
            Marks.Style = smsValue
            Marks.Transparent = True
            Marks.Visible = True
            SeriesColor = clRed
            ValueFormat = 'R$ #,##0.00###'
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object listCliente: TListBox
          Left = 16
          Top = 56
          Width = 233
          Height = 329
          Color = clGradientInactiveCaption
          Ctl3D = False
          ItemHeight = 18
          ParentCtl3D = False
          TabOrder = 1
        end
        object Panel2: TPanel
          Left = 16
          Top = 24
          Width = 201
          Height = 25
          Color = clWindow
          TabOrder = 2
          object cbCliente: TComboBox
            Left = -1
            Top = 1
            Width = 203
            Height = 24
            CharCase = ecUpperCase
            Color = clGradientInactiveCaption
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 16
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Text = 'ESCOLHA O CLIENTE DESEJADO'
            Items.Strings = (
              '')
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Plano de Contas'
        ImageIndex = 4
        object Label11: TLabel
          Left = 17
          Top = 22
          Width = 102
          Height = 18
          Caption = 'Gr'#225'fico anal'#237'tico:'
        end
        object Label12: TLabel
          Left = 368
          Top = 172
          Width = 298
          Height = 29
          Caption = 'N'#227'o h'#225' items para exibi'#231#227'o!'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rdDespesas: TRadioButton
          Left = 128
          Top = 24
          Width = 81
          Height = 17
          Caption = 'Despesas'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          OnClick = rdDespesasClick
        end
        object rdReceitas: TRadioButton
          Left = 216
          Top = 24
          Width = 113
          Height = 17
          Caption = 'Receitas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rdReceitasClick
        end
        object Chart6: TChart
          Left = 16
          Top = 56
          Width = 913
          Height = 321
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Gradient.Direction = gdFromCenter
          Gradient.EndColor = clGray
          Gradient.Visible = True
          MarginBottom = 10
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 5
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'Open Sans SemiBold'
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            '               Ultimas 10 Despesas e Receitas')
          Title.Visible = False
          AxisVisible = False
          Chart3DPercent = 35
          ClipPoints = False
          Frame.Visible = False
          LeftAxis.Grid.Color = -1
          LeftAxis.Grid.Style = psSolid
          LeftAxis.MinorGrid.Visible = True
          LeftAxis.MinorTicks.Color = -1
          Legend.Alignment = laLeft
          Legend.ColorWidth = 10
          Legend.TopPos = 18
          View3D = False
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DWalls = False
          TabOrder = 2
          object Label8: TLabel
            Left = 0
            Top = 296
            Width = 403
            Height = 16
            Caption = 'Total acumulado de despesas e receitas por plano de contas'
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label9: TLabel
            Left = 0
            Top = 13
            Width = 41
            Height = 16
            Caption = 'Inicio:'
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label10: TLabel
            Left = 175
            Top = 13
            Width = 36
            Height = 16
            Caption = 'Final:'
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object btnAtualizar: TSpeedButton
            Left = 336
            Top = 7
            Width = 23
            Height = 26
            Cursor = crHandPoint
            Glyph.Data = {
              26050000424D26050000000000003604000028000000100000000F0000000100
              080000000000F000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
              000000000000290000000000697273737373737361722919000000697273BBBC
              BCBCBCBC7372722100005972727369696108BDBCBC7372710000592969000000
              000019BCBB737272110069190000000000197272721919000019690000000000
              0061190000000000007171000000000000196100000000000069190000191172
              727219000000000019690011727373BCBC19000000000069725900007273B3BC
              BCBD08616969B37372590000217273BBBCBCBDBDBCBCB3736900000019727261
              73B3BBBBB3737369000000000029000000000000000000000000000000190000
              00000000000000000000}
            OnClick = btnAtualizarClick
          end
          object dtInicio: TDateTimePicker
            Left = 44
            Top = 8
            Width = 125
            Height = 24
            Date = 44116.818933391200000000
            Time = 44116.818933391200000000
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dtFinal: TDateTimePicker
            Left = 213
            Top = 8
            Width = 124
            Height = 24
            Date = 44116.819288437500000000
            Time = 44116.819288437500000000
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object PieSeries1: TPieSeries
            Marks.Arrow.Color = clBlack
            Marks.ArrowLength = 1
            Marks.BackColor = clWhite
            Marks.Font.Charset = ANSI_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -8
            Marks.Font.Name = 'Tahoma'
            Marks.Font.Style = [fsBold]
            Marks.Frame.Visible = False
            Marks.Style = smsLabelPercent
            Marks.Transparent = True
            Marks.Visible = True
            SeriesColor = clRed
            ValueFormat = 'R$ #,##0.00###'
            CustomXRadius = 125
            CustomYRadius = 125
            CircleBackColor = clSilver
            OtherSlice.Style = poBelowPercent
            OtherSlice.Text = 'Other'
            PiePen.Color = clSilver
            PiePen.Style = psDashDotDot
            PiePen.Width = 2
            PiePen.SmallDots = True
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1.000000000000000000
            PieValues.Order = loNone
            RotationAngle = 25
          end
        end
        object cbContaCorrente: TComboBox
          Left = 656
          Top = 19
          Width = 273
          Height = 23
          Cursor = crHandPoint
          Color = clSkyBlue
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ItemHeight = 15
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Text = 'Escolha a conta que deseja vizualizar'
          OnChange = cbContaCorrenteChange
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Movimenta'#231#245'es'
        ImageIndex = 5
        object Label15: TLabel
          Left = 212
          Top = 48
          Width = 20
          Height = 18
          Caption = 'At'#233
        end
        object Label16: TLabel
          Left = 544
          Top = 20
          Width = 146
          Height = 18
          Caption = 'Conta de Movimenta'#231#227'o:'
        end
        object btnRefresh: TSpeedButton
          Left = 427
          Top = 40
          Width = 26
          Height = 24
          Glyph.Data = {
            26050000424D26050000000000003604000028000000100000000F0000000100
            080000000000F000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
            000000000000290000000000697273737373737361722919000000697273BBBC
            BCBCBCBC7372722100005972727369696108BDBCBC7372710000592969000000
            000019BCBB737272110069190000000000197272721919000019690000000000
            0061190000000000007171000000000000196100000000000069190000191172
            727219000000000019690011727373BCBC19000000000069725900007273B3BC
            BCBD08616969B37372590000217273BBBCBCBDBDBCBCB3736900000019727261
            73B3BBBBB3737369000000000029000000000000000000000000000000190000
            00000000000000000000}
          OnClick = btnRefreshClick
        end
        object Button1: TButton
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = '7 Dias'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 104
          Top = 8
          Width = 75
          Height = 25
          Caption = '30 dias'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 192
          Top = 8
          Width = 75
          Height = 25
          Caption = '3 Meses'
          TabOrder = 2
          OnClick = Button3Click
        end
        object editIniDataMov: TDateTimePicker
          Left = 16
          Top = 40
          Width = 186
          Height = 26
          Date = 44266.854832569440000000
          Time = 44266.854832569440000000
          TabOrder = 3
        end
        object editFinalDataMov: TDateTimePicker
          Left = 240
          Top = 40
          Width = 186
          Height = 26
          Date = 44266.854882951390000000
          Time = 44266.854882951390000000
          TabOrder = 4
        end
        object Chart7: TChart
          Left = 16
          Top = 72
          Width = 913
          Height = 313
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Color = clSilver
          BottomWall.Brush.Color = clWhite
          MarginBottom = 5
          MarginLeft = 5
          MarginRight = 10
          MarginTop = 10
          Title.Text.Strings = (
            '')
          BackColor = clSilver
          Legend.HorizMargin = 49
          Legend.LegendStyle = lsSeries
          Legend.TextStyle = ltsRightValue
          View3DOptions.Elevation = 344
          View3DOptions.HorizOffset = 19
          View3DOptions.Rotation = 347
          View3DOptions.VertOffset = -19
          BevelOuter = bvNone
          TabOrder = 5
          object Series16: TLineSeries
            Marks.ArrowLength = 20
            Marks.Font.Charset = ANSI_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -8
            Marks.Font.Name = 'Arial Narrow'
            Marks.Font.Style = [fsBold]
            Marks.Frame.Visible = False
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clRed
            Title = 'Despesa'
            ValueFormat = 'R$ ##.00'
            Dark3D = False
            Pointer.Dark3D = False
            Pointer.Draw3D = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series17: TLineSeries
            Marks.Arrow.Color = clNavy
            Marks.Arrow.Visible = False
            Marks.ArrowLength = 8
            Marks.Font.Charset = DEFAULT_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -9
            Marks.Font.Name = 'Arial'
            Marks.Font.Style = [fsBold]
            Marks.Frame.Visible = False
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clGreen
            Title = 'Receita'
            ValueFormat = 'R$ 00.00'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object cbContaCorrente_Mov: TComboBox
          Left = 544
          Top = 40
          Width = 273
          Height = 26
          ItemHeight = 0
          TabOrder = 6
          Text = 'Escolha a conta corrente...'
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 5
      Width = 929
      Height = 45
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 98
        Height = 23
        Caption = 'Dashboard:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 813
        Top = 8
        Width = 105
        Height = 31
        Caption = 'Fechar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000162AC70419C2
          0418BF0416BD0414BA0413B70412B30410B0040FAD040DAA040BA6040AA30409
          A10408A004069D1E1F901B38DF001FDA001ED80422D91938DF021CD20019CC00
          17C90015C50012C11B32CE1123C4000BB3000AAF0006A704069C1D3EE90024E5
          0125E64C6AEBADBBE93C5BE9001EDA001CD40019D02540DCAFBFF68EA1EF1024
          C8000DB7000AAF03069E2144F00027EE4363EEC8CDE2E7E5E0C3CBEA3A5AEB00
          1EDC1F3FE3AEBEF6FCFBF9F7F9FC8CA0F10F24C8000AB20307A02349F83E5DEF
          C4CADFE1E1DEE3E3E3EBEAE7C6CFEF4D6DF2A6B7F6FBFAF9FCFCFCFFFFFEF8FA
          FF8CA0F10F21C20308A22850FC6C81E8DEDDDBE0E0E0E4E4E4E9E9E9EFEFEDE5
          E9F3F5F5F7FBFBFBFEFEFEFFFFFFFFFFFFB8C8FC1F35CF0308A52C5AFF0C3CFA
          8294E8E1E1E0E6E6E5EAEAEAEEEEEEF4F4F3F8F8F8FCFCFCFFFFFFFFFFFFBCCB
          FC2E4AE00012C0030BA93264FF033EFF1041FA8697EBE4E4E6EBEBEAEFEFEFF4
          F4F4F8F8F8FDFDFDFEFEFFB8C6FC2948E60019D00014C4030DAC386DFF0848FF
          0644FF1C48F6C0C6E8EDEDEAEFEFEFF4F4F4F8F8F8FEFEFDEEF2FF4A6AF4001D
          DB001CD40017C8030FB03F76FF0B4FFF1148F58093E6E2E3E5EAEAEAEFEFEFF4
          F4F4F8F8F8FDFDFDFFFFFFC0CDFD2B4CEC001DD80018CB0310B3447FFF134DF1
          7E8EDEE0DFE0E5E5E5E9E9E9EEEEEEF4F4F2F7F7F7FBFBFBFEFEFEFFFFFFC0CD
          FD2A4BE90019CF0312B64679F3697BD4DCDBDAE0E0DFE3E3E3E8E8E8EDEDECD8
          DBF0F2F3F5FAFAF9FDFDFDFFFFFFFFFFFFB5C5FD1636DE0313B94E88F94567D9
          C4C4D6E0E0DEE2E2E2E9E9E6AAB4EA3154F495A5F4F7F7F6FAFAFAFEFEFDF1F4
          FF758FF80927DA0315BD5899FF1666F84869D9C6C7D8E6E5E0A8AFE12550F104
          42FE1544FA99A8F3F8F8F6F0F2F9708AF9062AE7001DD60317C05EA0FF1C76FF
          1766F7496AD99198D52652EA0A4DFE0948FF033EFF123FF992A1F36D85F6052B
          EF0023E4001ED90217C290C2FF4B95FF448DFF3C7BF73967EB3270FD2E6BFF29
          61FF2358FF1C4DFF2149FA1B41F6143AEF1235E8122FDD1529C8}
        OnClick = SpeedButton1Click
      end
      object Panel7: TPanel
        Left = 109
        Top = 16
        Width = 235
        Height = 25
        Color = clWindow
        TabOrder = 0
        object cbPesquisa: TComboBox
          Left = -2
          Top = -2
          Width = 240
          Height = 26
          Color = clGradientActiveCaption
          Ctl3D = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Open Sans SemiBold'
          Font.Style = [fsBold]
          ItemHeight = 18
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Text = 'Contas Pagar / Receber'
          OnChange = cbPesquisaChange
          Items.Strings = (
            'Contas Pagar / Receber'
            'Despesas / Receitas'
            'Vendas p/ Per'#237'odo'
            'Balan'#231'o de Vendas'
            'Plano de Contas'
            'Movimentac'#245'es')
        end
      end
    end
  end
  object tbl_ContasPagar: TTable
    Active = True
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_ContasDetalhes.DB'
    Left = 519
    Top = 32
    object tbl_ContasPagarCod_ContasDetalhes: TIntegerField
      FieldName = 'Cod_ContasDetalhes'
    end
    object tbl_ContasPagarNum_ParcContasDetalhes: TIntegerField
      FieldName = 'Num_ParcContasDetalhes'
    end
    object tbl_ContasPagarValor_ParcContasDetalhes: TCurrencyField
      FieldName = 'Valor_ParcContasDetalhes'
    end
    object tbl_ContasPagarValor_RestContasDetalhes: TCurrencyField
      FieldName = 'Valor_RestContasDetalhes'
    end
    object tbl_ContasPagarData_VencContasDetalhes: TDateField
      FieldName = 'Data_VencContasDetalhes'
    end
    object tbl_ContasPagarData_PagContasDetalhes: TDateField
      FieldName = 'Data_PagContasDetalhes'
    end
    object tbl_ContasPagarStatus_ContasDetalhes: TStringField
      FieldName = 'Status_ContasDetalhes'
      Size = 10
    end
    object tbl_ContasPagarId_ContasPagar: TIntegerField
      FieldName = 'Id_ContasPagar'
    end
    object tbl_ContasPagarNum_DocContasDetalhes: TStringField
      FieldName = 'Num_DocContasDetalhes'
    end
    object tbl_ContasPagarFornecedor_ContasDetalhes: TStringField
      FieldName = 'Fornecedor_ContasDetalhes'
      Size = 60
    end
  end
  object ds_ContasPagar: TDataSource
    DataSet = tbl_ContasPagar
    Left = 487
    Top = 32
  end
  object ds_ContasReceber: TDataSource
    DataSet = tbl_ContasReceber
    Left = 479
    Top = 56
  end
  object tbl_ContasReceber: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_ContasReceber.DB'
    Left = 519
    Top = 56
    object tbl_ContasReceberCod_ContasReceber: TIntegerField
      FieldName = 'Cod_ContasReceber'
    end
    object tbl_ContasReceberCliente_ContasReceber: TStringField
      FieldName = 'Cliente_ContasReceber'
      Size = 60
    end
    object tbl_ContasReceberNum_DocContasReceber: TStringField
      FieldName = 'Num_DocContasReceber'
    end
    object tbl_ContasReceberQtd_ParcContasReceber: TIntegerField
      FieldName = 'Qtd_ParcContasReceber'
    end
    object tbl_ContasReceberValor_ContasReceber: TCurrencyField
      FieldName = 'Valor_ContasReceber'
    end
    object tbl_ContasReceberData_ContasReceber: TDateField
      FieldName = 'Data_ContasReceber'
    end
    object tbl_ContasReceberData_VencContasReceber: TDateField
      FieldName = 'Data_VencContasReceber'
    end
    object tbl_ContasReceberTipo_ReceitaContasReceber: TStringField
      FieldName = 'Tipo_ReceitaContasReceber'
      Size = 60
    end
    object tbl_ContasReceberQuitado_ContasReceber: TDateField
      FieldName = 'Quitado_ContasReceber'
    end
    object tbl_ContasReceberFalta_ContasReceber: TCurrencyField
      FieldName = 'Falta_ContasReceber'
    end
    object tbl_ContasReceberRecebido_ContasReceber: TCurrencyField
      FieldName = 'Recebido_ContasReceber'
    end
    object tbl_ContasReceberObs_ContasReceber: TStringField
      FieldName = 'Obs_ContasReceber'
      Size = 100
    end
  end
  object tbl_Movimentacoes: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Movimentacao.db'
    Left = 594
    Top = 55
    object tbl_MovimentacoesCod_Movimentacao: TAutoIncField
      FieldName = 'Cod_Movimentacao'
      ReadOnly = True
    end
    object tbl_MovimentacoesId_Movimentacao: TIntegerField
      FieldName = 'Id_Movimentacao'
    end
    object tbl_MovimentacoesData_Movimentacao: TDateField
      FieldName = 'Data_Movimentacao'
    end
    object tbl_MovimentacoesHistorico_Movimentacao: TStringField
      FieldName = 'Historico_Movimentacao'
      Size = 60
    end
    object tbl_MovimentacoesDebito_Movimentacao: TCurrencyField
      FieldName = 'Debito_Movimentacao'
    end
    object tbl_MovimentacoesCredito_Movimentacao: TCurrencyField
      FieldName = 'Credito_Movimentacao'
    end
    object tbl_MovimentacoesConciliado_Movimentacao: TStringField
      FieldName = 'Conciliado_Movimentacao'
      Size = 3
    end
    object tbl_MovimentacoesData_FinalMovimentacao: TDateField
      FieldName = 'Data_FinalMovimentacao'
    end
    object tbl_MovimentacoesExtrato_Movimentacao: TGraphicField
      FieldName = 'Extrato_Movimentacao'
      BlobType = ftGraphic
    end
    object tbl_MovimentacoesDocumento_Movimentacao: TStringField
      FieldName = 'Documento_Movimentacao'
      Size = 60
    end
    object tbl_MovimentacoesPlanoConta_Movimentacao: TStringField
      FieldName = 'PlanoConta_Movimentacao'
      Size = 60
    end
    object tbl_MovimentacoesFoto_Movimentacao: TStringField
      FieldName = 'Foto_Movimentacao'
      Size = 225
    end
  end
  object ds_Movimentacoes: TDataSource
    DataSet = tbl_Movimentacoes
    Left = 562
    Top = 55
  end
  object tbl_Clientes: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Cliente.DB'
    Left = 258
    Top = 63
    object tbl_ClientesCod_Cliente: TIntegerField
      FieldName = 'Cod_Cliente'
    end
    object tbl_ClientesNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 50
    end
    object tbl_ClientesEndereco_Cliente: TStringField
      FieldName = 'Endereco_Cliente'
      Size = 50
    end
    object tbl_ClientesBairro_Cliente: TStringField
      FieldName = 'Bairro_Cliente'
      Size = 30
    end
    object tbl_ClientesCidade_Cliente: TStringField
      FieldName = 'Cidade_Cliente'
    end
    object tbl_ClientesUF_Cliente: TStringField
      FieldName = 'UF_Cliente'
      Size = 2
    end
    object tbl_ClientesTelefone_Cliente: TStringField
      FieldName = 'Telefone_Cliente'
      Size = 12
    end
    object tbl_ClientesCelular_Cliente: TStringField
      FieldName = 'Celular_Cliente'
      Size = 11
    end
    object tbl_ClientesEmpresa_Cliente: TStringField
      FieldName = 'Empresa_Cliente'
    end
    object tbl_ClientesRG_Cliente: TStringField
      FieldName = 'RG_Cliente'
      Size = 14
    end
    object tbl_ClientesCPF_Cliente: TStringField
      FieldName = 'CPF_Cliente'
      Size = 14
    end
    object tbl_ClientesData_Cad: TDateField
      FieldName = 'Data_Cad'
    end
    object tbl_ClientesPrivilegio_Cliente: TStringField
      FieldName = 'Privilegio_Cliente'
      Size = 10
    end
  end
  object tbl_VendTotal: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_VendTotal.DB'
    Left = 290
    Top = 63
    object tbl_VendTotalCodVendTotal: TIntegerField
      FieldName = 'CodVendTotal'
    end
    object tbl_VendTotalCliente_VendTotal: TStringField
      FieldName = 'Cliente_VendTotal'
      Size = 60
    end
    object tbl_VendTotalUsuario_VendTotal: TStringField
      FieldName = 'Usuario_VendTotal'
      Size = 40
    end
    object tbl_VendTotalTotal_VendTotal: TCurrencyField
      FieldName = 'Total_VendTotal'
    end
    object tbl_VendTotalData_VendTotal: TDateField
      FieldName = 'Data_VendTotal'
    end
    object tbl_VendTotalDataVenc_VendTotal: TDateField
      FieldName = 'DataVenc_VendTotal'
    end
    object tbl_VendTotalPrazo_VendTotal: TIntegerField
      FieldName = 'Prazo_VendTotal'
    end
    object tbl_VendTotalFormPag_VendTotal: TStringField
      FieldName = 'FormPag_VendTotal'
      Size = 30
    end
    object tbl_VendTotalSituacao_VendTotal: TStringField
      FieldName = 'Situacao_VendTotal'
      Size = 30
    end
    object tbl_VendTotalFrete_VendTotal: TCurrencyField
      FieldName = 'Frete_VendTotal'
    end
  end
  object tbl_Mes: TTable
    Active = True
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_VendTotal.DB'
    Left = 626
    Top = 55
    object tbl_MesCodVendTotal: TIntegerField
      FieldName = 'CodVendTotal'
    end
    object tbl_MesCliente_VendTotal: TStringField
      FieldName = 'Cliente_VendTotal'
      Size = 60
    end
    object tbl_MesUsuario_VendTotal: TStringField
      FieldName = 'Usuario_VendTotal'
      Size = 40
    end
    object tbl_MesTotal_VendTotal: TCurrencyField
      FieldName = 'Total_VendTotal'
    end
    object tbl_MesData_VendTotal: TDateField
      FieldName = 'Data_VendTotal'
    end
    object tbl_MesDataVenc_VendTotal: TDateField
      FieldName = 'DataVenc_VendTotal'
    end
    object tbl_MesPrazo_VendTotal: TIntegerField
      FieldName = 'Prazo_VendTotal'
    end
    object tbl_MesFormPag_VendTotal: TStringField
      FieldName = 'FormPag_VendTotal'
      Size = 30
    end
    object tbl_MesSituacao_VendTotal: TStringField
      FieldName = 'Situacao_VendTotal'
      Size = 30
    end
    object tbl_MesFrete_VendTotal: TCurrencyField
      FieldName = 'Frete_VendTotal'
    end
  end
  object tbl_Compras: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_CompTotal.db'
    Left = 319
    Top = 64
    object tbl_ComprasCod_CompTotal: TIntegerField
      FieldName = 'Cod_CompTotal'
    end
    object tbl_ComprasFornecedor_CompTotal: TStringField
      FieldName = 'Fornecedor_CompTotal'
      Size = 60
    end
    object tbl_ComprasLote_CompTotal: TStringField
      FieldName = 'Lote_CompTotal'
    end
    object tbl_ComprasData_CompTotal: TDateField
      FieldName = 'Data_CompTotal'
    end
    object tbl_ComprasTotal_CompTotal: TCurrencyField
      FieldName = 'Total_CompTotal'
    end
    object tbl_ComprasFormPag_CompTotal: TStringField
      FieldName = 'FormPag_CompTotal'
      Size = 30
    end
    object tbl_ComprasUsuario_CompTotal: TStringField
      FieldName = 'Usuario_CompTotal'
      Size = 30
    end
    object tbl_ComprasDataVenc_CompTotal: TDateField
      FieldName = 'DataVenc_CompTotal'
    end
    object tbl_ComprasPrazo_CompTotal: TIntegerField
      FieldName = 'Prazo_CompTotal'
    end
    object tbl_ComprasFrete_CompTotal: TCurrencyField
      FieldName = 'Frete_CompTotal'
    end
    object tbl_ComprasSituacao_CompTotal: TStringField
      FieldName = 'Situacao_CompTotal'
      Size = 30
    end
  end
  object tbl_Plano: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Planos.db'
    Left = 351
    Top = 66
    object tbl_PlanoCod_Planos: TAutoIncField
      FieldName = 'Cod_Planos'
      ReadOnly = True
    end
    object tbl_PlanoDescricao_Planos: TStringField
      FieldName = 'Descricao_Planos'
      Size = 100
    end
    object tbl_PlanoDoc_Planos: TStringField
      FieldName = 'Doc_Planos'
      Size = 60
    end
    object tbl_PlanoValor_Planos: TCurrencyField
      FieldName = 'Valor_Planos'
    end
    object tbl_PlanoData_Planos: TDateField
      FieldName = 'Data_Planos'
    end
    object tbl_PlanoDataVenc_Planos: TDateField
      FieldName = 'DataVenc_Planos'
    end
    object tbl_PlanoTipo_Planos: TStringField
      FieldName = 'Tipo_Planos'
      Size = 1
    end
    object tbl_PlanoId_PlanoContas: TIntegerField
      FieldName = 'Id_PlanoContas'
    end
    object tbl_Planoid_ContaCorrente: TIntegerField
      FieldName = 'id_ContaCorrente'
    end
  end
  object DataSource1: TDataSource
    DataSet = tbl_Plano
    Left = 394
    Top = 63
  end
  object tbl_PlanoContas: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_PlanoContas.DB'
    Left = 370
    Top = 39
    object tbl_PlanoContasCod_PlanoContas: TIntegerField
      FieldName = 'Cod_PlanoContas'
    end
    object tbl_PlanoContasDescricao_PlanoContas: TStringField
      FieldName = 'Descricao_PlanoContas'
      Size = 60
    end
    object tbl_PlanoContasSequencia_PlanoContas: TStringField
      FieldName = 'Sequencia_PlanoContas'
      Size = 16
    end
    object tbl_PlanoContasTipo_PlanoContas: TStringField
      FieldName = 'Tipo_PlanoContas'
      Size = 16
    end
    object tbl_PlanoContasCategoria_PlanoContas: TStringField
      FieldName = 'Categoria_PlanoContas'
      Size = 1
    end
    object tbl_PlanoContasAtivo_PlanoContas: TStringField
      FieldName = 'Ativo_PlanoContas'
      Size = 1
    end
    object tbl_PlanoContasValorTotal_PlanoContas: TCurrencyField
      FieldName = 'ValorTotal_PlanoContas'
    end
  end
  object tbl_ContaCorrente: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_ContaCorrente.DB'
    Left = 562
    Top = 31
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
  object tbl_DataMov: TTable
    DatabaseName = 'HortiFrut'
    TableName = 'tbl_Movimentacao.db'
    Left = 898
    Top = 407
  end
end
