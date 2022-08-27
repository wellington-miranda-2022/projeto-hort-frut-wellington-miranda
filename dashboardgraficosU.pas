unit dashboardgraficosU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, TeEngine, Series,
  TeeProcs, Chart, DbChart, DB, DBTables, ComCtrls, Math, DateUtils, Mask,
  DBCtrls;

type
  Tfrm_DashboardGraficos = class(TForm)
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton4: TSpeedButton;
    Label4: TLabel;
    ComboBox1: TComboBox;
    ds_ContasReceber: TDataSource;
    ds_ContasPagar: TDataSource;
    tbl_ContasReceber: TTable;
    tbl_ContasReceberCod_ContasReceber: TIntegerField;
    tbl_ContasReceberCliente_ContasReceber: TStringField;
    tbl_ContasReceberNum_DocContasReceber: TStringField;
    tbl_ContasReceberQtd_ParcContasReceber: TIntegerField;
    tbl_ContasReceberValor_ContasReceber: TCurrencyField;
    tbl_ContasReceberData_ContasReceber: TDateField;
    tbl_ContasReceberData_VencContasReceber: TDateField;
    tbl_ContasReceberTipo_ReceitaContasReceber: TStringField;
    tbl_ContasReceberQuitado_ContasReceber: TDateField;
    tbl_ContasReceberFalta_ContasReceber: TCurrencyField;
    tbl_ContasReceberRecebido_ContasReceber: TCurrencyField;
    tbl_ContasReceberObs_ContasReceber: TStringField;
    tbl_ContasPagar: TTable;
    tbl_ContasPagarCod_ContasDetalhes: TIntegerField;
    tbl_ContasPagarNum_ParcContasDetalhes: TIntegerField;
    tbl_ContasPagarValor_ParcContasDetalhes: TCurrencyField;
    tbl_ContasPagarValor_RestContasDetalhes: TCurrencyField;
    tbl_ContasPagarData_VencContasDetalhes: TDateField;
    tbl_ContasPagarData_PagContasDetalhes: TDateField;
    tbl_ContasPagarStatus_ContasDetalhes: TStringField;
    tbl_ContasPagarId_ContasPagar: TIntegerField;
    tbl_ContasPagarNum_DocContasDetalhes: TStringField;
    tbl_ContasPagarFornecedor_ContasDetalhes: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SrContas: TChart;
    Panel2: TPanel;
    Series2: TPieSeries;
    editPagar: TEdit;
    editReceber: TEdit;
    lblData: TLabel;
    Label3: TLabel;
    btn7dias: TSpeedButton;
    btnAmanh: TSpeedButton;
    btnHoje: TSpeedButton;
    Label1: TLabel;
    DBContasPagar: TDBGrid;
    DBContasReceber: TDBGrid;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    tbl_Movimentacoes: TTable;
    DataInicio: TDateTimePicker;
    DataFinal: TDateTimePicker;
    Label6: TLabel;
    tbl_MovimentacoesCod_Movimentacao: TAutoIncField;
    tbl_MovimentacoesId_Movimentacao: TIntegerField;
    tbl_MovimentacoesData_Movimentacao: TDateField;
    tbl_MovimentacoesHistorico_Movimentacao: TStringField;
    tbl_MovimentacoesDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesConciliado_Movimentacao: TStringField;
    tbl_MovimentacoesData_FinalMovimentacao: TDateField;
    tbl_MovimentacoesExtrato_Movimentacao: TGraphicField;
    tbl_MovimentacoesDocumento_Movimentacao: TStringField;
    tbl_MovimentacoesPlanoConta_Movimentacao: TStringField;
    tbl_MovimentacoesFoto_Movimentacao: TStringField;
    editDespesas: TEdit;
    editReceitas: TEdit;
    RadioGroup1: TRadioGroup;
    Chart1: TChart;
    Series1: TBarSeries;
    ckResultado: TCheckBox;
    SpeedButton1: TSpeedButton;
    TabSheet3: TTabSheet;
    ChartClientes: TChart;
    Series4: TBarSeries;
    Chart2: TChart;
    Series3: TPieSeries;
    tbl_Clientes: TTable;
    tbl_ClientesCod_Cliente: TIntegerField;
    tbl_ClientesNome_Cliente: TStringField;
    tbl_ClientesEndereco_Cliente: TStringField;
    tbl_ClientesBairro_Cliente: TStringField;
    tbl_ClientesCidade_Cliente: TStringField;
    tbl_ClientesUF_Cliente: TStringField;
    tbl_ClientesTelefone_Cliente: TStringField;
    tbl_ClientesCelular_Cliente: TStringField;
    tbl_ClientesEmpresa_Cliente: TStringField;
    tbl_ClientesRG_Cliente: TStringField;
    tbl_ClientesCPF_Cliente: TStringField;
    tbl_ClientesData_Cad: TDateField;
    tbl_ClientesPrivilegio_Cliente: TStringField;
    tbl_Vendas: TTable;
    tbl_VendasCodVendTotal: TIntegerField;
    tbl_VendasCliente_VendTotal: TStringField;
    tbl_VendasUsuario_VendTotal: TStringField;
    tbl_VendasTotal_VendTotal: TCurrencyField;
    tbl_VendasData_VendTotal: TDateField;
    tbl_VendasDataVenc_VendTotal: TDateField;
    tbl_VendasPrazo_VendTotal: TIntegerField;
    tbl_VendasFormPag_VendTotal: TStringField;
    tbl_VendasSituacao_VendTotal: TStringField;
    tbl_VendasFrete_VendTotal: TCurrencyField;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    cbClientes: TComboBox;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    listClientes: TListBox;
    TabSheet4: TTabSheet;
    tbl_Dezembro: TTable;
    tbl_Novembro: TTable;
    tbl_Outubro: TTable;
    tbl_Setembro: TTable;
    tbl_Agosto: TTable;
    tbl_Julho: TTable;
    tbl_Junho: TTable;
    tbl_Maio: TTable;
    tbl_Abril: TTable;
    tbl_Marco: TTable;
    tbl_Fevereiro: TTable;
    tbl_Janeiro: TTable;
    tbl_JaneiroTotal_VendTotal: TCurrencyField;
    tbl_JaneiroCodVendTotal: TIntegerField;
    tbl_JaneiroCliente_VendTotal: TStringField;
    tbl_JaneiroUsuario_VendTotal: TStringField;
    tbl_JaneiroData_VendTotal: TDateField;
    tbl_JaneiroDataVenc_VendTotal: TDateField;
    tbl_JaneiroPrazo_VendTotal: TIntegerField;
    tbl_JaneiroFormPag_VendTotal: TStringField;
    tbl_JaneiroSituacao_VendTotal: TStringField;
    tbl_JaneiroFrete_VendTotal: TCurrencyField;
    ds_Movimentacoes: TDataSource;
    tbl_ContaCorrente: TTable;
    Chart3: TChart;
    BarSeries1: TBarSeries;
    ListClienteMes: TListBox;
    Panel1: TPanel;
    editConsulta: TEdit;
    TabSheet5: TTabSheet;
    Label8: TLabel;
    lblDataHoje: TLabel;
    Label10: TLabel;
    DBMovimentacoes: TDBGrid;
    DBChart1: TDBChart;
    Series6: TFastLineSeries;
    Series5: TFastLineSeries;
    TabSheet6: TTabSheet;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label9: TLabel;
    DBChart2: TDBChart;
    Series7: TPieSeries;
    qrMovimentacoes: TQuery;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBContasPagarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBContasReceberDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SeriesPRAfterDraw(Sender: TObject);
    procedure btnHojeClick(Sender: TObject);
    procedure btnAmanhClick(Sender: TObject);
    procedure btn7diasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ckResultadoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Query1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure ListClienteMesClick(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
  private
    procedure CustomGrid;
    procedure Receber;
    procedure Pagar;
    procedure DataHoje;
    procedure DataAmanha;
    procedure SeteDias;
    procedure AbrirTabela;
    procedure FecharTabela;
    procedure Despesas;
    procedure Receitas;
    procedure Resultado;
    procedure AtualizarData;
    procedure FiltrarDespRec;
    procedure CarregarClientes;
    procedure AdicionarLista;
    procedure GraficoCliente;
    procedure FiltrarCliente;
    procedure VerificarLista;
    procedure GraficoPeriodoMes;
    procedure Janeiro;
    procedure Fevereiro;
    procedure Marco;
    procedure Abril;
    procedure Maio;
    procedure Junho;
    procedure Julho;
    procedure Agosto;
    procedure Setembro;
    procedure Outubro;
    procedure Novembro;
    procedure Dezembro;
    procedure CarregarListaClientes;
    procedure MovimentacaoMes;
    procedure PlanodeContas;
  public
    totalpagar, totalreceber, despesa, receita, cliente : String;
    item : Integer;
  end;
type
 TDBGridPadrao = class(TDBGrid);
var
  frm_DashboardGraficos: Tfrm_DashboardGraficos;
  Ascendente : Boolean;
  implementation

uses clientesU;

{$R *.dfm}

procedure Tfrm_DashboardGraficos.SpeedButton4Click(Sender: TObject);
begin
Self.Close;
end;




procedure Tfrm_DashboardGraficos.FormCreate(Sender: TObject);
begin
AtualizarData;
AbrirTabela;
CarregarClientes;
CarregarListaClientes;
FiltrarDespRec;
DataHoje;
CustomGrid;
Receber;
Pagar;
Despesas;
Receitas;
Resultado;
MovimentacaoMes;
PlanodeContas;
qrMovimentacoes.Active := true;

end;

procedure Tfrm_DashboardGraficos.DBContasPagarDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBContasPagar.DataSource.Dataset.RecNo)then
begin
DBContasPagar.Canvas.Brush.Color := $00E9E9E9;
end else
DBContasPagar.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBContasPagar.Canvas.Brush.Color := clHighlight;
DBContasPagar.Canvas.Font.Color := clWhite;
DBContasPagar.Canvas.Font.Style := [fsBold];
end;
DBContasPagar.Canvas.FillRect(Rect);
DBContasPagar.DefaultDrawColumnCell( Rect, DataCol, Column, State);

