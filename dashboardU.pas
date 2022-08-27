unit dashboardU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  TeEngine, Series, TeeProcs, Chart, ComCtrls, DbChart;

type
  Tfrm_Dashboard = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    tbl_ContasPagar: TTable;
    ds_ContasPagar: TDataSource;
    ds_ContasReceber: TDataSource;
    tbl_ContasReceber: TTable;
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
    Panel7: TPanel;
    cbPesquisa: TComboBox;
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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label4: TLabel;
    lblData: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DBContasReceber: TDBGrid;
    Chart1: TChart;
    Series1: TPieSeries;
    DBContasPagar: TDBGrid;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    DataInicial: TDateTimePicker;
    Label7: TLabel;
    DataFinal: TDateTimePicker;
    SpeedButton5: TSpeedButton;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ckResultado: TCheckBox;
    Chart2: TChart;
    Series2: TBarSeries;
    tbl_Movimentacoes: TTable;
    ds_Movimentacoes: TDataSource;
    Chart3: TChart;
    Series3: TPieSeries;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Chart5: TChart;
    BarSeries1: TBarSeries;
    listCliente: TListBox;
    Panel2: TPanel;
    cbCliente: TComboBox;
    tbl_Clientes: TTable;
    tbl_VendTotal: TTable;
    SpeedButton8: TSpeedButton;
    Panel3: TPanel;
    editConsulta: TEdit;
    ListBox1: TListBox;
    tbl_Mes: TTable;
    tbl_MesCodVendTotal: TIntegerField;
    tbl_MesCliente_VendTotal: TStringField;
    tbl_MesUsuario_VendTotal: TStringField;
    tbl_MesTotal_VendTotal: TCurrencyField;
    tbl_MesData_VendTotal: TDateField;
    tbl_MesDataVenc_VendTotal: TDateField;
    tbl_MesPrazo_VendTotal: TIntegerField;
    tbl_MesFormPag_VendTotal: TStringField;
    tbl_MesSituacao_VendTotal: TStringField;
    tbl_MesFrete_VendTotal: TCurrencyField;
    tbl_VendTotalCodVendTotal: TIntegerField;
    tbl_VendTotalCliente_VendTotal: TStringField;
    tbl_VendTotalUsuario_VendTotal: TStringField;
    tbl_VendTotalTotal_VendTotal: TCurrencyField;
    tbl_VendTotalData_VendTotal: TDateField;
    tbl_VendTotalDataVenc_VendTotal: TDateField;
    tbl_VendTotalPrazo_VendTotal: TIntegerField;
    tbl_VendTotalFormPag_VendTotal: TStringField;
    tbl_VendTotalSituacao_VendTotal: TStringField;
    tbl_VendTotalFrete_VendTotal: TCurrencyField;
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
    Chart4: TChart;
    ckVendTotal: TCheckBox;
    tbl_Compras: TTable;
    tbl_ComprasCod_CompTotal: TIntegerField;
    tbl_ComprasFornecedor_CompTotal: TStringField;
    tbl_ComprasLote_CompTotal: TStringField;
    tbl_ComprasData_CompTotal: TDateField;
    tbl_ComprasTotal_CompTotal: TCurrencyField;
    tbl_ComprasFormPag_CompTotal: TStringField;
    tbl_ComprasUsuario_CompTotal: TStringField;
    tbl_ComprasDataVenc_CompTotal: TDateField;
    tbl_ComprasPrazo_CompTotal: TIntegerField;
    tbl_ComprasFrete_CompTotal: TCurrencyField;
    tbl_ComprasSituacao_CompTotal: TStringField;
    GroupBox4: TGroupBox;
    ckVendas: TCheckBox;
    ckCompras: TCheckBox;
    ckLucros: TCheckBox;
    Series4: TLineSeries;
    Series5: TLineSeries;
    ck3d: TCheckBox;
    RadioGroup1: TRadioGroup;
    Series6: TLineSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    Series10: THorizBarSeries;
    Series11: THorizBarSeries;
    Series12: THorizBarSeries;
    Series13: TAreaSeries;
    Series14: TAreaSeries;
    Series15: TAreaSeries;
    TabSheet5: TTabSheet;
    rdDespesas: TRadioButton;
    rdReceitas: TRadioButton;
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
    tbl_Plano: TTable;
    Label11: TLabel;
    tbl_PlanoCod_Planos: TAutoIncField;
    tbl_PlanoDescricao_Planos: TStringField;
    tbl_PlanoDoc_Planos: TStringField;
    tbl_PlanoValor_Planos: TCurrencyField;
    tbl_PlanoData_Planos: TDateField;
    tbl_PlanoDataVenc_Planos: TDateField;
    tbl_PlanoTipo_Planos: TStringField;
    tbl_PlanoId_PlanoContas: TIntegerField;
    DataSource1: TDataSource;
    Chart6: TChart;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnAtualizar: TSpeedButton;
    dtInicio: TDateTimePicker;
    dtFinal: TDateTimePicker;
    PieSeries1: TPieSeries;
    Label12: TLabel;
    tbl_PlanoContas: TTable;
    tbl_PlanoContasCod_PlanoContas: TIntegerField;
    tbl_PlanoContasDescricao_PlanoContas: TStringField;
    tbl_PlanoContasSequencia_PlanoContas: TStringField;
    tbl_PlanoContasTipo_PlanoContas: TStringField;
    tbl_PlanoContasCategoria_PlanoContas: TStringField;
    tbl_PlanoContasAtivo_PlanoContas: TStringField;
    tbl_PlanoContasValorTotal_PlanoContas: TCurrencyField;
    cbContaCorrente: TComboBox;
    tbl_ContaCorrente: TTable;
    tbl_ContaCorrenteCod_ContaCorrente: TAutoIncField;
    tbl_ContaCorrenteDescricao_ContaCorrente: TStringField;
    tbl_ContaCorrenteAgencia_ContaCorrente: TStringField;
    tbl_ContaCorrenteBanco_ContaCorrente: TStringField;
    tbl_ContaCorrenteAtivo_ContaCorrente: TStringField;
    tbl_ContaCorrenteId_Conta: TIntegerField;
    tbl_ContaCorrenteConta_ContaCorrente: TStringField;
    tbl_ContaCorrenteSaldo_ContaCorrente: TCurrencyField;
    tbl_Planoid_ContaCorrente: TIntegerField;
    Label13: TLabel;
    Label14: TLabel;
    cbContaCorrente_RvsD: TComboBox;
    TabSheet6: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    editIniDataMov: TDateTimePicker;
    editFinalDataMov: TDateTimePicker;
    Label15: TLabel;
    Chart7: TChart;
    cbContaCorrente_Mov: TComboBox;
    Label16: TLabel;
    btnRefresh: TSpeedButton;
    Series16: TLineSeries;
    Series17: TLineSeries;
    tbl_DataMov: TTable;
    procedure DBContasPagarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBContasReceberDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ckResultadoClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ckVendTotalClick(Sender: TObject);
    procedure ckVendasClick(Sender: TObject);
    procedure ckComprasClick(Sender: TObject);
    procedure ckLucrosClick(Sender: TObject);
    procedure ck3dClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure rdDespesasClick(Sender: TObject);
    procedure rdReceitasClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbContaCorrenteChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure AtualizarData;
    procedure FiltrarPagRec;
    procedure Receber;
    procedure Pagar;
    procedure Hoje;
    procedure Amanha;
    procedure ProxSeteDias;
    procedure EsconderGrafico;
    procedure Despesas;
    procedure Receitas;
    procedure Resultados;
    procedure FiltrarPeriodo;
    procedure CarregarClientes;
    procedure VerificarLista;
    procedure FiltrarCliente;
    procedure AdicionarLista;
    procedure GraficoCliente;
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
    procedure LimparSeries;
    procedure Desmarcar;
    procedure PlanoContas;
    procedure PlanoDespesas;
    procedure PlanoReceitas;
    procedure AbrirTabControl;
    procedure CarregaContaCombo;
    procedure PlanoContaPadrao;
    procedure Movimentacao;
        
  public
  despesa, receita, resultado, totalreceber, totalpagar : String;
  item : Integer;
  

  end;
  type
