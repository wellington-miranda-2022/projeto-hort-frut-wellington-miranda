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

procedure Tfrm_DashboardGraficos.RadioGroup1C�k  Ë�Sf�Hf���tIf��s���Ӌ��3��=�U t=��U u3���g   ��t���������[Í@ �P����Í@ SV��3�f�Cf=��r/f=��w)f%��f=��u���S����u���S$����t���w������P�U t
�g   �c�����^[Ë�VW��1����1ҊF �r8�w�ъ�G��_^È�*v������3Ɋ
A������S�:�v�ˈB@���   ��{���[ÐSVW�Ɖ�1�1Ҋ�FG)�w�R��t&��9�uDJt�N�_9�u7����Ju������Z��t�:u/Jt�N:Ou$Jt�N:Ou��Z8�u8�u����8�u8�_^[Ë�SVQ����t&��9�uENt�H�Z9�u8����Nu������^��t6�:
u0Nt�H:Ju%Nt�H:Ju1�^[�^8�u8�u����8�u8�^[ÐW�ǈ͉���f�ȉ���x	�у��_ÐS1�i��U �B���U ���[Ë�SVWR���ωƙ1�)й
   1�1����0�C��u��}�-C�G�L$���   ~��   )�~ O�� �D��GKu���_^[Ð��3�����Ë�SVW��P��tl1�1ۿ����F�� t�� ��-tb��+t_��$t_��xtZ��XtU��0u�F��xtH��XtC��t ���t-��0��	w%9�w!���؊F��u���t	��}T�	F���~KxI[)��G�ŊF뜿����F��t߀�ar�� ��0��	v����wЀ�
9�w���؊F��u���u��Y1��2_^[Í@ ��   �   ÐSP���   v��   �B��t@�Iu�Z)Ј[ÐSVW1ۈ����҉ω�1��)���9�r�S�9�w-H����������р��������)�u ����I���'_^[Ë�VW�Ɖׁ��   �_^Í@ VW�Ɖ׉�1�1�����(�� (��_^Ð�   Ë�S1ۅ�|M��   =   ��   ����۬S�0@ ����ty��t��۬S)2@ ����ta��۬C�2@ ���S��=   }F����۬S�0@ ����t4��t��۬S)2@ ����t��۬C�2@ �����۫�0@ �����[�       ��       ��?       �@       �@       �@      @�@      P�@      $�@     ���@      ��@     (k�@     �� @    @�C�#@    ���&@    *焑*@   �� �-@   �1�_�0@   ���4@   �.���7@  @v:k�:@  �#Ǌ>@  b���x�A@ �z�&��D@ ��n2x��H@ �W
?h�K@ ������N@��@aQY�R@ȥ���o�U@: �'���X@�	��x9?�\@��6���_@�Ng����b@�"�E@|o�e@��p+��ŝi@զ��Ix��@������=A����G���A��+��BkU'9��p�|B0�<���R��B������~�QC�/j\�&һCv���)/��&D�
�� '���D�������DY������dE�����Jz��Eb����>�9FǑ����Fu��uv�HM䧓9;5���S�]=�];���Z�� �T��7a�Z��%]���g��'���]݀n�� �R`�%u�Y�nb5��{��%�V ��S3�j �������uj�����% �  =   t=   u���[ÐU�����$�U �E��E�Pjj h�3@ h  ��������uM3�Uh�3@ d�0d� �E�   �E�P�E�Pj j h4@ �E�P�����3�ZYYd�h�3@ �E�P������  ��f�$�U f%��f�U�f��?f�f�$�U ��]� SOFTWARE\Borland\Delphi\RTL FPUMaskValue    ���-$�U Ë������Ë ��ÐVW�׋p�1ɊA�_^Í@ S1�	�t�@�1Ɋ;J�uJ�<2<���uIu�C��[Ð�@܅�t� Ë�S�؋��&   ������Ћ��\   [Ë�S�؋��   �������[Ð��؋ Ë���t����  ��t��  d�    �����  ��~�  Ð��t���Q��SVW�É׫�K�1�Q��I�Y���Љ�K���tQ�[܅�t���9�t[����s��t�{�4��Iu�9�u�_^[Ë�SV�ÉƋ6�V��v܅�t��  �؅�u�^[Çс�   �s��   �r���!������ ��Ћ�*  Í@ U����SVW3ۉ]���U���3�Uh$6@ d�0d� 3���U���c   �؅�t1�C��t��>�> t!�P� �P��M��S���r����U����)  �> ��3�ZYYd�h+6@ �E��m)  ��W  ����_^[YY]�SV�ËC���t)����2;0u�r;pu�r;pu�r;pt��Iu܋[܅�t���1�^[�SV��؅�t�֋�   ��u3�^[ð^[Í@ ��t���	9�t�I܅�u�
�.���ÐW���6�~Ѕ�t�Q���f�t
Y�v܅�u�_�X�)ȋtG�_Ë�PQ� �����YXt��Y�����Ë�V�֋ ������^uY�����Ë��� 9�t�@܅�u�ðÐ��ċ Ë���� �Ë�Í@ Í@ Í@ Vf�2f	�tf�� �sP� �X���Xt��^��^��a�ÐSVW1�1���� �p̅�tf�>���N8�tf��Ou�@܅�u����� �\12���u�Iu�F_^[Ë�SVW��1�1��� �p̅�tf���;Vtf��Iu�@܅�u݈�
��1ɊA�_^[�SVW1�1��P� �pȅ�tf�>���N8�t�t1Ou�@܅�u�Z���N��\12���u�Iu�Z�_^[�RQS��|�P�1ҍL$d���i�Ay8@ �Ad�
[YZ��N  �D$,�@��t���P�Q�X�	   �D  Í@ ��R�Ë�S�؋Ë�R��[Ë����PR��R�ZXÐ�=,�U vj j j h�����U Ð�=,�U  tPPRTjj h�����U ��XÍ@ Tjj h�����U ��XÍ@ �=,�U v	P�s�����Ð�=,�U vPS�����Í@ ��t�A�9�t�9�u��AA����Ë��=,�U vPRQ�����QTjj h�����U YYZXÐ�=,�U vRTjj h�����U Z�PR�=,�U vTjj h�����U ZXË��D$�@   �  �8����P�Htn��/�����U ����   �҅���   �T$�L$�9���t7������=0�U  v)�=,�U  w �L$PQ������ X��   �D$�H�0�D$�H�=0�U v�=,�U  wP�D$RQP�P����� YZXtp�HS1�VWUd�SPRQ�T$(j Ph�:@ R��U �|$(�,  ��    ��    �o�_�G�:@ ���f������  ��+  ��    ���    �A������   Ë��D$�@   �o  �8���t��	�����U ���S  �҅�u
�H  �@� �T$SVWU�J�Y�q	�ŋ��tC����?� 9�t7�H�;O�u�@ԋW�1Ɋ:
u	@B����t�܋��uЃ�Ku�]_^[��   �D$�8����P�HtA��U �T$�2����=0�U  v�=,�U  w�L$PQ������� X��   �D$�H�'�=0�U v�=,�U  wP�D$RQP������� YZXtm1�d�SPRQ�T$(�HVj Ph,<@ R��U [�|$(�*  ��    ��    �o�GX<@ �D$������c�#   �^*  ��    ���    �A�t����   Ë��D$�T$�@   t�J�B�<@ SVWU�j��������]_^[�   Ë�	�u
��   �  ZTUWVSPRTjjh���R�%�U ËD$0�@+=@ ��)  ��    �
��    �B�`��8���t�B���������1���d�Y��]_^[�   Í@ �)  ��    �
��    �B����Z�d$,1�Yd�X]�/������1ҋL$�D$��d���� Ë�U��U�=�  �,t\=�  �tW-  �t\-�   t=HtN�`q��?��r6t0�R=�  �t=-�  �t.HtHt$�:-�  �t/��=t&�,���*���&���"������������������
��������%�   �R�t���]� �D$�@   ��   �=,�U  w�D$P������ tq�D$�������T$j Phb>@ R��U �\$�;����S�Ct��U ����������҅�������S������U ��t�ыL$��   �Q�$�  1�Í@ 1ҍE�d�
d���@>@ �h�<�U Í@ 1ҡ<�U ��td�
9�u� d�Ë	���t9u�� ��U��SVW�8�U �G��tH�_�p3�UhJ?@ d�2d�"��~K�_�D���t�Ѕ��3�ZYYd���}����������������_^[]ÐU��SVW�@�U ��tK�03ۋx3�Uh�?@ d�2d�";�~��C�D�U ��t��;��3�ZYYd�������P����'����v���_^[]Ð��U �@ ��U �@ �@�U 3��D�U �H�U �B�0�U ������8�U  �a����S1�WV�<�t�F����6$  ��Ou�^_[�S1�WV�<�t�F����$  ��Ou�^_[Í@ S1�WV�<�t�F��F���Ou�^_[�SVW�p�U �� �U �ÿ
   �����03�����û
   �����I��u۱��U �Ѓ�����U 3ۊو��I��u�_^[Ë�1�� �U ���@�8�U �_�o�w�w �7�   �_^�� Ë�Q�=L�U  tWf�= �U ��u�=(�U  v��U �8�U j �D$Pjhp�U j��r���P����j �D$Pjh�A@ j��W���P�q���ZÀ=4�U  uj hh�U hp�U j �k���Z� ����   
  SVWU�8�U � �U �H�U �{( u�? t���3҉���Ճ? u�=�U  t�����2���3���U �{(u
�> u3��C�����{(v�> t!�C��t�  �S�B;Bt
��tP�����������{(u�S$�{( t�����; u�=(�U  t�(�U �P�����V�����   �^�v���]_^[ã �U ����Ð��U �����Ë��t�     �J�I|��J�u
P�B�����XÐSV�É֋��t�    �J�I|��J�u�B��������Nu�^[Ð��t$�J�APR�B��\   ��XR�H�����ZX���B����t�J�I|��J�u�B�����Ð��t
�J�A~��B����t�J�I|��J�u�B��l���Í@ ��~$P��
���P�7���Zf�D�  ��Z�P��@�   �1�ÐSVW�É։ω���������ǅ�t	���������������;_^[Ë�U��j j RP�EPQj ���U P�����]� �U��RP�EPQj ���U P����]� �SVWU�����P�����$����	�������_�n���  }(V�D$�L$��  �����؅�|�T$�ǋ��A����,��ۋǋ��  V��L$���T����؅�}3ۋǋ��o  ��  ]_^[�R��   �����ZÐ1Ʌ�t!R:
t:Jt:Jt:Jt����BBB��Z)������Í@ 1Ʌ�t-Rf;
t f;Jtf;Jtf;Jt�����������Z)��������Í@ 1Ɋ
B����ÐWPQ��1��u��X�X_�i����1Ʌ�t�J��������Í@ S��t�Z���t9�|�و@��Q���[��  [Ë���t�@�Å�t?����~���SVW�É֋y��V��9�t�^  ���N�������_^[��G  �����Å�ta���<���;t\;tPQ�-���ZX����SVW�Ӊ�P�C�F������ǉ؋K����������N�S�����X����t�O������_^[É���������I����SVWRP��1��L���t9u�ϋA�J�1��L���t	A�9�u1�Ju��t�$�w��  �<$�77K������P�ƋD����t
�H������Ku�ZX��u��t�J��U���Z_^[X�$���Ë�SVW�Ɖ�9���   ��th��tk�F��W�)�w�R��t&��9�uXJt�N�_9�uK����Ju������Z��t"��8�uAJt8�u:Jt��  � ��  � 9�u'��#�W�)���F�)��Z8�u8�u����8�u8�_^[Ë���t
�P�B~��@�Ð��t� �AG@ Ë��t8�J�It2S�ËB��������P�H�����X�H�I|��H�u�@��%����[��Í@ ����Ë�����Ë�S��t-�X���t&J|9�})Ӆ�|9�D$�����1������D$����[� �SVW�É։��������t0�J�N|*9�}&��~")�9�~��)���r�����؋R�)��   _^[Å�tVSVWU�É։ϋR��t�R�O}1�9�~�׋k�����u   X9�u���/�H�)��������؋����
���]_^[Ð��t@��t1SVW�Ɖ׋O�W�V�Jx�F)�~�u��VW���_^t����Z1��1��Z��)�_^[Í@ SVW�É�1���~H���t#�x�u����	P�������X����p�� �(���;����ǋ��t���H�9�|���g������X����;_^[Ë�SVW�É։ω��@�����~���������������_^[Ë������Å�tPj �$����������Í@ ���tR����Í@ ���t�     PR����XÍ@ SV�É֋��t�    P�������Nu�^[Í@ ��������J��������QRP�������q����SVWU�����P�����$����	�������]�n���  }(V�D$�L$��  �����؅�~�T$�ǋ��9   �*�݋ǋ���  V��L$���f����؅�}3ۋǋ���  ��  ]_^[Ë�������PQR�����������Z�2��
���Ð1Ʌ�t-Rf;
t f;Jtf;Jtf;Jt�����������Z)�������Í@ 1Ʌ�t�J�����Ð��tÐ  ��J@ Ë���t�@���Ë�SVWUQ��$��������؅�tB�$� ��������3�5�������~��ɋ׋$� �C�����ɍw���5����$������Z]_^[ÐSVW�Ɖ�9�tr��tQ��tT�F��W�)�w�R��t&��9�uAJt�N�_9�u4����Ju������Z��tf�f�f9�u!���W�)���F�)��Zf9�u	����f9�_^[Í@ U��SVW���ڋ����������}3��K;�}�؅�}3��+�;�}�ǋ��֋M��N���_^[]� �@ SVW���3ۅ�~'�������؋������~;�}�Ƌ�ɋӋ� ����ǋ�����_^[Í@ 1�S�JVW�Ít
�|��F؋�   �   ��O�_^[Ð����   SVW�É։�1Ҋ�V1�<
t"<t<t$<t3<tM<t<t
�_^[� ������O��E��K�K�K��O��2U�ՋT.
��\.�L.�����O�]�U�Չ�\.���E���O�]_^[Ð�   �b���Ð1�S�JVW�Ít
�|��F؋�   �'   ��O��_^[Í@ �=�U  t��U ð�U���Ã� ��   PSVW�É։�1Ҋ�V<
t%<t><tQ<t\<tv<��   <��   �   ����
�����   �������   ���������w�������n�؃��g���O��_U�ՋT.
��\.�L.��b���O�]�AU�Չ�\.��� ���O�]�+�؃��<  O���؉���
  O��_^[X��o���_^[XË��   �
���Ð�=�U  t��U ð�E����SVWU�É�1��A�|
�o�1��O�Q�O)�~���������G���
��
t1��t=��tI��tU��tp����   ����   �]_^[������0������   �}�0������   �l�0��Q����   �[1ɊJ�t�t�L
�	�0��a   X�;1ɊJ�LQ�э0��,���X�"�0��'  �   ��ы0��	  �   G��M����Y)�~
�������]_^[Ë�SVWU�É։ϋl$���
t1��tC��tR��ta��t}����   ����   �]_^[������؋���������Mu��   �؋��������Mu��z�؉��R�������Mu��f1ɊO�|9�؉�O�w�c���7Mu��E�؉���3���1��G\8t8Mu��(�؋�   ����Mu���؋���  ����Mu�]_^[� ÐR�����Z��tP�w���XÐP����X�����Í@ ��������Í@ SVQ��؉$�$�����Ћ΋������Z^[Í@ SQ��3��$���(����ȋċ�������$Z[Í@ ������RP�D$�$$���D$�d$��$�d$�YY� �USVW1��\$�L$	�u	�t\	�tX	�y
���؃� ��	�y
���ۃ� ���͹@   W1�1���������9�rw9�r)��@��[��   t���؃� _^[]� ��1���Í@ USVW1��\$�L$	�u	�t]	�tY	�y
���؃� ��	�y���ۃ� �͹@   W1�1���������9�rw9�r)��@�����[��   t���؃� _^[]� ��1���Ð�� |��@|1�1�É���1�������Í@ �� |��@|1�1�É�1���������Í@ U����SVW���3ۃ} u	�} ������E�j j
�E�U������}�؃� �ڃ�0�� �D�Cj j
�E�U�p����E�U�} u��} u��}� t�D�-C���   ~��   �   ��+�;�|	� @;�}���~K�T߈@����J�������_^[��]� �@ U��S���u�u��3��+���[]� ��SVWU���$��   3��D$    �D$    ��u�$�(��  E�|.� t��D$ �D.�<-u�D$E�<+uE��|.�$t(�D.��o���<Xt�|.�0��   �.�X���<X��   �|.�0uEE�D.��Ѐ�Ѐ�
r�����r����r�z�����   ��0������   ��7������   ��W�|$ u	�|$ rG�|C�|$���u	�|$�v�0.�ǙRP�D$�T$����$T$���D$�T$E3��f����|$ ��   �D$�T$�؃� �ډD$�T$�   �D.��Ѐ�Ѐ�
sb�����   ��0�|$ u	�|$ rI�|E�|$���u�|$����v�/-j j
�D$�T$�&���RP�Ǚ$T$���D$�T$E3�됀|$ t�D$�T$�؃� �ډD$�T$�|$ u�|$ t�|$ u
�|$ �����:D$tM�|.� ��
�t�$�(��$3҉�D$�T$��]_^[Ð��t�@�������HÐU���u�	���]� ������Ë��  Ë�U����SVW�M���E��]���E�8����}�������E���������J  3��E���t����E���3��FƋƋP�U�P��t�2�3����m�E�E���;E�t������E���t�;u5�]�;}�}��t�Ã����U�M�+ϋ��;����E��U��@����]��^��E�������؋E��E�;}�}�}��t*�U��U�Ã�3��B����E�P�U���Ã����������M��M�Ӄ��E�� �����   ���;����+U��U�E��E��3�������}�~.�E�M�O��|"G�E�    �EP�E���M��������E�Ou�E��_^[��]� T�$�j���ÐS��t�؃��SQ3��   [Ë���   [�U����SVW���U��E��u3ۃ}� ��   �E��E���}�3��E���� ;�}����+�;�~���}3�����   �E��@E��E��@�E�E��@��t� �E��3��E����m���~������   ���3���}�}���~5�}� t���U��3������V�M��U����`�������M�ӋE��*����E�U��[����E�_^[��]� ����t3�     ��I�u'P��1ɊJ�T��t�H���t�������������XË�S���t��B���t��K�uPR���C�����ZX�[Ð��t��@�Í@ ���j�T$RP蔺���|$   u�D$�3���Ë������Ë�SV�������؃{ u+h  �D$P�CP�����Ĳ�  ���s��u�C�C�C��  ^[Ð�8�U ��t;Bt
;Bt;Bu������Ë��u���P�L������t��\u��U��İ���SVW�U��E��E��E�h,[@ �f�������t@h<[@ V�]����Å�t/h  ������P�E�P�Ӆ�t�E�P������P�E�P�U����"  �E��8\u8�E��x\�  �E����d������> ��   �F�Q������> ��   ��u�����+]��CP�E�P������P�����   �F��������+Ƌ��B��  ��   @PV�������P輸��������P������P�Q��������ttV�<���������P蘸���S�@=  UƄ����\�  +�HP������P�������@P�\���������P�X���@؋��> �V����E�P������P�E�P�.����E�_^[��]�kernel32.dll    GetLongPathNameA    U�������SV�E�h  ������Pj 觷���E� �E�Ph  j h�]@ h  �������t@�E�Ph  j h�]@ h  ��÷����t"�E�Ph  j h�]@ h  �襷������   3�UhU\@ d�0d� �E�   �������  �����E�P�E�Pj j ������P�E�P�d�����t"�E�P�E�Pj j h�]@ �E�P�F�����t�E� �E� 3�ZYYd�h\\@ �E�P������&�����h  �E�P������P�߶��j�E�Pj躶��P茶��3������� ��   �}� u
�}� ��   ������P詶���؍�������K�;.t
������;�u�������;���   C�}� t(��+и  +�P�E�PS�Z���jj ������P�:�������uj�}� td��������+и  +�P�E�PS�"���jj ������P��������u2�E� ��������+и  +�P�E�PS����jj ������P�̵������^[��]�  Software\Borland\Locales    Software\Borland\Delphi\Locales     �   Ë��+   Ë�SVW�����8�U ��t�׋C�ք�t���u�_^[Ë�SVW�����8�U ��t���������ք�t���u�_^[Ë��   Ë��#   Ë�S�ظ   �G����<�U ��X�<�U [ÐSV�5<�U ��t"�V;�u�<�U � �<�U �   ���)���^[Ëօ�t'�
��t�Y;�u����   ����������u�^[Ë�U����SVW�E��<�U �E��}� t93�Uh�^@ d�0d� �]��E��S3�ZYYd��
������;����E�� �E��}� u�_^[YY]Ë��8�U ��8�U Ë�U��Q�E�3�Uh�_@ d�2d�"�E��@�t���3�ZYYd�h�_@ �E�;8�U u�E�� �8�U ��8�U ��t�;U�u	�U����� ��u���������Y]Ë����t�     PR��PXÍ@ ��tRP�R�PX�� ��uËQ�PË�ɉt�Q�PÅ������W��j TQR����t���������tP� �PX�_Å�tP� �PÐ��P藳��Ë��x t�����Ë��S����@   Í@ U��S�]�M�U���P�����t3���@ �[]� ��U��E��P�5���]� �U��SV�]�CP�'�������u	��Ë�Q���^[]� U����SV�M��U�3҃}� ��   3�3Ʌ���   �l�U��JA��w�0F�Y���  v1�^;]�wS��������0������?�ˀ�\0��?�ʀ�T0��� �^;]�w"��������0��?�ʀ�T0��;Ms;u�r�;u�r�u�N�0 �";Ms�E��HA��v
���  vFFF;Mr�V��^[YY]� U����SV�M�U��E��}� u
3��E��	  �E�����3�3��}� ��   �   �U�3Ɋ2F���tl;u��   ��?�� t.�U�2F�ڀ�������   ;u��   ��?���   ��ыʋU�2F�ڀ�������   ��?���   ��fыM�f�A��U�f�B@;us	;E��p���;E�r�E�H�U�f�B  �G;usB�U�2F�t0;us5��?�� t�U�2F������u;us�U�2F������u
@;ur�@�E��E�^[��]� �@ U��j SV���3�UhSc@ d�0d� ��������3�����t^�������@�E�������������P�E��;���@P�������P�E��)���YZ������~��J�E�������E��I����ƋU�����3�ZYYd�hZc@ �E��*�����(�����^[Y]ÐU��j SV���3�Uh�c@ d�0d� ��������t]�������ЍE�����������P�E��O���@P������P�E��-���YZ������~��J�E��c�����E������ƋU������3�ZYYd�h�c@ �E������������^[Y]ÐU��j SV���3�UhGd@ d�0d� �E��������E�������3�ZYYd�hNd@ �E��B�����4�����^[Y]ÐSV�� �����؅�t=�{   }*h   �D$P�CP�� �����P辮���ȋԋ�������
�ƋS�������   ^[Ë�U����S3҉U�3�Uhe@ d�2d�"j�U�Rh  P�9����E��U��   �����E��U������؃}� t3�3�ZYYd�he@ �E��k�����i�������[��]�U��3�Uhje@ d�0d� ���U u#�P�U ������U �������U �����0���3�ZYYd�hqe@ �������]Ð�-��U ��   ��U ��U �@ ��U �@ �N�U � �U (Q@ �z�����t�����`���f�T�U ��f� �U ��f���U ���(����@�U �����<�U �̭��%   �=   �t-軭��%�   f��v���U    � �����������U ������u������U �w����4�U Ð�%<V ���%8V ���%4V ���%0V ��Pj@�����Í@ �   Ë�S������؅�t6�=��U �u
��   ��������������u��   ������P���U P����[Êd�U ���U ��u&d�,   ����������U P�n�����táp�U �P�]�����t�ø��U ����ÐS��3����U j �+����h�U �h�U ���U 3����U 3����U ��������U ���y���[Í@ U��3�Uhug@ d�0d� �l�U 3�ZYYd�h|g@ �������]Ë��-l�U �U��S�]��S�E�C�K[]� ����QË���tPHH��3�Í@ U��S�]��SȉKU�S[]� U��3�Uhh@ d�0d� �t�U 3�ZYYd�hh@ ��v�����]Ë��-t�U �h@ .1       h@ 
odSelectedodGrayed
odDisabled	odChecked	odFocused	odDefault
odHotLight
odInactive	odNoAccelodNoFocusRectodReserved1odReserved2odComboBoxEditWindows��h@ TOwnerDrawStateh@ ���%XV ���%TV ���%PV ���%LV ���%HV ���%HV ���%DV ���%DV ���%�V ���%�V ���%�V ���%�V ���%�V ��U��EP�}�@��P�EP�����]� ��%�V ���%�V ���%�V ���%�V ���%�V ���%|V ���%xV ���%tV ���%pV ���%pV ���%lV ���%hV ���%dV ���%`V ���%\V ���%XV ���%TV ���%PV ���%LV ���%HV ���%DV ���%@V ���%<V ���%8V ���%4V ���%0V ���%,V ���%(V ���%$V ���% V ���%V ���%V ���%V ���%V ���%V ���%V ���%V ���%V ���% V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%|V ���%xV ���%tV ���%pV ���%lV ���%hV ���%dV ���%`V ���%�V ���%�V ���%�V ���%$V ���% V ���%V ���%V ���%V ���%V ���%V ���%V ���%V ���% V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%|V ���%xV ���%tV ���%pV ���%lV ���%hV ���%dV ���%`V ���%\V ���%XV ���%TV ���%PV ���%LV ���%HV ���%DV ���%@V ���%<V ���%8V ���%4V ���%0V ���%,V ���%(V ���%$V ���% V ���%V ���%V ���%V ���%V ���%V ���%V ���%V ���% V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%|V ���%xV ���%tV ���%pV ���%lV ���%hV ���%dV ���%`V ���%\V ���%XV ���%TV ���%PV ���%LV ���%HV ���%DV ���%@V ���%<V ���%8V ���%4V ���%0V ���%,V ���%(V ���%$V ���% V ���%V ���%V ���%V ���%V ���%V ���%V ���%V ���% V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%|V ���%|V ���%xV ���%tV ���%pV ���%lV ���%hV ���%dV ���%`V ���%\V ���%XV ���%TV ���%PV ���%LV ���%HV ���%DV ���%@V ���%<V ���%8V ���%4V ���%0V ���%,V ���%(V ���%$V ���% V ���%V ���%V ���%V ���%V ���%V ���%V ���%V ���%V ���% V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%�V ���%|V ���%xV ���%tV ���%pV ���%lV ���%hV ���%dV ���%`V ���%\V ���%XV ���%TV ���%PV ���%LV ���%HV ���%DV ���%@V ���%<V ���%8V ���%4V ���%0V �����������������Ë�3�ÐRP����P�7���Ë�QRP�4���PP�=����0���P����ÐP����PP�#��������Ð����   ���%�   ���   ���3Ҋ����Ë�Í@ ������Q�$�$��D$�BZ�Qf�f�$f�@f�D$�$ZË��?���Ë��7���Ë��%,V ��U��QSVW�M������ݵ���؋EP�EP�EP�EP�EP�EP�E P�E$P�E(P�E�PWV��������蓵����_^[Y]�$ �U��QSVW�M�����腵���؋EP�EP�EP�EP�EP�EP�E P�E$P�E�PWVj �^��������=�����_^[Y]�  �@ U��QSVW����E�h�v@ h�v@ ������h�v@ ������U��h�v@ ������h�v@ �������> t��tj j �PS������U���E3҉�? t��tj j �PS������U��	�E�    ��_^[Y]�   Magellan MSWHEEL    MouseZ  MSWHEEL_ROLLMSG MSH_WHEELSUPPORT_MSG    MSH_SCROLL_LINES_MSG    U��3�Uh5w@ d�0d� �x�U 3�ZYYd�h<w@ ��F�����]Ë��-x�U �U��3�Uhmw@ d�0d� �|�U 3�ZYYd�htw@ �������]Ë��-|�U �h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�U ��  h