DBContasPagar.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );

end;

procedure Tfrm_DashboardGraficos.CustomGrid;
begin
TDBGridPadrao(DBContasPagar).DefaultRowHeight := 25;
TDBGridPadrao(DBContasReceber).DefaultRowHeight := 25;
//TDBGridPadrao(DBContasPagar).ClientHeight := (20 * TDBGridPadrao(DBContasPagar).RowCount )+ 20;
end;

procedure Tfrm_DashboardGraficos.DBContasReceberDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBContasReceber.DataSource.Dataset.RecNo)then
begin
DBContasReceber.Canvas.Brush.Color := $00E9E9E9;
end else
DBContasReceber.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBContasReceber.Canvas.Brush.Color := clHighlight;
DBContasReceber.Canvas.Font.Color := clWhite;
DBContasReceber.Canvas.Font.Style := [fsBold];
end;
DBContasReceber.Canvas.FillRect(Rect);
DBContasReceber.DefaultDrawColumnCell( Rect, DataCol, Column, State);

DBContasReceber.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );

end;

procedure Tfrm_DashboardGraficos.Receber;
var
soma : Real;
begin
soma := 0;

with tbl_ContasReceber do
begin
  First;
  while not tbl_ContasReceber.Eof do
  begin
  soma:= (soma + tbl_ContasReceber.FieldByName('Falta_ContasReceber').AsFloat);
  Next;
  end;
  totalreceber := FloatToStr(soma);
  end;
if soma = 0 then
begin
Panel2.Visible := true;
end else
editReceber.Text := totalreceber;
Series2.Clear;
Series2.AddY(StrToCurrDef(editReceber.Text,0),'Receber',$0048D50D);
end;

procedure Tfrm_DashboardGraficos.SeriesPRAfterDraw(Sender: TObject);
begin
//SeriesPR.AddSeries(StrToCurrDef(editReceber.Text,0),'Receber',clGreen);
end;

procedure Tfrm_DashboardGraficos.Pagar;
var
soma : Real;
begin
soma := 0;

With tbl_ContasPagar do
begin
First;
while not tbl_ContasPagar.Eof do
begin
soma := (soma + tbl_ContasPagar.FieldByName('Valor_RestContasDetalhes').AsFloat);
Next;
end;
end;
totalpagar := FloatToStr(soma);
editPagar.Text := totalpagar;
Series2.AddY(StrToCurrDef(editPagar.Text,0),'Pagar',$002939D0);
end;

procedure Tfrm_DashboardGraficos.DataHoje;
var
nada : String;
begin
nada := '';

With tbl_ContasReceber do
begin
Filtered := false;
Filter := 'Falta_ContasReceber >0';
Filtered := true;
end;

With tbl_ContasPagar do
begin
Filtered := false;
Filter := 'Valor_RestContasDetalhes >0';
Filtered := true;
end;

end;

procedure Tfrm_DashboardGraficos.btnHojeClick(Sender: TObject);
begin
Panel2.Visible := false;
DataHoje;
Receber;
Pagar;
end;

procedure Tfrm_DashboardGraficos.btnAmanhClick(Sender: TObject);
begin
Panel2.Visible := false;
DataAmanha;
Receber;
Pagar;
end;

procedure Tfrm_DashboardGraficos.DataAmanha;
var
amanha : TDateTime;
begin
amanha := now + 1;

With tbl_ContasReceber do
begin
Filtered := false;
Filter := 'Data_VencContasReceber = '+Quotedstr(DateToStr(amanha))+' and Falta_ContasReceber >0';
Filtered := true;
end;

With tbl_ContasPagar do
begin
Filtered := false;
Filter := 'Data_VencContasDetalhes = '+Quotedstr(DateToStr(amanha))+' and Valor_RestContasDetalhes >0';
Filtered := true;
end;

end;

procedure Tfrm_DashboardGraficos.SeteDias;
var
setedias : TDateTime;
begin
setedias := now + 7;
With tbl_ContasReceber do
begin
Filtered := false;
Filter := 'Data_VencContasReceber >= '+Quotedstr(DateToStr(now))+' and Data_VencContasReceber <= '+Quotedstr(DateToStr(setedias))+' and Falta_ContasReceber >0';
Filtered := true;
end;

With tbl_ContasPagar do
begin
Filtered := false;
Filter := 'Data_VencContasDetalhes >= '+Quotedstr(DateToStr(now))+' and Data_VencContasDetalhes <= '+Quotedstr(DateToStr(setedias))+' and Valor_RestContasDetalhes >0'; ;
Filtered := true;
end;


end;

procedure Tfrm_DashboardGraficos.btn7diasClick(Sender: TObject);
begin
Panel2.Visible := false;
SeteDias;
Receber;
Pagar;
end;

procedure Tfrm_DashboardGraficos.AbrirTabela;
begin
tbl_ContasReceber.Active := true;
tbl_ContasPagar.Active := true;
tbl_Movimentacoes.Active := true;
tbl_Clientes.Active := true;
tbl_Vendas.Active := true;

tbl_Janeiro.Active := true;
tbl_Fevereiro.Active := true;
tbl_Marco.Active := true;
tbl_Abril.Active := true;
tbl_Maio.Active := true;
tbl_Junho.Active := true;
tbl_Julho.Active := true;
tbl_Agosto.Active := true;
tbl_Setembro.Active := true;
tbl_Outubro.Active := true;
tbl_Novembro.Active := true;
tbl_Dezembro.Active := true;

end;

procedure Tfrm_DashboardGraficos.FecharTabela;
begin
tbl_ContasReceber.Active := false;
tbl_ContasPagar.Active := false;
tbl_Movimentacoes.Active := false;
tbl_Clientes.Active := false;
tbl_Vendas.Active := false;

tbl_Janeiro.Active := false;
tbl_Fevereiro.Active := false;
tbl_Marco.Active := false;
tbl_Abril.Active := false;
tbl_Maio.Active := false;
tbl_Junho.Active := false;
tbl_Julho.Active := false;
tbl_Agosto.Active := false;
tbl_Setembro.Active := false;
tbl_Outubro.Active := false;
tbl_Novembro.Active := false;
tbl_Dezembro.Active := false;
end;

procedure Tfrm_DashboardGraficos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabela;
end;

procedure Tfrm_DashboardGraficos.Despesas;
var
soma : Real;
begin
soma := 0;

with tbl_Movimentacoes do
begin
  First;
  while not tbl_Movimentacoes.Eof do
  begin
  soma:= (soma + tbl_Movimentacoes.FieldByName('Debito_Movimentacao').AsFloat);
  Next;
  end;
  despesa := FloatToStr(soma);
  end;
if soma = 0 then
begin
//Panel2.Visible := true;
end else
editDespesas.Text := despesa;
//Series1.Clear;
Series1.Add(StrToCurrDef(editDespesas.Text,0),'Despesas',clRed);
Series3.Add(StrToCurrDef(editDespesas.Text,0),'Despesas',$002939D0);
end;

procedure Tfrm_DashboardGraficos.Receitas;
var
soma : Real;
begin
soma := 0;

with tbl_Movimentacoes do
begin
  First;
  while not tbl_Movimentacoes.Eof do
  begin
  soma:= (soma + tbl_Movimentacoes.FieldByName('Credito_Movimentacao').AsFloat);
  Next;
  end;
  receita := FloatToStr(soma);
  end;
if soma = 0 then
begin
//Panel2.Visible := true;
end else
editReceitas.Text := receita;
//Series1.Clear;
Series1.Add(StrToCurrDef(editReceitas.Text,0),'Receitas',clGreen);
Series3.Add(StrToCurrDef(editReceitas.Text,0),'Receitas',clGreen);
end;
procedure Tfrm_DashboardGraficos.Button1Click(Sender: TObject);
var i:integer;
begin
  for i:=1 to 10000 do
   Chart1.Series[1].AddXY(i,power(i,2));
end;