TDBGridPadrao = class(TDBGrid);
var
  frm_Dashboard: Tfrm_Dashboard;


implementation

uses principalU;

{$R *.dfm}

procedure Tfrm_Dashboard.DBContasPagarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

// mudando posição e alinhamento vertical do texto de cada linha

//DBContasPagar.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );
end;

procedure Tfrm_Dashboard.SpeedButton1Click(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_Dashboard.FormCreate(Sender: TObject);
begin
AbrirTabelas;
AtualizarData;
FiltrarPagRec;
Receber;
Pagar;
CarregarClientes;
CarregaContaCombo;
Desmarcar;
PlanoContas;
AbrirTabControl;
PlanoContaPadrao;
Despesas;
Receitas;
Movimentacao;
Resultados;

end;

procedure Tfrm_Dashboard.AbrirTabelas;
begin
tbl_DataMov.Active := true;
tbl_ContasPagar.Active := true;
tbl_ContasReceber.Active := true;
tbl_Movimentacoes.Active := true;
tbl_Clientes.Active := true;
tbl_VendTotal.Active := true;
tbl_Mes.Active := true;
tbl_Compras.Active := true;
tbl_Plano.Active := true;
tbl_PlanoContas.Active := true;
tbl_ContaCorrente.Active := true;
end;

procedure Tfrm_Dashboard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
tabind := '0';
end;

procedure Tfrm_Dashboard.FecharTabelas;
begin
tbl_ContasPagar.Active := false;
tbl_DataMov.Active := false;
tbl_ContasReceber.Active := false;
tbl_Movimentacoes.Active := false;
tbl_Clientes.Active := false;
tbl_VendTotal.Active := false;
tbl_Mes.Active := false;
tbl_Compras.Active := false;
tbl_Plano.Active := false;
tbl_PlanoContas.Active := false;
tbl_ContaCorrente.Active := false;
end;

procedure Tfrm_Dashboard.DBContasReceberDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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
end;

procedure Tfrm_Dashboard.Receber;
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

Series1.AddY(StrToCurrDef(totalreceber,0),'Receber',$0048D50D);
end;

procedure Tfrm_Dashboard.Pagar;
var
soma : Real;
begin
soma := 0;

with tbl_ContasPagar do
begin
  First;
  while not tbl_ContasPagar.Eof do
  begin
  soma:= (soma + tbl_ContasPagar.FieldByName('Valor_RestContasDetalhes').AsFloat);
  Next;
  end;
  totalpagar := FloatToStr(soma);
  end;
Series1.AddY(StrToCurrDef(totalpagar,0),'Pagar',clRed);
end;

procedure Tfrm_Dashboard.FiltrarPagRec;
begin
with tbl_ContasPagar do
begin
Filtered := false;
Filter := 'Valor_RestContasDetalhes >0 ';
Filtered := true;
end;

with tbl_ContasReceber do
begin
Filtered := false;
Filter := 'Falta_ContasReceber >0 ';
Filtered := true;
end;

end;

procedure Tfrm_Dashboard.AtualizarData;
begin
lblData.Caption := DateToStr(now);
DataInicial.Date := now - IncMonth(1);
DataFinal.Date := now;
dtInicio.Date := now - 30;
dtFinal.Date := now;
editIniDataMov.Date := now - 30;
editFinalDataMov.Date := now;
FiltrarPeriodo;
end;

procedure Tfrm_Dashboard.SpeedButton2Click(Sender: TObject);
begin
Series1.Clear;
Hoje;
Pagar;
Receber;
EsconderGrafico;
end;

procedure Tfrm_Dashboard.Hoje;
var
data : String;
begin

data := DateToStr(now);

with tbl_ContasPagar do
begin
Filtered := false;
Filter := 'Data_VencContasDetalhes = '+Quotedstr(data)+' and Valor_RestContasDetalhes >0 ';
Filtered := true;
end;

with tbl_ContasReceber do
begin
Filtered := false;
Filter := 'Data_VencContasReceber = '+Quotedstr(data)+' and Falta_ContasReceber >0 ';
Filtered := true;
end;
lblData.Caption := data;
end;

procedure Tfrm_Dashboard.SpeedButton3Click(Sender: TObject);
begin
Series1.Clear;
Amanha;
Pagar;
Receber;
EsconderGrafico;
end;

procedure Tfrm_Dashboard.Amanha;
var
data : String;
begin

data := DateToStr(now+1);

with tbl_ContasPagar do
begin
Filtered := false;
Filter := 'Data_VencContasDetalhes = '+Quotedstr(data)+' and Valor_RestContasDetalhes >0 ';
Filtered := true;
end;

with tbl_ContasReceber do
begin
Filtered := false;
Filter := 'Data_VencContasReceber = '+Quotedstr(data)+' and Falta_ContasReceber >0 ';
Filtered := true;
end;
lblData.Caption := data;
end;

procedure Tfrm_Dashboard.SpeedButton4Click(Sender: TObject);
begin
Series1.Clear;
ProxSeteDias;
Pagar;
Receber;
EsconderGrafico;
end;

procedure Tfrm_Dashboard.ProxSeteDias;
var
data : String;
begin

data := DateToStr(now+7);

with tbl_ContasPagar do
begin
Filtered := false;
Filter := 'Data_VencContasDetalhes >= '+Quotedstr(DateTostr(now))+' and Data_VencContasDetalhes <= '+Quotedstr(data)+' and Valor_RestContasDetalhes >0 ';
Filtered := true;
end;

with tbl_ContasReceber do
begin
Filtered := false;
Filter := 'Data_VencContasReceber >= '+Quotedstr(DateToStr(now))+' and Data_VencContasReceber <= '+Quotedstr(data)+' and Falta_ContasReceber >0 ';
Filtered := true;
end;
lblData.Caption := data;
end;

procedure Tfrm_Dashboard.EsconderGrafico;
begin
Chart1.Visible := true;
if (tbl_ContasPagar.RecordCount = 0)and(tbl_ContasReceber.RecordCount = 0) then
begin
Chart1.Visible := false;
end;
end;

procedure Tfrm_Dashboard.Despesas;
var
soma : Real;
dt_inicial, dt_final, id_cc,combo_cc : String;
begin
soma := 0;
combo_cc := cbContaCorrente_RvsD.Text;
dt_inicial := DateToStr(DataInicial.Date);
dt_final := DateToStr(DataFinal.Date);

with tbl_ContaCorrente do
begin
  Filtered:=false;
  Filter := 'Descricao_ContaCorrente = '+Quotedstr(combo_cc);
  Filtered := true;
  id_cc := FieldByName('Cod_ContaCorrente').AsString;
  Filtered := false;
end;



with tbl_Movimentacoes do
begin

  Filtered := false;
  Filter := 'Id_Movimentacao = '+QuotedStr(id_cc)+' and Data_Movimentacao >= '+QuotedStr(dt_inicial)+' and Data_Movimentacao <= '+QuotedStr(dt_final);
  Filtered := true;
  First;
  while not tbl_Movimentacoes.Eof do
  begin
  soma:= (soma + tbl_Movimentacoes.FieldByName('Debito_Movimentacao').AsFloat);
  Next;
  end;
  despesa := FloatToStr(soma);
  end;
//Series1.Clear;
Series2.Add(StrToCurrDef(despesa,0),'Despesas',clRed);
Series3.Add(StrToCurrDef(despesa,0),'Despesas',clRed);
end;

procedure Tfrm_Dashboard.Receitas;
var
soma : Real;
dt_inicial, dt_final, id_cc,combo_cc : String;
begin
soma := 0;
combo_cc := cbContaCorrente_RvsD.Text;
dt_inicial := DateToStr(DataInicial.Date);
dt_final := DateToStr(DataFinal.Date);

with tbl_ContaCorrente do
begin
  Filtered:=false;
  Filter := 'Descricao_ContaCorrente = '+Quotedstr(combo_cc);
  Filtered := true;
  id_cc := FieldByName('Cod_ContaCorrente').AsString;
  Filtered := false;
end;



with tbl_Movimentacoes do
begin
  Filtered := false;
  Filter := 'Id_Movimentacao = '+QuotedStr(id_cc)+' and Data_Movimentacao >= '+QuotedStr(dt_inicial)+' and Data_Movimentacao <= '+QuotedStr(dt_final);
  Filtered := true;
  First;
  while not tbl_Movimentacoes.Eof do
  begin
   soma := (soma + tbl_Movimentacoes.FieldByName('Credito_Movimentacao').AsFloat);
  Next;
  end;
 receita := FloatToStr(soma);
  end;

Series2.Add(StrToCurrDef(receita,0),'Receitas',clGreen);
Series3.Add(StrToCurrDef(receita,0),'Receitas',clGreen);
end;

procedure Tfrm_Dashboard.Resultados;
var
debito, credito, total : Real;
begin
debito := 0;
credito := 0;

with tbl_Movimentacoes do
begin
  First;
  while not tbl_Movimentacoes.Eof do
  begin
  debito := (debito + tbl_Movimentacoes.FieldByName('Debito_Movimentacao').AsFloat);
  credito := (credito + tbl_Movimentacoes.FieldByName('Credito_Movimentacao').AsFloat);
  Next;
  end;
  total := credito - debito;
  resultado := FloatToStr(total);
  end;
//Series1.Clear;
Series2.Add(StrToCurrDef(resultado,0),'Resultado',clBlue);
Series3.Add(StrToCurrDef(resultado,0),'Resultado',clBlue);
end;


procedure Tfrm_Dashboard.ckResultadoClick(Sender: TObject);
begin
if ckResultado.Checked = true then
begin
Series2.Clear;
Series3.Clear;
Despesas;
Receitas;
Resultados;
end else
if ckResultado.Checked = false then
begin
Series2.Clear;
Series3.Clear;
Despesas;
Receitas;
end;
end;

procedure Tfrm_Dashboard.RadioButton2Click(Sender: TObject);
begin
if RadioButton2.Checked = true then
begin
Chart3.Visible := true;
end else
if RadioButton2.Checked = false then
begin
Chart3.Visible := false;
end;
end;

procedure Tfrm_Dashboard.RadioButton1Click(Sender: TObject);
begin
if RadioButton1.Checked = true then
begin
Chart3.Visible := false;
end else
if RadioButton1.Checked = false then
begin
Chart3.Visible := true;
end;
end;

procedure Tfrm_Dashboard.FiltrarPeriodo;
var
dataini, datafin : String;
begin
with tbl_Movimentacoes do
begin
dataini := DateToStr(DataInicial.Date);
datafin := DateToStr(DataFinal.Date);

Filtered := false;
Filter := 'Data_Movimentacao >= '+Quotedstr(dataini)+' and Data_Movimentacao <= '+Quotedstr(datafin);
Filtered := true;
end;
end;

procedure Tfrm_Dashboard.SpeedButton5Click(Sender: TObject);
begin
//FiltrarPeriodo;
Series1.Clear;
Series2.Clear;
Series3.Clear;
//Despesas;
//Receitas;
if ckResultado.Checked = true then
begin
Despesas;
Receitas;
Resultados;
end;
if tbl_Movimentacoes.RecordCount = 0 then
begin
MessageDlg('Não a items a serem exibidos!',MtInformation,[mbok],0);
AtualizarData;
Receitas;
Despesas;
if ckResultado.Checked = true then
begin
Resultados;
end;
end;
end;

procedure Tfrm_Dashboard.CarregarClientes;
begin
with tbl_Clientes do
begin
  Active := false;
  Active := true;

  if not IsEmpty then
  begin
    While not Eof do
    begin
    cbCliente.Items.Add(tbl_Clientes.FieldByName('Nome_Cliente').AsString);
    listBox1.Items.Add(tbl_Clientes.FieldByName('Nome_Cliente').AsString);
    Next;
    end;
  end;
end;
end;

procedure Tfrm_Dashboard.SpeedButton8Click(Sender: TObject);
begin
if (cbCliente.Text = '')or(cbCliente.Text = 'ESCOLA O CLIENTE DESEJADO') then
begin
MessageDlg('Escolha um cliente para por a lista!',MtWarning,[mbok],0);
exit;
end;
VerificarLista;
FiltrarCliente;
AdicionarLista;
end;

procedure Tfrm_Dashboard.VerificarLista;
var
nome : String;
begin
Item := listCliente.Perform(LB_SELECTSTRING,0,LongInt(pChar(cbCliente.Text)));
item := listCliente.Perform(LB_SELECTSTRING,0,LongInt(pChar(cbCliente.Text)));
end;

procedure Tfrm_Dashboard.FiltrarCliente;
begin
with tbl_VendTotal do
begin
Filtered := false;
Filter := 'Cliente_VendTotal = '+Quotedstr(cbCliente.Text);
Filtered := true;
end;
end;
procedure Tfrm_Dashboard.AdicionarLista;
begin
if (item = -1)then
begin
listCliente.Items.Add(cbCliente.Text);
GraficoCliente;
exit;
end;
if (item <> item)then
begin
listCliente.Items.Add(cbCliente.Text);
GraficoCliente;
exit;
end else
if (item = item) then
begin
MessageDlg('Esse cliente já está na lista!, por favor escoha outro!',MtWarning,[mbok],0);
end;
end;

procedure Tfrm_Dashboard.GraficoCliente;
var
soma : Real;
cliente : String;
begin
with tbl_VendTotal do
begin
Active := false;
Active := true;
First;
if not IsEmpty then
begin
while not Eof do
begin
  soma:= (soma + tbl_VendTotal.FieldByName('Total_VendTotal').AsFloat);
  Next;
end;
end;
cliente := FloatToStr(soma);
BarSeries1.Add(StrToCurrDef(cliente,0),cbCliente.Text);
end;
end;

procedure Tfrm_Dashboard.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure Tfrm_Dashboard.editConsultaExit(Sender: TObject);
begin
editConsulta.Text := 'Digite seu texto aqui';
end;

procedure Tfrm_Dashboard.editConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text)>0 then
begin
ListBox1.Perform(LB_SELECTSTRING,0,LongInt(pChar(editConsulta.Text)));
end;
end;

