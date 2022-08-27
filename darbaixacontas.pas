unit darbaixacontas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  DB, DBTables, DateUtils, XPMan;

type
  Tfrm_BaixaContasPagar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    editConsulta: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    DBContasDetalhes: TDBGrid;
    editValor: TEdit;
    editJuros: TEdit;
    editDesconto: TEdit;
    Panel6: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ds_ContasDetalhes: TDataSource;
    tbl_ContasDetalhes: TTable;
    tbl_Lancamentos: TTable;
    ds_Lancamentos: TDataSource;
    btnPagarParcelas: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel7: TPanel;
    cbMes: TComboBox;
    tbl_LancamentosCod_ContasLancamento: TIntegerField;
    tbl_LancamentosNum_ParcContasLancamento: TIntegerField;
    tbl_LancamentosJuros_ContasLancamento: TFloatField;
    tbl_LancamentosDesconto_ContasLancamento: TFloatField;
    tbl_LancamentosValor_PagContasLancamento: TCurrencyField;
    tbl_LancamentosData_PagContasLancamento: TDateField;
    tbl_LancamentosId_ParcContasLancamento: TIntegerField;
    tbl_LancamentosObs_ContasLancamento: TStringField;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    tbl_ContasDetalhesCod_ContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_ParcContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_DocContasDetalhes: TStringField;
    tbl_ContasDetalhesValor_ParcContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesValor_RestContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesData_VencContasDetalhes: TDateField;
    tbl_ContasDetalhesData_PagContasDetalhes: TDateField;
    tbl_ContasDetalhesStatus_ContasDetalhes: TStringField;
    tbl_ContasDetalhesId_ContasPagar: TIntegerField;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    lblConta: TLabel;
    lblFornecedor: TLabel;
    tbl_ContasPagar: TTable;
    tbl_ContasPagarCod_ContasPagar: TIntegerField;
    tbl_ContasPagarDocumentos_ContasPagar: TStringField;
    tbl_ContasPagarDescricao_ContasPagar: TStringField;
    tbl_ContasPagarValor_ContasPagar: TCurrencyField;
    tbl_ContasPagarData_ContasPagar: TDateField;
    tbl_ContasPagarData_VencContasPagar: TDateField;
    tbl_ContasPagarQtd_ParcelasContasPagar: TIntegerField;
    tbl_ContasPagarFornecedor_ContasPagar: TStringField;
    DBLancamentos: TDBGrid;
    tbl_ContasPagarPago_ContasPagar: TStringField;
    Label7: TLabel;
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
    XPManifest1: TXPManifest;
    tbl_Movimentacao: TTable;
    tbl_PlanoConta: TTable;
    tbl_PlanoContaCod_PlanoContas: TIntegerField;
    tbl_PlanoContaDescricao_PlanoContas: TStringField;
    tbl_PlanoContaSequencia_PlanoContas: TStringField;
    tbl_PlanoContaTipo_PlanoContas: TStringField;
    tbl_PlanoContaCategoria_PlanoContas: TStringField;
    tbl_PlanoContaAtivo_PlanoContas: TStringField;
    tbl_PlanoContaValorTotal_PlanoContas: TCurrencyField;
    tbl_MovimentacaoCod_Movimentacao: TAutoIncField;
    tbl_MovimentacaoId_Movimentacao: TIntegerField;
    tbl_MovimentacaoData_Movimentacao: TDateField;
    tbl_MovimentacaoHistorico_Movimentacao: TStringField;
    tbl_MovimentacaoDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoConciliado_Movimentacao: TStringField;
    tbl_MovimentacaoData_FinalMovimentacao: TDateField;
    tbl_MovimentacaoExtrato_Movimentacao: TGraphicField;
    tbl_MovimentacaoDocumento_Movimentacao: TStringField;
    tbl_MovimentacaoPlanoConta_Movimentacao: TStringField;
    tbl_MovimentacaoFoto_Movimentacao: TStringField;
    tbl_MovimentacaoId_PlanoContas: TIntegerField;
    tbl_ContasPagarTipo_ContasPagar: TStringField;
    tbl_Planos: TTable;
    tbl_PlanosCod_Planos: TAutoIncField;
    tbl_PlanosDescricao_Planos: TStringField;
    tbl_PlanosDoc_Planos: TStringField;
    tbl_PlanosValor_Planos: TCurrencyField;
    tbl_PlanosData_Planos: TDateField;
    tbl_PlanosDataVenc_Planos: TDateField;
    tbl_PlanosTipo_Planos: TStringField;
    tbl_PlanosId_PlanoContas: TIntegerField;
    tbl_PlanosId_Movimentacao: TIntegerField;
    tbl_Planosid_ContaCorrente: TIntegerField;
    procedure btnPagarParcelasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure editConsultaExit(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBContasDetalhesCellClick(Column: TColumn);
    procedure editValorClick(Sender: TObject);
    procedure editJurosClick(Sender: TObject);
    procedure editDescontoClick(Sender: TObject);
    procedure editJurosExit(Sender: TObject);
    procedure editDescontoExit(Sender: TObject);
    procedure editValorExit(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure cbMesExit(Sender: TObject);
    procedure btnPagarParcelasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure editValorKeyPress(Sender: TObject; var Key: Char);
    procedure editJurosKeyPress(Sender: TObject; var Key: Char);
    procedure editDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBContasDetalhesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Memo1Click(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FiltrarParcelas;
    procedure FecharTabelas;
    procedure AtivarTabelas;
    procedure FiltrarContasDetalhes;
    procedure PegarValor;
    procedure FiltrarMes;
    procedure FiltrarLancamentos;
    procedure PagarParcela;
    procedure StatusConta;
    procedure Pagamento;
    procedure Desconto;
    procedure PegarDesconto;
    procedure LimparCampos;
    procedure SomarParcial;
    procedure PintarGrid;
    procedure PegarDados;
    procedure VerificarPagamento;
    procedure VerificarResto;
    procedure AtualizarTotalPagar;
    procedure CalcularPercentualJuros;
    procedure CarregarContaCorrente;
    procedure LancarMovimentacao;
  public
    total, resto, totaldesconto : Real;
  end;

var
  frm_BaixaContasPagar: Tfrm_BaixaContasPagar;

implementation

uses listavenddetalhes, listacompdetalhesU, vendasU, contasapagarU,
  ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_BaixaContasPagar.btnPagarParcelasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
Panel6.Color := clBlue;
end;

procedure Tfrm_BaixaContasPagar.Panel4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
Panel6.Color := clGreen;
end;

procedure Tfrm_BaixaContasPagar.FormCreate(Sender: TObject);
begin
AtivarTabelas;
FiltrarParcelas;
PegarDados;
FiltrarLancamentos;
PintarGrid;
CarregarContaCorrente;
end;

procedure Tfrm_BaixaContasPagar.FiltrarParcelas;
begin
tbl_ContasDetalhes.Filtered := false;
tbl_ContasDetalhes.Filter := 'Id_ContasPagar = '+Quotedstr(IntToStr(cod));
tbl_ContasDetalhes.Filtered := true;
end;

procedure Tfrm_BaixaContasPagar.btnSairClick(Sender: TObject);
begin
tbl_Lancamentos.Cancel;
tbl_ContasDetalhes.Cancel;
VerificarPagamento;
total := 0;
Self.Close;
end;

procedure Tfrm_BaixaContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_BaixaContasPagar.FecharTabelas;
begin
tbl_ContasDetalhes.Active := false;
tbl_Lancamentos.Active := false;
tbl_ContasPagar.Active := false;
tbl_Movimentacao.Active := false;
tbl_ContaCorrente.Active := false;
tbl_PlanoConta.Active := false;
tbl_Planos.Active := false;
end;

procedure Tfrm_BaixaContasPagar.AtivarTabelas;
begin
tbl_ContasDetalhes.Active := true;
tbl_Lancamentos.Active := true;
tbl_ContasPagar.Active := true;
tbl_Movimentacao.Active := true;
tbl_ContaCorrente.Active := true;
tbl_PlanoConta.Active := true;
tbl_Planos.Active := true;
end;

procedure Tfrm_BaixaContasPagar.editConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not(Key in ['0'..'9', #8]) then
Key := #0;

end;

procedure Tfrm_BaixaContasPagar.editConsultaExit(Sender: TObject);
begin
if (editConsulta.Text = '')or(editConsulta.Text = 'Digite seu texto aqui')then
begin
editConsulta.Font.Color := clGrayText;
editConsulta.Font.Size := 12;
editConsulta.Text := 'Digite seu texto aqui';
tbl_ContasPagar.Filtered := false;
end;
end;

procedure Tfrm_BaixaContasPagar.editConsultaClick(Sender: TObject);
begin
if editConsulta.Text = 'Digite seu texto aqui' then
begin
editConsulta.Font.Color := clBlack;
editConsulta.Font.Size := 11;
editConsulta.Text := '';
FiltrarParcelas;
end;
end;

procedure Tfrm_BaixaContasPagar.editConsultaChange(Sender: TObject);
begin
if (Length(editConsulta.Text) > 3)and(editConsulta.Text <> 'Digite seu texto aqui') then
begin
FiltrarContasDetalhes;
end else
FiltrarParcelas;
end;

procedure Tfrm_BaixaContasPagar.FiltrarContasDetalhes;
var
consulta : String;
codigo : Integer;
begin
if tbl_ContasDetalhes.RecordCount>0 then
begin
codigo := tbl_ContasDetalhes.FieldByName('id_ContasPagar').Value;
consulta := editConsulta.Text;
tbl_ContasDetalhes.Filtered := false;
tbl_ContasDetalhes.Filter := 'Num_DocContasDetalhes = '+Quotedstr(consulta)+' and Id_ContasPagar =  '+Quotedstr(IntToStr(codigo));
tbl_ContasDetalhes.Filtered := true;
end;
end;

procedure Tfrm_BaixaContasPagar.SpeedButton2Click(Sender: TObject);
begin
if Length(editConsulta.Text) > 3 then
begin
FiltrarContasDetalhes;
end else
tbl_ContasDetalhes.Filtered := false;
end;

procedure Tfrm_BaixaContasPagar.DBContasDetalhesCellClick(Column: TColumn);
begin
PegarValor;
PegarDados;
FiltrarLancamentos;
end;

procedure Tfrm_BaixaContasPagar.PegarValor;
var
valor : Real;
begin
valor := tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value;
editValor.Text := FloatToStr(valor);
end;

procedure Tfrm_BaixaContasPagar.editValorClick(Sender: TObject);
begin
editValor.Text := '';
end;

procedure Tfrm_BaixaContasPagar.editJurosClick(Sender: TObject);
begin
editJuros.Text := '';
end;

procedure Tfrm_BaixaContasPagar.editDescontoClick(Sender: TObject);
begin
editDesconto.Text := '';
end;

procedure Tfrm_BaixaContasPagar.editJurosExit(Sender: TObject);
begin
if editJuros.Text = '' then
editJuros.Text := '0%';
end;

procedure Tfrm_BaixaContasPagar.editDescontoExit(Sender: TObject);
begin
if editDesconto.Text = ''then
editDesconto.Text := 'R$ 00,00';
end;

procedure Tfrm_BaixaContasPagar.editValorExit(Sender: TObject);
begin
if editValor.Text = ''then
begin
editValor.Text := 'R$ 00,00';
end;
CalcularPercentualJuros;
end;

procedure Tfrm_BaixaContasPagar.FiltrarMes;
var
i, cont : Integer;
dia,mes,ano, janeiro : string;
data : Tdate;
begin
if tbl_ContasDetalhes.RecordCount>0 then
begin
dia := formatdatetime('dd',strtodatetime(tbl_ContasDetalhes.FieldByName('Data_VencContasDetalhes').Value));
//mes := formatdatetime('mm',strtodatetime(tbl_ContasDetalhes.FieldByName('Data_VencContasDetalhes').Value));
ano := formatdatetime('yy',strtodatetime(tbl_ContasDetalhes.FieldByName('Data_VencContasDetalhes').Value));
cont := cbMes.ItemIndex;
janeiro := (dia+'/01/'+ano);

for i:= 1 to cont do
begin
data := StrToDate(dia+'/'+'01'+'/'+ano);
data := IncMonth(data,cont);
end;

tbl_ContasDetalhes.Filtered := false;

if cbMes.ItemIndex = 0 then
begin
tbl_ContasDetalhes.Filter := ' Data_VencContasDetalhes = '+Quotedstr(janeiro)+'and Id_ContasPagar = '+Quotedstr(IntToStr(cod));
end;
if cbMes.ItemIndex > 0 then
begin
tbl_ContasDetalhes.Filter := ' Data_VencContasDetalhes = '+Quotedstr(DateToStr(data))+'and Id_ContasPagar = '+Quotedstr(IntToStr(cod));
end;

tbl_ContasDetalhes.Filtered := true;

if tbl_ContasDetalhes.FieldByName('Id_ContasPagar').AsString = '' then
begin
MessageDlg('N�o h� parcelas existentes nesse periodo!',MtInformation,[mbok],0);
tbl_ContasDetalhes.Filtered := false;
end;
end;
end;

procedure Tfrm_BaixaContasPagar.cbMesChange(Sender: TObject);
begin
FiltrarMes;
end;

procedure Tfrm_BaixaContasPagar.FiltrarLancamentos;
var
codigo : integer;
begin

if tbl_ContasDetalhes.RecordCount = 0 then
begin
  DBLancamentos.DataSource := nil;
btnPagarParcelas.Enabled := false;
editValor.Enabled := false;
editJuros.Enabled := false;
editDesconto.Enabled := false;
DBContasDetalhes.Enabled := false;
cbContaCorrente.Enabled := false;
exit;
end;

codigo := tbl_ContasDetalhes.FieldByName('Cod_ContasDetalhes').Value;

tbl_Lancamentos.Filtered := false;
tbl_Lancamentos.Filter := 'Cod_ContasLancamento = '+Quotedstr(IntToStr(codigo));
tbl_Lancamentos.Filtered := true;


end;

procedure Tfrm_BaixaContasPagar.cbMesExit(Sender: TObject);
begin
cbMes.Font.Color := clBlack;
cbMes.Font.Style := [fsBold];
if cbMes.Text = 'FILTRO POR M�S' then
begin
cbMes.Font.Color := clGrayText;
end;
if tbl_ContasDetalhes.RecordCount > 1 then
begin
cbMes.Text := 'FILTRO POR M�S';
cbMes.Font.Color := clGrayText;
cbMes.Font.Style := [];
end;
end;

procedure Tfrm_BaixaContasPagar.btnPagarParcelasClick(Sender: TObject);
begin
if tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value <=0 then
begin
MessageDlg('N�o a pend�ncias referente a est� parcela!',MtWarning,[mbok],0);
exit;
end;
if editValor.Text = 'R$ 00,00' then
begin
MessageDlg('Digite o valor de pagamento!',MtWarning,[mbok],0);
exit;
end;
if Trim(cbContaCorrente.Text) = '' then
begin
MessageDlg('Escolha uma conta corrente para movimenta��o do pagamento!',MtWarning,[mbok],0);
exit;
end;
tbl_ContasDetalhes.Edit;
editJuros.SetFocus;
PagarParcela;
Pagamento;
Desconto;
StatusConta;
VerificarResto;
tbl_ContasDetalhes.Post;
LimparCampos;
AtualizarTotalPagar;
LancarMovimentacao;
//LancarPlanoContas;
MessageDlg('Parcela paga com sucesso!',MtInformation,[mbok],0);
end;

procedure Tfrm_BaixaContasPagar.PagarParcela;
var
codigo : Integer;
juros, desconto, valor : Real;
begin
codigo := tbl_ContasDetalhes.FieldByName('Cod_ContasDetalhes').Value;

valor := 0;
desconto := 0;
juros := 0;

if (editValor.Text <> 'R$ 00,00') then
begin
valor := StrToFloat(editValor.Text);
end;

if (editJuros.Text <> '0%')and(StrToFloat(editValor.Text) > (tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value)) then
begin
juros := StrToFloat(editJuros.Text)*100;
end else
if (editJuros.Text <> '0%')and(StrToFloat(editValor.Text) <= (tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value)) then
begin
juros := 0;
end;

if editDesconto.Text <> 'R$ 00,00' then
begin
desconto := StrToFloat(editDesconto.Text);
end;


total := (valor + (valor * juros / 100)) - desconto;

if (StrToFloat(editValor.Text) > (tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value)) then
begin
total := total - (valor * juros / 100);
end;

tbl_Lancamentos.Insert;
tbl_Lancamentos.FieldByName('Cod_ContasLancamento').Value := codigo;
tbl_Lancamentos.FieldByName('Num_ParcContasLancamento').Value := tbl_ContasDetalhes.FieldByName('Num_ParcContasDetalhes').Value;
tbl_Lancamentos.FieldByName('Juros_ContasLancamento').Value := valor * juros / 100;
tbl_Lancamentos.FieldByName('Desconto_ContasLancamento').Value := desconto;
tbl_Lancamentos.FieldByName('Valor_PagContasLancamento').Value := total;
tbl_Lancamentos.FieldByName('Data_PagContasLancamento').Value := date;
tbl_Lancamentos.FieldByName('Obs_ContasLancamento').Value := Memo1.Text;
tbl_Lancamentos.FieldByName('Id_ParcContasLancamento').Value := tbl_ContasDetalhes.FieldByName('Cod_ContasDetalhes').Value;


end;

procedure Tfrm_BaixaContasPagar.Button1Click(Sender: TObject);
begin
tbl_Lancamentos.Delete;
end;

procedure Tfrm_BaixaContasPagar.StatusConta;
var
valorparc, valorrest, resultado : Real;
status : String;
begin
valorparc := tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value;
valorrest := tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value;
resultado := valorparc - valorrest;

if resultado = 0 then
begin
tbl_ContasDetalhes.FieldByName('Status_ContasDetalhes').Value := 'AGUARDANDO';
exit;
end;

if valorrest <= 0 then
begin
tbl_ContasDetalhes.FieldByName('Status_ContasDetalhes').Value := 'PAGO';
exit;
end;

if resultado < valorparc then
begin
tbl_ContasDetalhes.FieldByName('Status_ContasDetalhes').Value := 'PARCIAL';
end;

end;

procedure Tfrm_BaixaContasPagar.Button2Click(Sender: TObject);
begin
pegardesconto;
ShowMessage(FloatToStr(totaldesconto));
end;

procedure Tfrm_BaixaContasPagar.Pagamento;
var
valorparc : Real;
begin

SomarParcial;

valorparc := tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value;

tbl_ContasDetalhes.FieldByName('Data_PagContasDetalhes').Value := date;
tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value := valorparc - resto;

end;

procedure Tfrm_BaixaContasPagar.Desconto;
var
desconto, valor, resultado, valorrest : Real;
begin

valorrest := tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value;
valor := tbl_Lancamentos.FieldByName('Valor_PagContasLancamento').Value;

PegarDesconto;

resultado := valorrest - totaldesconto;

tbl_ContasDetalhes.Edit;
tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value := resultado;

if resultado = 0 then
begin
tbl_ContasDetalhes.FieldByName('Status_ContasDetalhes').Value := 'PAGO';
end;

end;

procedure Tfrm_BaixaContasPagar.LimparCampos;
begin
editValor.Text := 'R$ 00,00';
editJuros.Text := '0%';
editDesconto.Text := 'R$ 00,00';
Memo1.Clear;
Memo1.Color := $00B0FFFF;
end;

procedure Tfrm_BaixaContasPagar.editValorKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_BaixaContasPagar.editJurosKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_BaixaContasPagar.editDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_BaixaContasPagar.SomarParcial;
var
somar : Real;
begin
somar := 0;

with tbl_Lancamentos do
begin
tbl_Lancamentos.First;
while not tbl_Lancamentos.Eof do
begin
somar := (somar + tbl_Lancamentos.FieldByName('Valor_PagContasLancamento').AsFloat);
tbl_Lancamentos.Next;
end;
end;

resto := somar;

end;

procedure Tfrm_BaixaContasPagar.PegarDesconto;
var
somar : Real;
begin
somar := 0;

with tbl_Lancamentos do
begin
tbl_Lancamentos.First;
while not tbl_Lancamentos.Eof do
begin
somar := (somar + tbl_Lancamentos.FieldByName('Desconto_ContasLancamento').AsFloat);
tbl_Lancamentos.Next;
end;
end;

totaldesconto := somar;

end;

procedure Tfrm_BaixaContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_BaixaContasPagar.PintarGrid;
begin

 end;

procedure Tfrm_BaixaContasPagar.DBContasDetalhesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Status_ContasDetalhes').Value = 'PAGO'   then
 begin
  (Sender as TDBGrid).Canvas.Font.Color := clGreen;
  (Sender as TDBGrid).Canvas.Font.Style:= [fsbold];
end;

(Sender as TDBGrid).Canvas.FillRect(Rect);
(Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as   TDBGrid).columns[datacol].field, State);

end;

procedure Tfrm_BaixaContasPagar.PegarDados;
var
conta, fornecedor : String;
begin
tbl_ContasPagar.Filtered := false;
tbl_ContasPagar.Filter := 'Cod_ContasPagar = '+Quotedstr(IntToStr(cod));
tbl_ContasPagar.Filtered := true;

conta := tbl_ContasPagar.FieldByName('Descricao_ContasPagar').Value;
fornecedor := tbl_ContasPagar.FieldByName('Fornecedor_ContasPagar').Value;

lblConta.Caption := conta;
lblFornecedor.Caption := fornecedor;

end;

procedure Tfrm_BaixaContasPagar.Memo1Click(Sender: TObject);
begin
Memo1.Color := clSkyBlue;
end;

procedure Tfrm_BaixaContasPagar.Memo1Exit(Sender: TObject);
begin
Memo1.Color := $00B0FFFF;
end;

procedure Tfrm_BaixaContasPagar.VerificarPagamento;
var
count, status : Integer;
begin
if btnPagarParcelas.Enabled <> false then
begin
count := tbl_ContasDetalhes.RecordCount;

tbl_ContasDetalhes.Filtered := false;
tbl_ContasDetalhes.Filter := 'Id_ContasPagar = '+Quotedstr(IntToStr(cod))+'and Status_ContasDetalhes = '+Quotedstr('PAGO');
tbl_ContasDetalhes.Filtered := true;

status := tbl_ContasDetalhes.RecordCount;

tbl_ContasPagar.Locate('Cod_ContasPagar', IntToStr(cod),[]);

if count = status then
begin
tbl_ContasPagar.Edit;
tbl_ContasPagar.FieldByName('Pago_ContasPagar').Value := 'SIM';
tbl_ContasPagar.Post;
frm_ContasPagar.tbl_ContasPagar.Refresh;
exit;
end else
tbl_ContasPagar.Edit;
tbl_ContasPagar.FieldByName('Pago_ContasPagar').Value := 'N�O';
tbl_ContasPagar.Post;
end;
end;


procedure Tfrm_BaixaContasPagar.VerificarResto;
begin
if tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value < 0 then
begin
tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value := 0;
end;
end;

procedure Tfrm_BaixaContasPagar.AtualizarTotalPagar;
begin
frm_ContasPagar.btnAtualizar.Visible := true;
frm_ContasPagar.btnAtualizar.Click;
frm_ContasPagar.btnAtualizar.Visible := false;
end;

procedure Tfrm_BaixaContasPagar.CalcularPercentualJuros;
var
valor, percentual, resultado : Real;
begin
if (editValor.Text <> 'R$ 00,00')and(tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value < StrToFloat(editValor.Text)) then
begin
valor := StrToFloat(editValor.Text);
valor := valor - tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value;
resultado := valor / StrToFloat(editValor.Text);
end;
editJuros.Text := FloatToStr(resultado);
end;

procedure Tfrm_BaixaContasPagar.CarregarContaCorrente;
begin
with tbl_ContaCorrente do
begin
  Active := false;
  Active := true;

  if not isEmpty then
while not Eof do
    begin
      cbContaCorrente.Items.Add(FieldByName('Descricao_ContaCorrente').Value);
      Next;
    end;
  end;
end;

procedure Tfrm_BaixaContasPagar.LancarMovimentacao;
var
id_cc, id_mov, id_pc, id_plan : Integer;
planoconta, t_pc : String;
begin
t_pc := 'D';
with tbl_ContaCorrente do
begin;
Filtered := false;
Filter := 'Descricao_ContaCorrente = '+QuotedStr(cbContaCorrente.Text);
Filtered := true;
if tbl_ContaCorrente.RecordCount >0 then
begin
id_cc := FieldByName('Cod_ContaCorrente').Value;
end;
end;
with tbl_PlanoConta do
begin
Filtered := false;
Filter := 'Descricao_PlanoContas = '+QuotedStr('       '+frm_ContasPagar.tbl_ContasPagar.FieldByName('Tipo_ContasPagar').Value);
Filtered := true;
First;
id_pc := FieldByName('Cod_PlanoContas').AsInteger;
end;
with tbl_Movimentacao do
begin
  Filtered := false;
  if tbl_Movimentacao.RecordCount >0 then
  begin
  insert;
  planoconta := tbl_PlanoConta.FieldByName('Descricao_PlanoContas').Value;
  FieldByName('id_Movimentacao').Value := id_cc;
  FieldByName('Data_Movimentacao').Value := now;
  FieldByName('Historico_Movimentacao').Value := lblConta.Caption;
  FieldByName('Debito_Movimentacao').Value := tbl_Lancamentos.FieldByName('Valor_PagContasLancamento').Value;
  FieldByName('Data_FinalMovimentacao').Value := now;
  FieldByName('Documento_Movimentacao').Value := tbl_ContasDetalhes.FieldByName('Num_DocContasDetalhes').Value;
  FieldByName('PlanoConta_Movimentacao').Value := trim(planoconta);
  FieldByName('id_PlanoContas').Value := id_pc;
  post;
  id_mov := FieldByName('Cod_Movimentacao').Value;
end;
end;
with tbl_Planos do
begin
Filtered := false;
insert;
FieldByName('Descricao_Planos').Value := trim(planoconta);
FieldByName('Doc_Planos').Value := tbl_ContasDetalhes.FieldByName('Num_DocContasDetalhes').Value;
FieldByName('Valor_Planos').Value := tbl_Lancamentos.FieldByName('Valor_PagContasLancamento').Value;
FieldByName('Data_Planos').Value := now;
FieldByName('DataVenc_PLanos').Value := now;
FieldByName('Tipo_Planos').Value := t_pc;
FieldByName('id_PlanoContas').Value := id_pc;
FieldByName('id_Movimentacao').Value := id_mov;
FieldByName('id_ContaCorrente').Value := id_cc;
post;
end;
end;

procedure Tfrm_BaixaContasPagar.FormShow(Sender: TObject);
begin
Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;
  GroupBox1.Color := cor;
  GroupBox2.Color := cor;
  GroupBox3.Color := cor - 30;
end;

end.