procedure Tfrm_DashboardGraficos.RadioGroup1Cék  Ã‹ÀSf‹Hfé±×tIfƒés‹ÚÿÓ‹Øë3Ûë=âU t=èãU u3Ûë»g   …Ût‹ÃèÇüÿÿ‹Ã[Ã@ ‹Pè°ÿÿÿÃ@ SV‹Ø3öf‹Cf=±×r/f=³×w)f%²×f=²×u‹ÃÿS‹ð…öu‹ÃÿS$‹ð…öt‹ÆèwüÿÿëûPàU t
¸g   ècüÿÿ‹Æ^[Ã‹ÀVW‰Ç1ÀŠ‰Ö1ÒŠF Ðr8Èw‰ÑŠˆG×ó¤_^ÃˆÈ*v÷ˆÊëèÃ3ÉŠ
A’è•üÿÿÃSŠ:Ëv‹ËˆB@áÿ   ’è{üÿÿ[ÃSVW‰Æ‰×1À1ÒŠŠFG)ÐwÂRÁêt&‹‹9ÙuDJt‹N‹_9Ùu7ƒÆƒÇJuâëƒÆƒÇZƒâtŠ:u/JtŠN:Ou$JtŠN:OuÀëZ8Ùu8ýuÁéÁë8Ùu8ý_^[Ã‹ÀSVQ‰ÎÁît&‹‹9ÙuENt‹H‹Z9Ùu8ƒÀƒÂNuâëƒÀƒÂ^ƒæt6Š:
u0NtŠH:Ju%NtŠH:Ju1À^[Ã^8Ùu8ýuÁéÁë8Ùu8ý^[ÃW‰ÇˆÍ‰ÈÁàf‰È‰ÑÁùx	ó«‰Ñƒáóª_ÃS1Ûi“U „B‰“U ÷â‰Ð[Ã‹ÀSVWRƒì‰Ï‰Æ™1Ð)Ð¹
   1Û1Ò÷ñƒÂ0ˆC…Àuñ…ö}Æ-CˆG‹L$ùÿ   ~¹ÿ   )Ù~ Oÿ° óªŠDÿˆGKuöƒÄ_^[Ã‹Ê3Òè—ÿÿÿÃ‹ÀSVW‰ÆP…Àtl1À1Û¿ÌÌÌŠF€û tøµ €û-tb€û+t_€û$t_€ûxtZ€ûXtU€û0uŠF€ûxtH€ûXtC„Ût ë„Ût-€ë0€û	w%9øw!€ÀØŠF„ÛuæþÍt	…À}Të	Fë÷Ø~KxI[)ÞëGþÅŠFëœ¿ÿÿÿŠF„Ûtß€ûar€ë €ë0€û	v€ë€ûwÐ€Ã
9øwÉÁàØŠF„ÛuÕþÍu÷ØY1ö‰2_^[Ã@ ¹ÿ   è   ÃSPùÿ   v¹ÿ   ŠB„Ût@ˆIuóZ)Ðˆ[ÃSVW1Ûˆã¶ð¶Ò‰Ï‰Ù1Àóª)ßÁã9ÚrSÿ9Öw-H‰ñ€áÒàÁîˆÑöÑ€áÒìÁê÷‰Ñ)ñu àˆëªI°ÿóªˆ'_^[Ã‹ÀVW‰Æ‰×áÿ   ó¦_^Ã@ VW‰Æ‰×‰Ê1É1ÀˆÑóªˆñ(Ñó¤± (ñóª_^Ãé   Ã‹ÀS1Û…À|M„š   =      ‰Âƒâ’Û¬Só0@ ÞÉÁèty‰Âƒât’Û¬S)2@ ÞÉÁèta€Û¬C¿2@ ÞÉëS÷Ø=   }F‰Âƒâ’Û¬Só0@ ÞùÁèt4‰Âƒât’Û¬S)2@ ÞùÁèt€Û¬C¿2@ ÞùëÝØÛ«é0@ ëÝØÙî[Ã       €ÿ       €ÿ?        @       È@       ú@      @œ@      PÃ@      $ô@     €–˜@      ¼¾@     (kî@     ù• @    @·Cº#@    ¥Ôè&@    *ç„‘*@   €ô æµ-@    1©_ã0@   ¿ÉŽ4@   Å.¼¢±7@  @v:kÞ:@  è‰#ÇŠ>@  b¬Åëx­A@ €z·&×ØD@ ¬n2x†‡H@ ´W
?h©K@ ¡íÌÎÂÓN@ „@aQY„R@È¥¹¥o¥U@: ô'ËÎX@„	”øx9?\@å¹6×¡_@ßNgÍÉòÉb@–"E@|oüe@žµp+¨­Åi@Õ¦ÏÿIxÂÓ@£›Å«³ï=AàŒé€ÉGº“¨Aªæ+¡¶BkU'9÷pà|B0É<ãÿ–RŠçBŽÞùûë~ªQCŒ/j\ü&Ò»CvãÌò)/„&DÒ
Û '¤ŸDªø®ãÅÄúDYœ°éœŠòdEÔó÷ëáJz•ÏEb¢•ÜØ>¸9FÇ‘¦® ã£Fu†uvÉHMä§“9;5¸²íSå]=Å];‹ž’Z¦ð¡ ÀT¥Œ7a‹Z‹Ø%]‰ùÛgøó'¿¢È]Ý€n›— ŠR`Ä%uðYÕnb5®Ê{Ãÿ%üV ‹ÀS3Ûj èîÿÿÿƒøujèâÿÿÿ% ÿ  =   t=   u³‹Ã[ÃU‹ìƒÄô·$U ‰EøEüPjj hô3@ h  €èíßÿÿ…ÀuM3ÀUhÍ3@ dÿ0d‰ ÇEô   EôPEøPj j h4@ ‹EüPèÂßÿÿ3ÀZYYd‰hÔ3@ ‹EüPèœßÿÿÃé®  ëïf¡$U f%Àÿf‹Uøfƒâ?fÂf£$U ‹å]Ã SOFTWARE\Borland\Delphi\RTL FPUMaskValue    Ûã›Ù-$U Ã‹À°é±ôÿÿÃ‹ ‰Â‹ÂÃVW‰×‹pÔ1ÉŠAó¤_^Ã@ S1Û	Òt‹@Ô1ÉŠ;JüuJŠ<2<€çßuIuòCˆØ[Ã‹@Ü…Àt‹ Ã‹ÀS‹Ø‹Ãè&   èõòÿÿ‹Ð‹Ãè\   [Ã‹ÀS‹Ø‹Ãè¦   ‹Ãè÷òÿÿ[ÃƒÀØ‹ Ã‹À„ÒtƒÄðèˆ  „Òtè×  d    ƒÄÃè×  „Ò~è¶  Ã…Àt²‹ÿQüÃSVW‰Ã‰×«‹KØ1ÀQÁéIó«Yƒáóª‰Ð‰â‹K¸…ÉtQ‹[Ü…Ût‹ëí9Ôt[‹ƒÃ‹s…öt‹{‰4ƒÃIuí9Ôuã_^[Ã‹ÀSV‰Ã‰Æ‹6‹VÀ‹vÜ…ÒtèÝ  ‰Ø…öué^[Ã‡Ñù   ÿsù   þr¿Éÿ!ÿááÿÿÿ Á‰Ð‹é*  Ã@ U‹ìƒÄøSVW3Û‰]ø‹ñ‰Uü‹ø3ÀUh$6@ dÿ0d‰ 3À‰‹Uü‹èc   ‹Ø…Ût1‹C…Àtø‰>ƒ> t!‹P‹ ÿPëMø‹S‹Çèrÿÿÿ‹Uø‹Æè )  ƒ> •Ã3ÀZYYd‰h+6@ Eøèm)  ÃéW  ëð‹Ã_^[YY]ÃSV‰Ã‹C¸…Àt)‹ƒÀ‹2;0u‹r;pu‹r;pu‹r;ptƒÀIuÜ‹[Ü…Ût‹ëÅ1À^[ÃSV‹ò‹Ø…Ût‹Ö‹è   „Àu3À^[Ã°^[Ã@ …Àt‰Á‹	9Ñt‹IÜ…Éuó°
é.òÿÿÃW–ë‹6‹~Ð…ÿt·QƒÇòf¯t
Y‹vÜ…öuã_ÃXÀ)È‹tGü_Ã‹ÀPQ‹ èÇÿÿÿYXtÿæYéïôÿÿÃ‹ÀV‰Ö‹ è®ÿÿÿ‰ð^uYé×ôÿÿÃ‹Àë‹ 9Ðt‹@Ü…ÀuóÃ°ÃƒÀÄ‹ Ã‹À¸ÿÿ €Ã‹ÀÃ@ Ã@ Ã@ Vf‹2f	ötfþ ÀsP‹ èXÿÿÿXt‰ñ^ÿá^‹ÿaðÃSVW1É1ÿŠë‹ ‹pÌ…ötf‹>ƒÆŠN8Ùtf‹ÎOuñ‹@Ü…ÀuÛëŠëëµ Š\12€ãßuîIuñ‹F_^[Ã‹ÀSVW‰Ï1Û1Éë‹ ‹pÌ…ötf‹ƒÆ;Vtf‹ÞIuó‹@Ü…ÀuÝˆë
ƒÆ1ÉŠAó¤_^[ÃSVW1É1ÿŠP‹ ‹pÈ…ötf‹>ƒÆŠN8Ùtt1Ouò‹@Ü…ÀuÜZëŠŠNëèŠ\12€ãßuíIuñ‹ZÐ_^[ÃRQS„Ò|ÿPô1ÒL$d‹‰‰iÇAy8@ ‰Ad‰
[YZÃéN  ‹D$,‹@…Àt‹²PÿQüXè	   èD  Ã@ ‹ÿRøÃ‹ÀS‹Ø‹Ã‹ÿRä‹Ã[Ã‹À„ÒÃPR‹ÿRèZXÃ€=,U vj j j hßúíÿàU Ã€=,U  tPPRTjj häúíÿàU ƒÄXÃ@ Tjj hàúíÿàU ƒÄXÃ@ €=,U v	PÿséÖÿÿÿÃ€=,U vPSéÄÿÿÿÃ@ …Ét‹A€9ét€9ëu¾ÀAAëƒÁÁÃ‹À€=,U vPRQèÏÿÿÿQTjj háúíÿàU YYZXÃ€=,U vRTjj hâúíÿàU ZÃPR€=,U vTjj hãúíÿàU ZXÃ‹À‹D$÷@   …  8Þúí‹P‹Htnüè/úÿÿ‹àU …Ò„ñ   ÿÒ…À„ç   ‹T$‹L$9Îúït7èÆþÿÿ€=0U  v)€=,U  w L$PQèØÿÿƒø X„«   ‰Â‹D$‹Hë0‰Â‹D$‹H€=0U v€=,U  wPD$RQPèPØÿÿƒø YZXtpƒHS1ÛVWUd‹SPRQ‹T$(j Ph¤:@ RÿàU ‹|$(è,  ÿ°    ‰     ‹o‹_ÇGÐ:@ ƒÃèfþÿÿÿãé«  èæ+  ‹ˆ    ‹‰    ‹Aéüùÿÿ¸   Ã‹À‹D$÷@   …o  8Þúítüè	ùÿÿ‹àU …Ò„S  ÿÒ…Àu
éH  ‹@‹ ‹T$SVWU‹J‹Yq	‰Å‹…ÀtC‰ïë‹?‹ 9øt7‹HØ;OØu‹@Ô‹WÔ1ÉŠ:
u	@Bèòÿÿt‹Ü‹…ÿuÐƒÆKuÀ]_^[éç   ‹D$8Þúí‹P‹HtAÿàU ‹T$è2ýÿÿ€=0U  v€=,U  wL$PQèùÖÿÿƒø X„Ÿ   ‰Â‹D$‹Hë'€=0U v€=,U  wPD$RQPèÅÖÿÿƒø YZXtm1Ûd‹SPRQ‹T$(ƒHVj Ph,<@ RÿàU [‹|$(èŠ*  ÿ°    ‰     ‹oÇGX<@ ‹D$èËüÿÿÿcé#   è^*  ‹ˆ    ‹‰    ‹Aétøÿÿ¸   Ã‹À‹D$‹T$÷@   t‹JÇB°<@ SVWU‹jƒÁè¾üÿÿÿÑ]_^[¸   Ã‹À	Àu
¸Ø   èª  ZTUWVSPRTjjhÞúíRÿ%àU Ã‹D$0Ç@+=@ èÐ)  ‹    ‹
‰ˆ    ‹Bƒ`ý8Þúít‹Bè×÷ÿÿè®ûÿÿ1ÀƒÄd‹Y‹‰]_^[¸   Ã@ è‡)  ‹    ‹
‰ˆ    ‹Bè÷ÿÿZ‹d$,1ÀYd‰X]è/üÿÿÿâÃ1Ò‹L$‹D$ƒÁd‰ÿÑÂ Ã‹ÀU‹ì‹U‹=’  À,t\=Ž  ÀtW-  Àt\-‡   t=HtNë`qÿÿ?ƒèr6t0ëR=–  Àt=-“  Àt.HtHt$ë:-ý  Àt/ƒè=t&ë,°Èë*°Éë&°Íë"°Ïë°Èë°×ë°Îë°Øë°Úë
°Ùë°Êë°ÿ%ÿ   ‹Rètêÿÿ]Â ‹D$÷@   …‰   €=,U  wD$PèˆÔÿÿƒø tq‹D$üèÑõÿÿ‹T$j Phb>@ RÿàU ‹\$;Þúí‹S‹Ct‹àU …Ò„úþÿÿ‰ØÿÒ…À„îþÿÿ‹Sèûÿÿ‹àU …ÉtÿÑ‹L$¸Ù   ‹Q‰$éº  1ÀÃ@ 1ÒEôd‹
d‰‰Ç@>@ ‰h£<æU Ã@ 1Ò¡<æU …Àtd‹
9Èu‹ d‰Ã‹	ƒùÿt9uõ‹ ‰ÃU‹ìSVW¿8æU ‹G…ÀtH‹_‹p3ÒUhJ?@ dÿ2d‰"…Û~K‰_‹DÞ…ÀtÿÐ…Ûî3ÀZYYd‰ëé}úÿÿè°ÿÿÿè‡ýÿÿèÖýÿÿ_^[]ÃU‹ìSVW¡@æU …ÀtK‹03Û‹x3ÒUhª?@ dÿ2d‰";ó~‹ßC‰DæU …ÀtÿÐ;óì3ÀZYYd‰ëéúÿÿèPÿÿÿè'ýÿÿèvýÿÿ_^[]ÃÇàU ¸@ ÇàU À@ £@æU 3À£DæU ‰HæU ‹B£0àU èÅþÿÿÆ8àU  èaÿÿÿÃS1ÛWV‹<t‹F‹ØÚè6$  ƒÆOuì^_[ÃS1ÛWV‹<t‹F‹‹Úè$  ƒÆOuë^_[Ã@ S1ÛWV‹<t‹F‹‹F‰ƒÆOuì^_[ÃSVW¾pU ±‹ U ‹Ã¿
   ™÷ÿ€Â03ÀŠÁˆ‹Ã»
   ™÷û‹ØI…ÛuÛ±¡U ‹ÐƒâŠ’U 3ÛŠÙˆÁèI…Àuæ_^[Ã‹À1À‡ U ÷ØÀ@¿8æU ‹_‹oÿwÿw ‹7¹   ó¥_^ÉÂ Ã‹ÀQ€=LàU  tWf= âU ²×uƒ=(âU  v¸âU ÿ8âU j D$PjhpU jõèrÑÿÿPèŒÑÿÿj D$PjhˆA@ jõèWÑÿÿPèqÑÿÿZÃ€=4U  uj hhU hpU j èkÑÿÿZÃ ÿÿÿÿ   
  SVWU»8æU ¾ U ¿HàU €{( uƒ? t‹‰Ð3Ò‰‹èÿÕƒ? uïƒ=U  tè«þÿÿè2ÿÿÿ3À£U €{(u
ƒ> u3À‰Cèýÿÿ€{(vƒ> t!‹C…Àtè  ‹S‹B;Bt
…ÀtPèêÐÿÿèÁüÿÿ€{(uÿS$€{( tè¡þÿÿƒ; uƒ=(àU  tÿ(àU ‹Pè•Ðÿÿ‹V‹ð‹û¹   ó¥^évÿÿÿ]_^[Ã£ U èÿÿÿÃU ééÿÿÿÃ‹…ÒtÇ     ‹JøI|ðÿJøu
PBøèåÿÿXÃSV‰Ã‰Ö‹…ÒtÇ    ‹JøI|ðÿJøuBøèâäÿÿƒÃNuÚ^[Ã…Òt$‹JøAPR‹Büè\   ‰ÂXR‹Hüè”æÿÿZXëðÿBø‡…Òt‹JøI|ðÿJøuBøè–äÿÿÃ…Òt
‹JøA~ðÿBø‡…Òt‹JøI|ðÿJøuBøèläÿÿÃ@ …À~$PƒÀ
ƒàþPè7äÿÿZfÇDþ  ƒÀZ‰PüÇ@ø   Ã1ÀÃSVW‰Ã‰Ö‰Ï‰øèÄÿÿÿ‰ù‰Ç…öt	‰Â‰ðè÷åÿÿ‰Øèèþÿÿ‰;_^[Ã‹ÀU‹ìj j RP‹EPQj ¡ÀåU PèÉÏÿÿ]Â U‹ìRP‹EPQj ¡ÀåU PèÏÿÿ]Â SVWUÄðÿÿPƒÄü‹ñ‰$‹ø…ö	‹Çè„þÿÿë_nýÿ  }(VD$‹L$ºÿ  è„ÿÿÿ‹Ø…Û|T$‹Ç‹ËèAÿÿÿë,‹ÝÛ‹Ç‹ÓèŽ  V‹‹L$‹ÓèTÿÿÿ‹Ø…Û}3Û‹Ç‹Óèo  Ä  ]_^[ÃR‰â¹   èûþÿÿZÃ1É…Òt!R:
t:Jt:Jt:JtƒÂëèBBB‰ÑZ)ÑéÌþÿÿÃ@ 1É…Òt-Rf;
t f;Jtf;Jtf;JtƒÂëäƒÂƒÂƒÂ‰ÑZ)ÑÑééüþÿÿÃ@ 1ÉŠ
Bé‚þÿÿÃWPQ‰×1Àò®u÷ÑXÁX_éiþÿÿÃ1É…Òt‹JüÑééÄþÿÿÃ@ S…Òt‹Zü…Ût9Ù|‰Ùˆ@’èQäÿÿ[ÃÆ  [Ã‹À…Àt‹@üÃ…Òt?‹…É„~ýÿÿSVW‰Ã‰Ö‹yü‹Vüú9Îtè^  ‰ð‹Nü‹úèäÿÿ_^[ÃèG  ‹‰ùëèÃ…Òta…É„<ýÿÿ;t\;tPQè-ýÿÿZXéšÿÿÿSVW‰Ó‰ÎP‹CüFüèƒýÿÿ‰Ç‰Â‰Ø‹Küè¹ãÿÿ‰ú‰ð‹NüSüèªãÿÿX‰ú…ÿtÿOøèçüÿÿ_^[Ã‰ÊéÜüÿÿ‰ÊéIÿÿÿÃSVWRP‰Ó1ÿ‹L”…Ét9u‰Ï‹AüJë1À‹L”…Ét	Aü9Ïu1ÿJuì…ÿt‰Â‹$‹wüèˆ  ‹<$ÿ77KëèñüÿÿP‰Æ‹Dœ‰ò…Àt
‹HüÎèãÿÿKuéZX…ÿu…ÒtÿJøèUüÿÿZ_^[X$”ÿàÃ‹ÀSVW‰Æ‰×9Ð„   …öth…ÿtk‹Fü‹Wü)ÐwÂRÁêt&‹‹9ÙuXJt‹N‹_9ÙuKƒÆƒÇJuâëƒÆƒÇZƒât"‹‹8ÙuAJt8ýu:Jtã  ÿ á  ÿ 9Ùu'Àë#‹Wü)Ðë‹Fü)ÐëZ8Ùu8ýuÁéÁë8Ùu8ý_^[Ã‹À…Àt
‹PøB~ðÿ@øÃ…ÀtÃ ¸AG@ Ã‹…Òt8‹JøIt2S‰Ã‹Büèáûÿÿ‰Â‹‰P‹HüèâÿÿX‹HøI|ðÿHøu@øè%àÿÿ‹[‰ÐÃ@ é·ÿÿÿÃ‹Àé¯ÿÿÿÃ‹ÀS…Àt-‹Xü…Ût&J|9Ú})Ó…É|9ÙÂ‹D$è¨ûÿÿë1Òëå‰Ùëë‹D$è¥úÿÿ[Â ÃSVW‰Ã‰Ö‰Ïè¢ÿÿÿ‹…Òt0‹JüN|*9Î}&…ÿ~")ñ9Ï~‰Ï)ùòèráÿÿ‹‰Ø‹Rü)úè¨   _^[Ã…ÀtVSVWU‰Ã‰Ö‰Ï‹R…Òt‹RüO}1ÿ9×~‰×‹kü‰ðêèu   X9Øu‹‹/‹Hü)ÑÂøèáÿÿ‰Ø‹‰éúè
áÿÿ]_^[Ã…Àt@…Òt1SVW‰Æ‰×‹OüW‹VüJxŠF)Ñ~ò®u‰ËVW‰Ñó¦_^t‰ÙëìZ1Àë1ÀÃZ‰ø)Ð_^[Ã@ SVW‰Ã‰Ö1ÿ…Ò~H‹…Àt#ƒxøuƒèƒÂ	P‰àèÙÞÿÿXƒÀ‰‰püÆ ë(‰Ðè;úÿÿ‰Ç‹…Àt‰ú‹Hü9ñ|‰ñègàÿÿ‰ØèXùÿÿ‰;_^[Ã‹ÀSVW‰Ã‰Ö‰Ï‰Èè@ùÿÿ…ö~‰ðèùùÿÿ‰‰òˆÙè®äÿÿ_^[Ã‹À°é…ßÿÿÃ…ÀtPj è$Êÿÿ…À„äÿÿÿÃ@ ‡…ÒtRèÊÿÿÃ@ ‹…ÒtÇ     PRèÊÿÿXÃ@ SV‰Ã‰Ö‹…ÀtÇ    PèèÉÿÿƒÃNuè^[Ã@ …Ò„¼ÿÿÿ‹JüÑé„±ÿÿÿQRPè¹Éÿÿ…À„qÿÿÿÃSVWUÄðÿÿPƒÄü‹ñ‰$‹ø…ö	‹Çè€ÿÿÿë]nýÿ  }(VD$‹L$ºÿ  è”ùÿÿ‹Ø…Û~T$‹Ç‹Ëè9   ë*‹Ý‹Ç‹Óèè  V‹‹L$‹Óèfùÿÿ‹Ø…Û}3Û‹Ç‹ÓèÉ  Ä  ]_^[Ã‹À…É„ÿÿÿPQRèÉÿÿ…À„ÌþÿÿZÿ2‰è
ÉÿÿÃ1É…Òt-Rf;
t f;Jtf;Jtf;JtƒÂëäƒÂƒÂƒÂ‰ÑZ)ÑÑéé¤ÿÿÿÃ@ 1É…Òt‹JüéÿÿÿÃ…ÀtÃ  ¸êJ@ Ã‹À…Àt‹@üÑèÃ‹ÀSVWUQ‹ê‰$‹Åèãÿÿÿ‹Ø…ÛtB‹$‹ èÓÿÿÿ‹ð3è5þÿÿ‹ø…ö~‹ÎÉ‹×‹$‹ èCÞÿÿ‹ËÉw‹Åè5Þÿÿ‹$‹×èþÿÿZ]_^[ÃSVW‰Æ‰×9Ðtr…ötQ…ÿtT‹Fü‹Wü)ÐwÂRÁêt&‹‹9ÙuAJt‹N‹_9Ùu4ƒÆƒÇJuâëƒÆƒÇZƒâtf‹f‹f9Ùu!Àë‹Wü)Ðë‹Fü)ÐëZf9Ùu	ÁéÁëf9Ù_^[Ã@ U‹ìSVW‹ù‹Ú‹ð‹Æèýþÿÿƒû}3ÛëK;Ã}‹Ø…ÿ}3Àë+Ã;ø}‹Ç‹ÓÒÖ‹M‘èNþÿÿ_^[]Â @ SVW‹ò‹ø3Û…ö~'‹Æèýÿÿ‹Ø‹è§þÿÿ…À~;ð}‹Æ‹ÈÉ‹Ó‹è Ýÿÿ‹Ç‹Óèýÿÿ_^[Ã@ 1ÉSŠJVW‰Ãt
‹|‹‹FØ‹¹   è   ƒÆOç_^[Ã…É„Š   SVW‰Ã‰Ö‰Ï1ÒŠŠV1É<
t"<t<t$<t3<tM<t<t
°_^[é Üÿÿ‰ƒÃOøëE‰‰K‰K‰KƒÃOïë2U‰Õ‹T.
‰Ø\.‹L.‹è‹ÿÿÿOè]ëU‰Õ‰Ø\.‰òèEÿÿÿOð]_^[Ã¹   ébÿÿÿÃ1ÉSŠJVW‰Ãt
‹|‹‹FØ‹¹   è'   ƒÆOç‰Ø_^[Ã@ ƒ=U  tÿU Ã°èUÛÿÿÃƒù „à   PSVW‰Ã‰Ö‰Ï1ÒŠŠV<
t%<t><tQ<t\<tv<„„   <„‹   é—   ƒù‰Ø
èôÿÿé‘   ‰Êèµôÿÿé…   ƒù‰ØèŒûÿÿëw‰Êè›ûÿÿën‰ØƒÃègÿÿÿOóë_U‰Õ‹T.
‰Ø\.‹L.‹èbÿÿÿOè]ëAU‰Õ‰Ø\.‰òè ÿÿÿOð]ë+‰ØƒÃè<  Oóë‰Ø‰òƒÃè
  Oñë_^[X°éoÚÿÿ_^[XÃ‹À¹   é
ÿÿÿÃƒ=U  tÿU Ã°èEÚÿÿÃSVWU‰Ã‰Ö1ÀŠA|
‹oü1À‹OøQ‹O)Á~‰ÂðÚè¸Úÿÿ‹G‹‹Š
€ù
t1€ùt=€ùtI€ùtU€ùtp€ù„€   €ù„ˆ   °]_^[éÙÙÿÿ‹0Øè»óÿÿ¸   ë}‹0Øèžúÿÿ¸   ël0ØèQÿÿÿ¸   ë[1ÉŠJÿtÿt‹L
‹	0Øèa   Xë;1ÉŠJ‹LQ‰Ñ0Øè,ÿÿÿXë"‹0Øè'  ¸   ë‰Ñ‹0Øè	  ¸   GƒÇM…ÿÿÿY)Á~
ðèÏÙÿÿ]_^[Ã‹ÀSVWU‰Ã‰Ö‰Ï‹l$Š€ù
t1€ùtC€ùtR€ùta€ùt}€ù„‘   €ù„œ   °]_^[éâØÿÿ‰Ø‹èÅòÿÿƒÃƒÆMuîéŽ   ‰Ø‹è¢ùÿÿƒÃƒÆMuîëz‰Ø‰òèRþÿÿƒÃƒÆMuîëf1ÉŠO|9‰Ø‰ò‹Oÿwècÿÿÿ7MuêëE‰Ø‰ò‰ùè3þÿÿ1ÀŠG\8t8Muåë(‰Ø‹è   ƒÃƒÆMuîë‰Ø‹‰ùè  ƒÃƒÆMuì]_^[Â ÃRèÒÖÿÿZ…ÀtPèwüÿÿXÃPè²ýÿÿXèØÖÿÿÃ@ ‘‡ÊèüòÿÿÃ@ SVQ‹ò‹Ø‰$‹$èúÿÿ‹Ð‹Î‹Ãè×ÿÿÿZ^[Ã@ SQ‹Ø3À‰$‹Ãè(ôÿÿ‹È‹Ä‹ÓèÉøÿÿ‹$Z[Ã@ °éµ×ÿÿÃRP‹D$÷$$‰Á‹D$÷d$Á‹$÷d$ÊYYÂ ÃUSVW1ÿ‹\$‹L$	Éu	Òt\	ÛtX	Òy
÷Ú÷ØƒÚ ƒÏ	Éy
÷Ù÷ÛƒÙ ƒ÷‰Í¹@   W1ÿ1öÑàÑÒÑÖÑ×9ïrw9Þr)Þï@âç[÷Ã   t÷Ú÷ØƒÚ _^[]Â ÷ó1ÒëóÃ@ USVW1ÿ‹\$‹L$	Éu	Òt]	ÛtY	Òy
÷Ú÷ØƒÚ ƒÏ	Éy÷Ù÷ÛƒÙ ‰Í¹@   W1ÿ1öÑàÑÒÑÖÑ×9ïrw9Þr)Þï@âç‰ð‰ú[÷Ã   t÷Ú÷ØƒÚ _^[]Â ÷ó’1ÒëòÃ€ù |€ù@|1Ò1ÀÃ‰ÂÓâ1ÀÃ¥ÂÓàÃÃ@ €ù |€ù@|1Ò1ÀÃ‰Ð1ÒÓèÃ­ÐÓêÃÃ@ U‹ìƒÄÜSVW‹ò‹ø3Ûƒ} u	ƒ} ’ÀëœÀˆEÿj j
‹E‹Uèÿÿÿ…Ò}÷ØƒÒ ÷ÚƒÀ0ƒÒ ˆDßCj j
‹E‹Uèpþÿÿ‰E‰Uƒ} uÀƒ} uº€}ÿ tÆDß-Cÿÿ   ~¿ÿ   ¸   ‹×+Ó;Ð|	Æ @;Ð}÷…Û~KŠTßˆ@…Ûó‹ÐJ‹ÆèÐ×ÿÿ_^[‹å]Â @ U‹ìS‹Øÿuÿu‹Ó3Àè+ÿÿÿ[]Â ‹ÀSVWUƒÄì‰$‹ð½   3ÿÇD$    ÇD$    …öu‹$‰(éî  E€|.ÿ tøÆD$ ŠD.ÿ<-uÆD$Eë<+uE³€|.ÿ$t(ŠD.ÿèo×ÿÿ<Xt€|.ÿ0…Ú   Š.èX×ÿÿ<X…Ê   €|.ÿ0uEEŠD.ÿ‹Ð€ÂÐ€ê
r€Âù€êr€Âæ€êrëz‹øçÿ   ƒï0ë‹øçÿ   ƒï7ë‹øçÿ   ƒïWƒ|$ u	ƒ|$ rGë|C|$ÿÿÿu	ƒ|$ÿvë0.‹Ç™RP‹D$‹T$¤ÂÁà$T$ƒÄ‰D$‰T$E3Ûéfÿÿÿ€|$ „Ó   ‹D$‹T$÷ØƒÒ ÷Ú‰D$‰T$é·   ŠD.ÿ‹Ð€ÂÐ€ê
sb‹øçÿ   ƒï0ƒ|$ u	ƒ|$ rIë|E|$ÌÌÌu|$ÌÌÌÌvë/-j j
‹D$‹T$è&üÿÿRP‹Ç™$T$ƒÄ‰D$‰T$E3Ûë€|$ t‹D$‹T$÷ØƒÒ ÷Ú‰D$‰T$ƒ|$ uƒ|$ tƒ|$ u
ƒ|$ ’ÀëœÀ:D$tM€|.ÿ •À
Øt‹$‰(ë‹$3Ò‰‹D$‹T$ƒÄ]_^[Ã…Àt‹@üÃèóÿÿÿHÃU‹ìÿuè	úÿÿ]Â éÓ÷ÿÿÃ‹Àè¯  Ã‹ÀU‹ìƒÄàSVW‰Mø‹ò‰Eü‹]ü‹‹E‹8…ÿ…ÿ}°èòÒÿÿ‹Eü‹ÖèÄÿÿÿéJ  3À‰Eð…Ûtƒë‹‰Eðƒë3ÀŠFÆ‹Æ‹P‰Uè‹P…Òt‹2ë3ö‹Ç÷mè‰Eä‹Eä™÷ÿ;Eèt°è™ÒÿÿƒEä…Ûtƒ;u5‰]à;}ð}…öt‹ÃƒÀ‹×¯UèÂ‹Mð+Ï‹Öè;ÿÿÿEà‹Uäè@Ñÿÿ‹]àë^ÿ‹EäèñÐÿÿ‹Ø‹Eð‰Eì;}ì}‰}ì…öt*‹Uì¯Uè‹ÃƒÀ3ÉèB×ÿÿ‹EìP‹Uü‹‹ÃƒÀ‹ÎèÕþÿÿë‹Mì¯Mè‹ÓƒÂ‹Eü‹ è™ÒÿÿÇ   ƒÃ‰;ƒÃ‹×+Uð¯Uè‹Eè¯EðÃ3ÉèîÖÿÿƒ}ø~.ƒEÿMøO…ÿ|"GÇEô    ‹EP‹Eôƒ‹Mø‹ÖèˆþÿÿÿEôOuæ‹Eü‰_^[‹å]Â Tƒ$èjþÿÿÃS…Àt‹Øƒë‹SQ3Éè   [Ã‹Áèö   [ÃU‹ìƒÄðSVW‹ù‰Uø‰Eü‹u3Ûƒ}ü „º   ‹Eø‰Eð…ÿ}÷3ÿ‹Eüƒè‹ ;Ç}‹ø‹Ð+×;ò~‹ò…ö}3ö…öŽ†   ‹Eð¶@Eð‹Eð‹@‰Eô‹Eð‹@…Àt‹ ‰Eðë3À‰Eð‹Æ÷môƒÀè~Ïÿÿ‹ØÇ   ƒÃ‰3ƒÃ¯}ô}ü…ö~5ƒ}ð t‹Ö¯Uô‹Ã3ÉèÆÕÿÿV‹Mð‹Uü‹Ãè`ýÿÿë‹Î¯Mô‹Ó‹Eüè*Ñÿÿ‹E‹Uøè[ýÿÿ‹E‰_^[‹å]Â ‹…Ét3Ç     ðÿIøu'P‰È1ÉŠJ‹T…Òt‹Hü…Ét‹èìôÿÿƒèèüÎÿÿXÃ‹ÀS‹…ÒtðÿBø…ÛtðÿKøuPR‰ÊÿCøè£ÿÿÿZX‰[Ã…Àtðÿ@øÃ@ ƒÄäjT$RPè”ºÿÿ|$   u‹D$ë3ÀƒÄÃ‹ÀèÓÿÿÿÃ‹ÀSVÄøþÿÿ‹Øƒ{ u+h  D$P‹CPèá¹ÿÿ‹Ä²è  ‹ð‰s…öu‹C‰C‹CÄ  ^[Ã‹8U …Òt;Bt
;Bt;Bu‹Âè˜ÿÿÿÃ‹…ÒuãÃëPèL¹ÿÿŠ„Òt€ú\uïÃU‹ìÄ°ýÿÿSVW‰Uø‰Eü‹Eü‰Eôh,[@ èf¹ÿÿ‹ð…öt@h<[@ Vè]¹ÿÿ‰Ã…Ût/h  …±ýÿÿP‹EüPÿÓ…Àt‹EøP…±ýÿÿP‹EüPèU¹ÿÿé"  ‹Eü€8\u8‹Eü€x\…  ‹EüƒÀèdÿÿÿ‹ð€> „÷   FèQÿÿÿ‹ð€> „ä   ë‹uüƒÆ‹Þ+]üCP‹EüP…±ýÿÿPèñ¸ÿÿé¡   Fèÿÿÿ‹ø‹Ç+Æ‹ÐÓBú  Ÿ   @PV…±ýÿÿÃPè¼¸ÿÿ…¶þÿÿP…±ýÿÿPèQ¸ÿÿ‹ðƒþÿttVè<¸ÿÿ…âþÿÿPè˜¸ÿÿSÂ@=  UÆ„±ýÿÿ\¸  +ÃHP…âþÿÿP…±ýÿÿÃ@Pè\¸ÿÿ…âþÿÿPèX¸ÿÿ@Ø‹÷€> …Vÿÿÿ‹EøP…±ýÿÿP‹EüPè.¸ÿÿ‹Eô_^[‹å]Ãkernel32.dll    GetLongPathNameA    U‹ìÄàþÿÿSV‰Eüh  …ãþÿÿPj è§·ÿÿÆEî EøPh  j h€]@ h  €èá·ÿÿ…Àt@EøPh  j h€]@ h  €èÃ·ÿÿ…Àt"EøPh  j hœ]@ h  €è¥·ÿÿ…À…‰   3ÀUhU\@ dÿ0d‰ ÇEè   …ãþÿÿº  è ýÿÿEèPEîPj j …ãþÿÿP‹EøPèd·ÿÿ…Àt"EèPEîPj j h¼]@ ‹EøPèF·ÿÿ…ÀtÆEî ÆEò 3ÀZYYd‰h\\@ ‹EøPè·ÿÿÃé&àÿÿëïh  ‹EüP…ãþÿÿPèß¶ÿÿjEóPjèº¶ÿÿPèŒ¶ÿÿ3ö€½ãþÿÿ „ã   €}ó u
€}î „Ó   …ãþÿÿPè©¶ÿÿ‹Ø…ãþÿÿØëK€;.t
…ãþÿÿ;Øuð…ãþÿÿ;Ø„   C€}î t(‹Ó+Ð¸  +ÂPEîPSèZ¶ÿÿjj …ãþÿÿPè:¶ÿÿ‹ð…öuj€}ó td…ãþÿÿ‹Ó+Ð¸  +ÂPEóPSè"¶ÿÿjj …ãþÿÿPè¶ÿÿ‹ð…öu2ÆEõ …ãþÿÿ‹Ó+Ð¸  +ÂPEóPSèìµÿÿjj …ãþÿÿPèÌµÿÿ‹ð‹Æ^[‹å]Ã  Software\Borland\Locales    Software\Borland\Delphi\Locales     è   Ã‹Àè+   Ã‹ÀSVW‹ú‹ð‹8U …Ût‹×‹CÿÖ„Àt‹…Ûuï_^[Ã‹ÀSVW‹ú‹ð‹8U …Ût‹Ãèûÿÿ‹×ÿÖ„Àt‹…Ûuë_^[Ã‹Àè   Ã‹Àè#   Ã‹ÀS‹Ø¸   èGÉÿÿ‹<U ‰‰X£<U [ÃSV‹5<U …öt"‹V;Ðu¡<U ‹ £<U º   ‹Æè)Éÿÿ^[Ã‹Ö…Òt'‹
…Ét‹Y;Øu‹ñ‹‰º   ‹ÆèÉÿÿë‹…ÒuÙ^[Ã‹ÀU‹ìƒÄøSVW‰Eü¡<U ‰Eøƒ}ø t93ÀUhï^@ dÿ0d‰ ‹]ø‹EüÿS3ÀZYYd‰ë
éØÚÿÿè;Þÿÿ‹Eø‹ ‰Eøƒ}ø uÇ_^[YY]Ã‹À‹8U ‰£8U Ã‹ÀU‹ìQ‰Eü3ÒUh„_@ dÿ2d‰"‹Eü‹@ètÿÿÿ3ÀZYYd‰h‹_@ ‹Eü;8U u‹Eü‹ £8U ë¡8U …Àt‹;Uüu	‹Uü‹‰ë‹ …ÀuêÃé÷ÜÿÿëÂY]Ã‹À‹…ÒtÇ     PR‹ÿPXÃ@ …ÒtRP‹RÿPX‹ …ÉuÃ‹QÿPÃ‹…É‰t‹QÿPÃ…Ò„´ÿÿÿW‰Çj TQR‹ÿ…Àt°éñÈÿÿ‹…ÀtP‹ ÿPX‰_Ã…ÀtP‹ ÿPÃƒÀPè—³ÿÿÃ‹Àƒx t°è»ÈÿÿÃ‹ÀèSÔÿÿÇ@   Ã@ U‹ìS‹]‹M‹U‹ÃèPÕÿÿ„Àt3Àë¸@ €[]Â ‹ÀU‹ì‹EƒÀPè5³ÿÿ]Â U‹ìSV‹]CPè'³ÿÿ‹ð…öu	²‹Ã‹ÿQü‹Æ^[]Â U‹ìƒÄøSV‰Mø‰Uü3Òƒ}ø „¸   3ö3É…À„‡   ël‹Uø·JAƒúwˆ0FëYúÿ  v1^;]üwS‹ÚÁë€Ëàˆ0‹ÚÁë€ã?€Ë€ˆ\0€â?€Ê€ˆT0ƒÆë ^;]üw"‹ÚÁë€ËÀˆ0€â?€Ê€ˆT0ƒÆ;Ms;uürŠ;uür‹uüNÆ0 ë";Ms‹Eø·HAƒúv
úÿ  vFFF;MrãV‹Â^[YY]Â U‹ìƒÄðSV‰Mô‰Uø‰Eüƒ}ô u
3À‰Eðé	  ÇEðÿÿÿÿ3À3öƒ}ü „©   é‚   ‹Uô3ÉŠ2FöÁ€tl;uƒØ   ƒá?öÁ t.‹UôŠ2F‹Ú€ãÀ€û€…»   ;uƒ²   €â?âÿ   ÁáÑ‹Ê‹UôŠ2F‹Ú€ãÀ€û€…   €â?âÿ   ÁáfÑ‹Müf‰Aë‹Uüf‰B@;us	;Eø‚pÿÿÿ;Eør‹EøH‹UüfÇB  ëG;usB‹UôŠ2FöÂ€t0;us5€â?öÂ t‹UôŠ2F€âÀ€ú€u;us‹UôŠ2F€âÀ€ú€u
@;ur¾@‰Eð‹Eð^[‹å]Â @ U‹ìj SV‹ò‹Ø3ÀUhSc@ dÿ0d‰ ‹Æè¨ßÿÿ‹Ã3Òèƒèÿÿt^‹Ãèèÿÿ@Eüè×åÿÿ‹ÃèüçÿÿP‹Eüè;âÿÿ@P‹ÃèÚçÿÿP‹Eüè)äÿÿYZè†ýÿÿ…À~‹ÐJEüèŸåÿÿëEüèIßÿÿ‹Æ‹Uüè“ßÿÿ3ÀZYYd‰hZc@ Eüè*ßÿÿÃé(Ùÿÿëð^[Y]ÃU‹ìj SV‹ò‹Ø3ÀUh÷c@ dÿ0d‰ ‹Æèæÿÿ…Ût]‹Ãè±áÿÿ‹ÐEüè›èÿÿ‹Ãè áÿÿP‹EüèOçÿÿ@P‹ÃèŽãÿÿP‹Eüè-çÿÿYZè¾ýÿÿ…À~‹ÐJEüècèÿÿëEüè±åÿÿ‹Æ‹Uüèãåÿÿ3ÀZYYd‰hþc@ Eüè’åÿÿÃé„Øÿÿëð^[Y]ÃU‹ìj SV‹ò‹Ø3ÀUhGd@ dÿ0d‰ Eü‹Óè­æÿÿ‹Eü‹Öèƒþÿÿ3ÀZYYd‰hNd@ EüèBåÿÿÃé4Øÿÿëð^[Y]ÃSVÄ üÿÿ‹ò‹Ø…Ût={   }*h   D$P‹CP‹‹ èØôÿÿPè¾®ÿÿ‹È‹Ô‹Æè×Þÿÿë
‹Æ‹SèÓßÿÿÄ   ^[Ã‹ÀU‹ìƒÄðS3Ò‰Uð3ÒUhe@ dÿ2d‰"jUõRh  Pè9®ÿÿEðUõ¹   èàÿÿ‹EðUüè¶Éÿÿ‹Øƒ}ü t3Û3ÀZYYd‰he@ EðèkÝÿÿÃéi×ÿÿëð‹Ã[‹å]ÃU‹ì3ÀUhje@ dÿ0d‰ ÿ¼åU u#¸PàU èÇÿÿ¸âU èÇÿÿ¸èãU èÇÿÿè0¶ÿÿ3ÀZYYd‰hqe@ Ãé×ÿÿëø]Ãƒ-¼åU ƒÅ   ÆU ÇàU ¸@ ÇàU À@ ÆNàU Ç àU (Q@ èzÍÿÿ„Àtè¡Íÿÿè`ÎÿÿfÇTàU °×fÇ âU °×fÇìãU °×è(­ÿÿ£@àU èî­ÿÿ£<àU èÌ­ÿÿ%   €=   €t-è»­ÿÿ%ÿ   fƒøvÇÀåU    ë è­ÿÿè†þÿÿ£ÀåU ëè­ÿÿèuþÿÿ£ÀåU èw­ÿÿ£4àU Ãÿ%<V ‹Àÿ%8V ‹Àÿ%4V ‹Àÿ%0V ‹ÀPj@èàÿÿÿÃ@ ¸   Ã‹ÀSèòÿÿÿ‹Ø…Ût6ƒ= U ÿu
¸â   èÕÛÿÿ‹ÃèÆÿÿÿ…Àu¸â   èÀÛÿÿëP¡ U Pè¢ÿÿÿ[ÃŠdæU ¡ U „Éu&d‹,   ‹‚Ãèÿÿÿ¡ U Pènÿÿÿ…ÀtÃ¡pæU ÃPè]ÿÿÿ…ÀtÛÃ¸¨U èøÿÿÃS‹Ø3À£ U j è+ÿÿÿ£hæU ¡hæU £¬U 3À£°U 3À£´U èÁÿÿÿº¨U ‹ÃèyØÿÿ[Ã@ U‹ì3ÀUhug@ dÿ0d‰ ÿlæU 3ÀZYYd‰h|g@ ÃéÕÿÿëø]Ã‹Àƒ-læU ÃU‹ìS‹]‰‰S‹E‰C‰K[]Â ‹À‰‰QÃ‹À…ÀtPHH°Ã3ÀÃ@ U‹ìS‹]‰‰SÈ‰KU‰S[]Â U‹ì3ÀUhh@ dÿ0d‰ ÿtæU 3ÀZYYd‰hh@ ÃévÔÿÿëø]Ã‹Àƒ-tæU Ãh@ .1       h@ 
odSelectedodGrayed
odDisabled	odChecked	odFocused	odDefault
odHotLight
odInactive	odNoAccelodNoFocusRectodReserved1odReserved2odComboBoxEditWindowsÌh@ TOwnerDrawStateh@ ‹Àÿ%XV ‹Àÿ%TV ‹Àÿ%PV ‹Àÿ%LV ‹Àÿ%HV ‹Àÿ%HV ‹Àÿ%DV ‹Àÿ%DV ‹Àÿ%¤V ‹Àÿ% V ‹Àÿ%œV ‹Àÿ%˜V ‹Àÿ%”V ‹ÀU‹ì‹EPƒ}À@ƒàP‹EPèÝÿÿÿ]Â ÿ%V ‹Àÿ%ŒV ‹Àÿ%ˆV ‹Àÿ%„V ‹Àÿ%€V ‹Àÿ%|V ‹Àÿ%xV ‹Àÿ%tV ‹Àÿ%pV ‹Àÿ%pV ‹Àÿ%lV ‹Àÿ%hV ‹Àÿ%dV ‹Àÿ%`V ‹Àÿ%\V ‹Àÿ%XV ‹Àÿ%TV ‹Àÿ%PV ‹Àÿ%LV ‹Àÿ%HV ‹Àÿ%DV ‹Àÿ%@V ‹Àÿ%<V ‹Àÿ%8V ‹Àÿ%4V ‹Àÿ%0V ‹Àÿ%,V ‹Àÿ%(V ‹Àÿ%$V ‹Àÿ% V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ% V ‹Àÿ%üV ‹Àÿ%øV ‹Àÿ%ôV ‹Àÿ%ðV ‹Àÿ%ìV ‹Àÿ%èV ‹Àÿ%äV ‹Àÿ%àV ‹Àÿ%ÜV ‹Àÿ%ØV ‹Àÿ%ÔV ‹Àÿ%ÐV ‹Àÿ%ÌV ‹Àÿ%ÈV ‹Àÿ%ÄV ‹Àÿ%ÀV ‹Àÿ%¼V ‹Àÿ%¸V ‹Àÿ%¸V ‹Àÿ%´V ‹Àÿ%°V ‹Àÿ%¬V ‹Àÿ%¨V ‹Àÿ%¤V ‹Àÿ% V ‹Àÿ%œV ‹Àÿ%˜V ‹Àÿ%”V ‹Àÿ%V ‹Àÿ%ŒV ‹Àÿ%ˆV ‹Àÿ%„V ‹Àÿ%€V ‹Àÿ%|V ‹Àÿ%xV ‹Àÿ%tV ‹Àÿ%pV ‹Àÿ%lV ‹Àÿ%hV ‹Àÿ%dV ‹Àÿ%`V ‹Àÿ%´V ‹Àÿ%°V ‹Àÿ%¬V ‹Àÿ%$V ‹Àÿ% V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ% V ‹Àÿ%üV ‹Àÿ%øV ‹Àÿ%ôV ‹Àÿ%ðV ‹Àÿ%ìV ‹Àÿ%èV ‹Àÿ%äV ‹Àÿ%àV ‹Àÿ%ÜV ‹Àÿ%ØV ‹Àÿ%ÔV ‹Àÿ%ÐV ‹Àÿ%ÌV ‹Àÿ%ÈV ‹Àÿ%ÄV ‹Àÿ%ÀV ‹Àÿ%¼V ‹Àÿ%¸V ‹Àÿ%´V ‹Àÿ%°V ‹Àÿ%¬V ‹Àÿ%¨V ‹Àÿ%¤V ‹Àÿ% V ‹Àÿ%œV ‹Àÿ%˜V ‹Àÿ%”V ‹Àÿ%V ‹Àÿ%ŒV ‹Àÿ%ˆV ‹Àÿ%„V ‹Àÿ%€V ‹Àÿ%|V ‹Àÿ%xV ‹Àÿ%tV ‹Àÿ%pV ‹Àÿ%lV ‹Àÿ%hV ‹Àÿ%dV ‹Àÿ%`V ‹Àÿ%\V ‹Àÿ%XV ‹Àÿ%TV ‹Àÿ%PV ‹Àÿ%LV ‹Àÿ%HV ‹Àÿ%DV ‹Àÿ%@V ‹Àÿ%<V ‹Àÿ%8V ‹Àÿ%4V ‹Àÿ%0V ‹Àÿ%,V ‹Àÿ%(V ‹Àÿ%$V ‹Àÿ% V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ% V ‹Àÿ%üV ‹Àÿ%øV ‹Àÿ%ôV ‹Àÿ%ðV ‹Àÿ%ìV ‹Àÿ%èV ‹Àÿ%äV ‹Àÿ%àV ‹Àÿ%ÜV ‹Àÿ%ØV ‹Àÿ%ÔV ‹Àÿ%ÐV ‹Àÿ%ÌV ‹Àÿ%ÈV ‹Àÿ%ÄV ‹Àÿ%ÀV ‹Àÿ%¼V ‹Àÿ%øV ‹Àÿ%ôV ‹Àÿ%äV ‹Àÿ%ØV ‹Àÿ%ÔV ‹Àÿ%ÐV ‹Àÿ%ÌV ‹Àÿ%àV ‹Àÿ%ÜV ‹Àÿ%ðV ‹Àÿ%ðV ‹Àÿ%ìV ‹Àÿ%èV ‹Àÿ%ÈV ‹Àÿ%ÄV ‹Àÿ%ÀV ‹Àÿ%¼V ‹Àÿ%¸V ‹Àÿ%´V ‹Àÿ%°V ‹Àÿ%¬V ‹Àÿ%¨V ‹Àÿ%¤V ‹Àÿ% V ‹Àÿ%œV ‹Àÿ%˜V ‹Àÿ%”V ‹Àÿ%V ‹Àÿ%ŒV ‹Àÿ%ˆV ‹Àÿ%„V ‹Àÿ%€V ‹Àÿ%|V ‹Àÿ%xV ‹Àÿ%tV ‹Àÿ%pV ‹Àÿ%lV ‹Àÿ%hV ‹Àÿ%dV ‹Àÿ%`V ‹Àÿ%\V ‹Àÿ%XV ‹Àÿ%TV ‹Àÿ%PV ‹Àÿ%LV ‹Àÿ%HV ‹Àÿ%DV ‹Àÿ%@V ‹Àÿ%<V ‹Àÿ%8V ‹Àÿ%4V ‹Àÿ%0V ‹Àÿ%,V ‹Àÿ%(V ‹Àÿ%$V ‹Àÿ% V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ% V ‹Àÿ%üV ‹Àÿ%øV ‹Àÿ%ôV ‹Àÿ%ðV ‹Àÿ%ìV ‹Àÿ%èV ‹Àÿ%äV ‹Àÿ%àV ‹Àÿ%ÜV ‹Àÿ%ØV ‹Àÿ%ÔV ‹Àÿ%ÐV ‹Àÿ%ÌV ‹Àÿ%ÈV ‹Àÿ%ÄV ‹Àÿ%ÀV ‹Àÿ%¼V ‹Àÿ%¸V ‹Àÿ%´V ‹Àÿ%°V ‹Àÿ%¬V ‹Àÿ%¨V ‹Àÿ%¤V ‹Àÿ% V ‹Àÿ%œV ‹Àÿ%˜V ‹Àÿ%”V ‹Àÿ%ÀV ‹Àÿ%V ‹Àÿ%ŒV ‹Àÿ%ˆV ‹Àÿ%„V ‹Àÿ%€V ‹Àÿ%|V ‹Àÿ%|V ‹Àÿ%xV ‹Àÿ%tV ‹Àÿ%pV ‹Àÿ%lV ‹Àÿ%hV ‹Àÿ%dV ‹Àÿ%`V ‹Àÿ%\V ‹Àÿ%XV ‹Àÿ%TV ‹Àÿ%PV ‹Àÿ%LV ‹Àÿ%HV ‹Àÿ%DV ‹Àÿ%@V ‹Àÿ%<V ‹Àÿ%8V ‹Àÿ%4V ‹Àÿ%0V ‹Àÿ%,V ‹Àÿ%(V ‹Àÿ%$V ‹Àÿ% V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ%V ‹Àÿ% V ‹Àÿ%üV ‹Àÿ%øV ‹Àÿ%ôV ‹Àÿ%ðV ‹Àÿ%ìV ‹Àÿ%èV ‹Àÿ%äV ‹Àÿ%àV ‹Àÿ%ÜV ‹Àÿ%ØV ‹Àÿ%ÔV ‹Àÿ%ÐV ‹Àÿ%ÌV ‹Àÿ%ÈV ‹Àÿ%ÄV ‹Àÿ%ÀV ‹Àÿ%¼V ‹Àÿ%¸V ‹Àÿ%´V ‹Àÿ%°V ‹Àÿ%¬V ‹Àÿ%¨V ‹Àÿ%¤V ‹Àÿ% V ‹Àÿ%œV ‹Àÿ%˜V ‹Àÿ%”V ‹Àÿ%V ‹Àÿ%ŒV ‹Àÿ%ˆV ‹Àÿ%„V ‹Àÿ%€V ‹Àÿ%|V ‹Àÿ%xV ‹Àÿ%tV ‹Àÿ%pV ‹Àÿ%lV ‹Àÿ%hV ‹Àÿ%dV ‹Àÿ%`V ‹Àÿ%\V ‹Àÿ%XV ‹Àÿ%TV ‹Àÿ%PV ‹Àÿ%LV ‹Àÿ%HV ‹Àÿ%DV ‹Àÿ%@V ‹Àÿ%<V ‹Àÿ%8V ‹Àÿ%4V ‹Àÿ%0V ‹À·À·ÒÁâÂÃÁèÃèöÿÿÃ‹À3ÀÃRPèöÿÿPè7öÿÿÃ‹ÀQRPè4öÿÿPPè=öÿÿè0öÿÿPèöÿÿÃPèöÿÿPPè#öÿÿèþõÿÿÃÁââ   ÿÂÃ%ÿ   âÿ   ÁâÂ3ÒŠÑÁâÂÃ‹ÀÃ@ ÁèÃÁèÃQ‰$¿$‰¿D$‰BZÃQf‹f‰$f‹@f‰D$‹$ZÃ‹Àè?ÿÿÿÃ‹Àè7ÿÿÿÃ‹Àÿ%,V ‹ÀU‹ìQSVW‰Mü‹ú‹ðèÝµÿÿ‹Ø‹EP‹EP‹EP‹EP‹EP‹EP‹E P‹E$P‹E(P‹EüPWVè´ÿÿÿ‹ð‹Ãè“µÿÿ‹Æ_^[Y]Â$ U‹ìQSVW‰Mü‹ú‹ðè…µÿÿ‹Ø‹EP‹EP‹EP‹EP‹EP‹EP‹E P‹E$P‹EüPWVj è^ÿÿÿ‹ð‹Ãè=µÿÿ‹Æ_^[Y]Â  @ U‹ìQSVW‹ù‹ò‰Eüh´v@ hÈv@ èúÿÿ‹ØhÐv@ èÛüÿÿ‹Uü‰hàv@ èÌüÿÿ‰høv@ èÀüÿÿ‰ƒ> t…Ûtj j ‹PSèèüÿÿ‹U‰ë‹E3Ò‰ƒ? t…Ûtj j ‹PSèÄüÿÿ‹U‰ë	‹EÇ    ‹Ã_^[Y]Â   Magellan MSWHEEL    MouseZ  MSWHEEL_ROLLMSG MSH_WHEELSUPPORT_MSG    MSH_SCROLL_LINES_MSG    U‹ì3ÀUh5w@ dÿ0d‰ ÿxæU 3ÀZYYd‰h<w@ ÃéFÅÿÿëø]Ã‹Àƒ-xæU ÃU‹ì3ÀUhmw@ dÿ0d‰ ÿ|æU 3ÀZYYd‰htw@ ÃéÅÿÿëø]Ã‹Àƒ-|æU ÃhæU ðÿ  hæU ñÿ  hæU òÿ  hæU óÿ  hæU ôÿ  hæU õÿ  hæU öÿ  hæU ÷ÿ  hæU øÿ  hæU ùÿ  hæU úÿ  hæU ûÿ  hæU üÿ  hæU ýÿ  hæU þÿ  hæU ÿÿ  hæU àÿ  hæU áÿ  hæU âÿ  hæU ãÿ  hæU äÿ  hæU åÿ  hæU æÿ  hæU çÿ  hæU èÿ  hæU éÿ  hæU êÿ  hæU ëÿ  hæU ìÿ  hæU íÿ  hæU îÿ  hæU ïÿ  hæU Ðÿ  hæU Ñÿ  hæU Òÿ  hæU Óÿ  hæU Ôÿ  hæU Õÿ  hæU Öÿ  hæU ×ÿ  hæU Øÿ  hæU Ùÿ  hæU Úÿ  hæU Ûÿ  hæU Üÿ  hæU Ýÿ  hæU Þÿ  hæU ßÿ  hæU Àÿ  hæU Áÿ  hæU Âÿ  hæU Ãÿ  hæU Äÿ  hæU Åÿ  hæU Æÿ  hæU Çÿ  hæU Èÿ  hæU Éÿ  hæU Êÿ  hæU Ëÿ  hæU Ìÿ  hæU Íÿ  hæU Îÿ  hæU Ïÿ  hæU °ÿ  hæU ±ÿ  hæU ²ÿ  hæU ³ÿ  hæU ´ÿ  hæU µÿ  hæU ¶ÿ  hæU ·ÿ  hæU ¸ÿ  hæU ¹ÿ  hæU ºÿ  hæU »ÿ  hæU ¼ÿ  hæU ½ÿ  hæ