procedure Tfrm_Dashboard.ListBox1Click(Sender: TObject);
begin
LimparSeries;
ckVendTotal.Checked := false;
ckCompras.Checked := false;
ckLucros.Checked := false;
ckVendas.Checked := true;
GraficoPeriodoMes;
GroupBox4.Visible := false;

end;

procedure Tfrm_Dashboard.GraficoPeriodoMes;
begin
Janeiro;
Fevereiro;
Marco;
Abril;
Maio;
Junho;
Julho;
Agosto;
Setembro;
Outubro;
Novembro;
Dezembro;
end;

procedure Tfrm_Dashboard.Janeiro;
var
dia,mes,ano, janeiro : String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma, soma2, total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini);
data2 := data + 30;

tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;

total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Janeiro');
Series7.Add(soma,'Janeiro');
Series10.Add(soma,'Janeiro');
Series13.Add(soma,'Janeiro');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Janeiro');
Series8.Add(soma2,'Janeiro');
Series11.Add(soma2,'Janeiro');
Series14.Add(soma2,'Janeiro');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Janeiro');
Series9.Add(total,'Janeiro');
Series12.Add(total,'Janeiro');
Series15.Add(total,'Janeiro');
end;

end;
end;
end;


procedure Tfrm_Dashboard.Fevereiro;
var
dia,mes,ano, Fevereiro : String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+31;
data2 := data + 28;

tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Fevereiro');
Series7.Add(soma,'Fevereiro');
Series10.Add(soma,'Fevereiro');
Series13.Add(soma,'Fevereiro');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Fevereiro');
Series8.Add(soma2,'Fevereiro');
Series11.Add(soma2,'Fevereiro');
Series14.Add(soma2,'Fevereiro');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Fevereiro');
Series9.Add(total,'Fevereiro');
Series12.Add(total,'Fevereiro');
Series15.Add(total,'Fevereiro');
end;

end;
end;
end;


procedure Tfrm_Dashboard.Marco;
var
dia,mes,ano, marco : String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+60;
data2 := data + 30;




tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Março');
Series7.Add(soma,'Março');
Series10.Add(soma,'Março');
Series13.Add(soma,'Março');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Março');
Series8.Add(soma2,'Março');
Series11.Add(soma2,'Março');
Series14.Add(soma2,'Março');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Março');
Series9.Add(total,'Março');
Series12.Add(total,'Março');
Series15.Add(total,'Março');
end;

end;
end;
end;

procedure Tfrm_Dashboard.Abril;
var
dia,mes,ano, abril : String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+91;
data2 := data + 29;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Abril');
Series7.Add(soma,'Abril');
Series10.Add(soma,'Abril');
Series13.Add(soma,'Abril');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Abril');
Series8.Add(soma2,'Abril');
Series11.Add(soma2,'Abril');
Series14.Add(soma2,'Abril');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Abril');
Series9.Add(total,'Abril');
Series12.Add(total,'Abril');
Series15.Add(total,'Abril');
end;

end;
end;
end;

procedure Tfrm_Dashboard.Maio;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+121;
data2 := data + 30;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else

if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Maio');
Series7.Add(soma,'Maio');
Series10.Add(soma,'Maio');
Series13.Add(soma,'Maio');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Maio');
Series8.Add(soma2,'Maio');
Series11.Add(soma2,'Maio');
Series14.Add(soma2,'Maio');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Maio');
Series9.Add(total,'Maio');
Series12.Add(total,'Maio');
Series15.Add(total,'Maio');
end;

end;
end;
end;

procedure Tfrm_Dashboard.Junho;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+152;
data2 := data + 29;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Junho');
Series7.Add(soma,'Junho');
Series10.Add(soma,'Junho');
Series13.Add(soma,'Junho');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Junho');
Series8.Add(soma2,'Junho');
Series11.Add(soma2,'Junho');
Series14.Add(soma2,'Junho');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Junho');
Series9.Add(total,'Junho');
Series12.Add(total,'Junho');
Series15.Add(total,'Junho');
end;

end;
end;
end;

procedure Tfrm_Dashboard.Julho;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+182;
data2 := data + 30;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Julho');
Series7.Add(soma,'Julho');
Series10.Add(soma,'Julho');
Series13.Add(soma,'Julho');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Julho');
Series8.Add(soma2,'Julho');
Series11.Add(soma2,'Julho');
Series14.Add(soma2,'Julho');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Julho');
Series9.Add(total,'Julho');
Series12.Add(total,'Julho');
Series15.Add(total,'Julho');
end;

end;
end;
end;

procedure Tfrm_Dashboard.Agosto;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+213;
data2 := data + 30;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Agosto');
Series7.Add(soma,'Agosto');
Series10.Add(soma,'Agosto');
Series13.Add(soma,'Agosto');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Agosto');
Series8.Add(soma2,'Agosto');
Series11.Add(soma2,'Agosto');
Series14.Add(soma2,'Agosto');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Agosto');
Series9.Add(total,'Agosto');
Series12.Add(total,'Agosto');
Series15.Add(total,'Agosto');
end;

end;
end;
end;

procedure Tfrm_Dashboard.Setembro;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+244;
data2 := data + 29;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Setembro');
Series7.Add(soma,'Setembro');
Series10.Add(soma,'Setembro');
Series13.Add(soma,'Setembro');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Setembro');
Series8.Add(soma2,'Setembro');
Series11.Add(soma2,'Setembro');
Series14.Add(soma2,'Setembro');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Setembro');
Series9.Add(total,'Setembro');
Series12.Add(total,'Setembro');
Series15.Add(total,'Setembro');
end;

end;
end;
end;


procedure Tfrm_Dashboard.Outubro;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+274;
data2 := data + 30;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Outubro');
Series7.Add(soma,'Outubro');
Series10.Add(soma,'Outubro');
Series13.Add(soma,'Outubro');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Outubro');
Series8.Add(soma2,'Outubro');
Series11.Add(soma2,'Outubro');
Series14.Add(soma2,'Outubro');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Outubro');
Series9.Add(total,'Outubro');
Series12.Add(total,'Outubro');
Series15.Add(total,'Outubro');
end;

end;
end;
end;

procedure Tfrm_Dashboard.Novembro;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+305;
data2 := data + 29;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Novembro');
Series7.Add(soma,'Novembro');
Series10.Add(soma,'Novembro');
Series13.Add(soma,'Novembro');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Novembro');
Series8.Add(soma2,'Novembro');
Series11.Add(soma2,'Novembro');
Series14.Add(soma2,'Novembro');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Novembro');
Series9.Add(total,'Novembro');
Series12.Add(total,'Novembro');
Series15.Add(total,'Novembro');
end;

end;
end;
end;


procedure Tfrm_Dashboard.Dezembro;
var
dia,mes,ano: String;
d, m, a : Integer;
nome, dataini, datafin : String;
data,data2 : TDateTime;
soma,soma2,total : Real;
begin

dia := formatdatetime('dd',strtodatetime(DateToStr(now)));
mes := formatdatetime('mm',strtodatetime(DateToStr(now)));
ano := formatdatetime('yy',strtodatetime(DateToStr(now)));

d := StrToInt(dia) - StrToInt(dia)+1;
m := StrToInt(mes) - StrToInt(mes)+1;
a := StrToInt(ano);

dia := '0'+IntToStr(d);
mes := '0'+IntToStr(m);
ano := '20'+IntToStr(a);


dataini := (dia+'/'+mes+'/'+ano);
data := StrToDate(dataini)+335;
data2 := data + 30;


tbl_Mes.First;
if ckVendTotal.Checked = false then
begin
nome := listBox1.Items[(listBox1.itemIndex)];

with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2))+' and Cliente_VendTotal = '+Quotedstr(nome);
Filtered := true;
end;
end else
if ckVendTotal.Checked = true then
begin
with tbl_Mes do
begin
Filtered := false;
Filter := 'Data_VendTotal >= '+Quotedstr(DateToStr(data))+' and Data_VendTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;

with tbl_Compras do
begin
Filtered := false;
Filter := 'Data_CompTotal >= '+Quotedstr(DateToStr(data))+' and Data_CompTotal <= '+Quotedstr(DateToStr(data2));
Filtered := true;
end;
end;
end;
soma := 0;
soma2 := 0;
with tbl_Mes do
begin
First;
while not tbl_Mes.Eof do
begin
soma := (soma+tbl_Mes.FieldByName('Total_VendTotal').AsFloat);
Next;
end;

with tbl_Compras do
begin
First;
while not tbl_Compras.Eof do
begin
soma2 := (soma2+tbl_Compras.FieldByName('Total_CompTotal').AsFloat);
Next;

end;
total := soma - soma2;

if ckVendas.Checked = true then
begin
Series4.Add(soma,'Dezembro');
Series7.Add(soma,'Dezembro');
Series10.Add(soma,'Dezembro');
Series13.Add(soma,'Dezembro');
end;

if ckCompras.Checked = true then
begin
Series5.Add(soma2,'Dezembro');
Series8.Add(soma2,'Dezembro');
Series11.Add(soma2,'Dezembro');
Series14.Add(soma2,'Dezembro');
end;
if total <0 then
begin
total := 0;
end;
if ckLucros.Checked = true then
begin
Series6.Add(total,'Dezembro');
Series9.Add(total,'Dezembro');
Series12.Add(total,'Dezembro');
Series15.Add(total,'Dezembro');
end;

end;
end;
end;

procedure Tfrm_Dashboard.ckVendTotalClick(Sender: TObject);
begin
if ckVendTotal.Checked = true then
begin
GroupBox4.Visible := true;
LimparSeries;
GraficoPeriodoMes;
ListBox1.ClearSelection;
end;
end;

procedure Tfrm_Dashboard.ckVendasClick(Sender: TObject);
begin
if ckVendTotal.Checked = true then
begin
LimparSeries;
GraficoPeriodoMes;
ListBox1.ClearSelection;
end else
if ckVendTotal.Checked = false then
begin
LimparSeries;
end;
end;

procedure Tfrm_Dashboard.ckComprasClick(Sender: TObject);
begin
if ckVendTotal.Checked = true then
begin
LimparSeries;
GraficoPeriodoMes;
ListBox1.ClearSelection;
end else
if ckVendTotal.Checked = false then
begin
LimparSeries;
end;
end;

procedure Tfrm_Dashboard.ckLucrosClick(Sender: TObject);
begin
if ckVendTotal.Checked = true then
begin
LimparSeries;
GraficoPeriodoMes;
ListBox1.ClearSelection;
end else
if ckVendTotal.Checked = false then
begin
LimparSeries;
end;
end;

procedure Tfrm_Dashboard.ck3dClick(Sender: TObject);
begin
if ck3d.Checked = false then
begin
Chart4.Series[0].GalleryChanged3D(false);
end else
Chart4.Series[0].GalleryChanged3D(true);
end;

procedure Tfrm_Dashboard.LimparSeries;
begin
Series4.Clear;
Series5.Clear;
Series6.Clear;
Series7.Clear;
Series8.Clear;
Series9.Clear;
Series10.Clear;
Series11.Clear;
Series12.Clear;
Series13.Clear;
Series14.Clear;
Series15.Clear;
end;

procedure Tfrm_Dashboard.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex = 0 then
begin

Series4.Active := true;
Series5.Active := true;
Series6.Active := true;
Series7.Active := false;
Series8.Active := false;
Series9.Active := false;
Series10.Active := false;
Series11.Active := false;
Series12.Active := false;
Series13.Active := false;
Series14.Active := false;
Series15.Active := false;

end else
if RadioGroup1.ItemIndex = 1 then
begin

Series4.Active := false;
Series5.Active := false;
Series6.Active := false;
Series7.Active := true;
Series8.Active := true;
Series9.Active := true;
Series10.Active := false;
Series11.Active := false;
Series12.Active := false;
Series13.Active := false;
Series14.Active := false;
Series15.Active := false;

end else
if RadioGroup1.ItemIndex = 2 then
begin

Series4.Active := false;
Series5.Active := false;
Series6.Active := false;
Series7.Active := false;
Series8.Active := false;
Series9.Active := false;
Series10.Active := true;
Series11.Active := true;
Series12.Active := true;
Series13.Active := false;
Series14.Active := false;
Series15.Active := false;


end else
if RadioGroup1.ItemIndex = 3 then
begin

Series4.Active := false;
Series5.Active := false;
Series6.Active := false;
Series7.Active := false;
Series8.Active := false;
Series9.Active := false;
Series10.Active := false;
Series11.Active := false;
Series12.Active := false;
Series13.Active := true;
Series14.Active := true;
Series15.Active := true;

end;
end;

procedure Tfrm_Dashboard.Desmarcar;
begin
Series4.Active := true;
Series5.Active := true;
Series6.Active := true;
Series7.Active := false;
Series8.Active := false;
Series9.Active := false;
Series10.Active := false;
Series11.Active := false;
Series12.Active := false;
Series13.Active := false;
Series14.Active := false;
Series15.Active := false;
GraficoPeriodoMes;
end;

procedure Tfrm_Dashboard.PlanoContas;
begin
if rdDespesas.Checked = true then
begin
PlanoDespesas;
end;
end;


procedure Tfrm_Dashboard.PlanoDespesas;
var
i, codigo, cod_contacorrente : Integer;
debito, outros, total : Real;
plano, tipo : String;
begin
total := 0;
debito := 0;
tipo := 'D';


  with tbl_ContaCorrente do
  begin
    Filtered := false;
    Filter := 'Descricao_ContaCorrente = '+QuotedStr(cbContaCorrente.Text);
    Filtered := true;
  if tbl_ContaCorrente.RecordCount >0 then
  begin
  cod_contacorrente := FieldByName('Cod_ContaCorrente').Value;
  end;
  end;


tbl_PlanoContas.First;
for i:=1 to tbl_PlanoContas.RecordCount do
begin
codigo := tbl_PlanoContas.FieldByName('Cod_PlanoContas').Value;
tbl_PlanoContas.Next;

with tbl_Plano do
begin
Filtered := false;
Filter := 'id_PlanoContas = '+Quotedstr(IntToStr(codigo))+' and Tipo_Planos = '+QuotedStr(tipo)+' and Data_Planos >= '+QuotedStr(DateToStr(dtInicio.Date))+' and Data_Planos <= '+QuotedStr(DateToStr(dtFinal.Date))+'and id_ContaCorrente = '+QuotedStr(IntToStr(cod_contacorrente));
Filtered := true;
First;
while not tbl_Plano.Eof do
begin
debito := (debito + tbl_Plano.FieldByName('Valor_Planos').AsFloat);
total := total + debito;
Next;
end;
end;
if debito >0 then
begin
plano := Trim(tbl_Plano.FieldByName('Descricao_Planos').AsString);

if plano <> '' then
begin
PieSeries1.Add(debito,plano);
end;

debito := 0;

end;
end;



end;

procedure Tfrm_Dashboard.rdDespesasClick(Sender: TObject);
begin
if (rdDespesas.Checked = true)and(cbContaCorrente.Text <> 'Escolha a conta que deseja vizualizar') then
begin
Chart6.Visible := true;
PieSeries1.Clear;
PlanoDespesas;
end;
end;

procedure Tfrm_Dashboard.rdReceitasClick(Sender: TObject);
begin
if (rdReceitas.Checked = true)and(cbContaCorrente.Text <> 'Escolha a conta que deseja vizualizar') then
begin
Chart6.Visible := true;
PieSeries1.Clear;
PlanoReceitas;
end;
end;

procedure Tfrm_Dashboard.PlanoReceitas;
var
i, codigo, cod_contacorrente : Integer;
credito, outros,total : Real;
plano, tipo : String;
begin
total := 0;
credito := 0;
tipo := 'R';

  with tbl_ContaCorrente do
  begin
    Filtered := false;
    Filter := 'Descricao_ContaCorrente = '+QuotedStr(cbContaCorrente.Text);
    Filtered := true;
  if tbl_ContaCorrente.RecordCount >0 then
  begin
  cod_contacorrente := FieldByName('Cod_ContaCorrente').Value;
  end;
  end;


tbl_PlanoContas.First;
for i:=1 to tbl_PlanoContas.RecordCount do
begin
codigo := tbl_PlanoContas.FieldByName('Cod_PlanoContas').Value;
tbl_PlanoContas.Next;

with tbl_Plano do
begin
Filtered := false;
Filter := 'id_PlanoContas = '+Quotedstr(IntToStr(codigo+1))+' and Tipo_Planos = '+QuotedStr(tipo)+' and Data_Planos >= '+QuotedStr(DateToStr(dtInicio.Date))+' and Data_Planos <= '+QuotedStr(DateToStr(dtFinal.Date))+'and id_ContaCorrente = '+QuotedStr(IntToStr(cod_contacorrente));
Filtered := true;
First;

while not tbl_Plano.Eof do
begin

credito := (credito + tbl_Plano.FieldByName('Valor_Planos').AsFloat);
total := total + credito;

Next;

end;
end;
if credito >0 then
begin
plano := Trim(tbl_Plano.FieldByName('Descricao_Planos').AsString);
if plano <> '' then
begin
PieSeries1.Add(credito,plano);
end;

credito := 0;
end;
end;



end;

procedure Tfrm_Dashboard.btnAtualizarClick(Sender: TObject);
begin
if rdDespesas.Checked = true then
begin
PieSeries1.Clear;
PlanoDespesas;
end else
if rdReceitas.Checked = true then
begin
PieSeries1.Clear;
PlanoReceitas;
end;
end;

procedure Tfrm_Dashboard.cbPesquisaChange(Sender: TObject);
var
i : Integer;
begin

for i := 0 to cbPesquisa.ItemIndex do
begin
PageControl1.TabIndex := i;
end;

end;

procedure Tfrm_Dashboard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_Dashboard.AbrirTabControl;
begin

//showmessage(tabind);
cbPesquisa.ItemIndex := StrToInt(tabind);
PageControl1.TabIndex := StrToInt(tabind);

end;

procedure Tfrm_Dashboard.CarregaContaCombo;
begin
  with tbl_ContaCorrente do
  begin
    while not Eof do
    begin
    cbContaCorrente.Items.Add(tbl_ContaCorrente.FieldByName('Descricao_ContaCorrente').AsString);
    cbContaCorrente_RvsD.Items.Add(tbl_ContaCorrente.FieldByName('Descricao_ContaCorrente').AsString);
    cbContaCorrente_Mov.Items.Add(tbl_ContaCorrente.FieldByName('Descricao_ContaCorrente').AsString);
    next;
    end;


  end;
end;

procedure Tfrm_Dashboard.PlanoContaPadrao;
begin

with tbl_ContaCorrente do
begin
  Filtered := false;
  Filter := 'Cod_ContaCorrente = '+QuotedStr(FloatToStr(primeiro_planoconta));
  Filtered := true;

  if tbl_ContaCorrente.RecordCount >0 then
  begin
  cbContaCorrente.Text := FieldByName('Descricao_ContaCorrente').AsString;
  cbContaCorrente_RvsD.Text := FieldByName('Descricao_ContaCorrente').AsString;
  cbContaCorrente_Mov.Text := FieldByName('Descricao_ContaCorrente').AsString;
  btnAtualizar.Click;
  end else
  cbContaCorrente.Text := 'Escolha a conta que deseja vizualizar';

end;


end;

procedure Tfrm_Dashboard.cbContaCorrenteChange(Sender: TObject);
begin
btnAtualizar.Click;
end;

procedure Tfrm_Dashboard.Movimentacao;
var
despesa, receita : Real;
id_cc, data : String;
begin
  Series16.Clear;
  Series17.Clear;
  with tbl_ContaCorrente do
  begin
    Filtered := false;
    Filter := 'Descricao_ContaCorrente = '+Quotedstr(cbContaCorrente_Mov.Text);
    Filtered := true;

    id_cc := FieldByName('Cod_ContaCorrente').AsString;
  end;

  with tbl_Movimentacoes do
  begin
    Filtered := false;
    Filter := 'Data_Movimentacao >= '+Quotedstr(DateToStr(editIniDataMov.Date))+'and Data_Movimentacao <= '+Quotedstr(DateToStr(editFinalDataMov.Date))+'and Id_Movimentacao = '+Quotedstr(id_cc);
    Filtered := true;
    First;
    tbl_Movimentacoes.First;
    while not tbl_Movimentacoes.Eof do
    begin
    despesa := 0;
      if FieldByName('Debito_Movimentacao').Value <> null then
      begin
        data := FieldByName('Data_Movimentacao').AsString;
        with tbl_DataMov do
        begin
          Filtered := false;
          Filter := 'Data_Movimentacao = '+Quotedstr(data);
          Filtered := true;
          First;
        while not tbl_DataMov.Eof do
        begin
        if tbl_DataMov.FieldByName('Debito_Movimentacao').Value <> null then
        begin
          despesa := despesa + tbl_DataMov.FieldByName('Debito_Movimentacao').Value;
        end;
        tbl_DataMov.Next;
        end;
        end;
      end;
      Series16.Add(despesa,data,clRed);
      tbl_Movimentacoes.Next;
    end;

  end;
end;


procedure Tfrm_Dashboard.btnRefreshClick(Sender: TObject);
begin
Movimentacao;
end;

procedure Tfrm_Dashboard.Button1Click(Sender: TObject);
begin
editIniDataMov.Date := now - 7;
Movimentacao;
end;

procedure Tfrm_Dashboard.Button2Click(Sender: TObject);
begin
editIniDataMov.Date := now - 30;
Movimentacao;
end;

procedure Tfrm_Dashboard.Button3Click(Sender: TObject);
begin
editIniDataMov.Date := now - 60;
Movimentacao;
end;

end.

