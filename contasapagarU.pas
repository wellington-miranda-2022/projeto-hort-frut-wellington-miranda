unit contasapagarU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, DBCtrls, Grids, DBGrids,
  Buttons, ComCtrls;

type
  Tfrm_ContasPagar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ds_ContasPagar: TDataSource;
    DBContasPagar: TDBGrid;
    DBNavigator1: TDBNavigator;
    tbl_ContasPagar: TTable;
    tbl_ContasPagarCod_ContasPagar: TIntegerField;
    tbl_ContasPagarDescricao_ContasPagar: TStringField;
    tbl_ContasPagarValor_ContasPagar: TCurrencyField;
    tbl_ContasPagarData_ContasPagar: TDateField;
    tbl_ContasPagarData_VencContasPagar: TDateField;
    tbl_ContasPagarQtd_ParcelasContasPagar: TIntegerField;
    Label1: TLabel;
    editData: TDateTimePicker;
    Label3: TLabel;
    editDataVenc: TDateTimePicker;
    tbl_ContasPagarFornecedor_ContasPagar: TStringField;
    tbl_ContasDetalhes: TTable;
    tbl_ContasDetalhesCod_ContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_ParcContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_DocContasDetalhes: TStringField;
    tbl_ContasDetalhesValor_ParcContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesValor_RestContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesData_VencContasDetalhes: TDateField;
    tbl_ContasDetalhesData_PagContasDetalhes: TDateField;
    tbl_ContasDetalhesStatus_ContasDetalhes: TStringField;
    tbl_ContasDetalhesId_ContasPagar: TIntegerField;
    tbl_ContasPagarDocumentos_ContasPagar: TStringField;
    tbl_Lancamentos: TTable;
    tbl_LancamentosCod_ContasLancamento: TIntegerField;
    tbl_LancamentosNum_ParcContasLancamento: TIntegerField;
    tbl_LancamentosJuros_ContasLancamento: TFloatField;
    tbl_LancamentosDesconto_ContasLancamento: TFloatField;
    tbl_LancamentosValor_PagContasLancamento: TCurrencyField;
    tbl_LancamentosData_PagContasLancamento: TDateField;
    tbl_LancamentosId_ParcContasLancamento: TIntegerField;
    tbl_LancamentosObs_ContasLancamento: TStringField;
    p1: TPanel;
    p2: TPanel;
    p3: TPanel;
    p4: TPanel;
    p5: TPanel;
    btnNovo: TSpeedButton;
    btnVizualizar: TSpeedButton;
    btnDarBaixa: TSpeedButton;
    btnImpressao: TSpeedButton;
    btnDeletar: TSpeedButton;
    lblTotal: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    editConsultar: TEdit;
    tbl_ContasPagarPago_ContasPagar: TStringField;
    btnAtualizar: TBitBtn;
    tbl_ContasPagarTipo_ContasPagar: TStringField;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure editConsultarChange(Sender: TObject);
    procedure editConsultarExit(Sender: TObject);
    procedure btnVizualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBContasPagarCellClick(Column: TColumn);
    procedure btnDarBaixaClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnNovoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBContasPagarMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GroupBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnVizualizarMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnDarBaixaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnImpressaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnDeletarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure editDataVencChange(Sender: TObject);
    procedure editDataChange(Sender: TObject);
    procedure DBContasPagarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure editConsultarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
  private
    procedure HabilitarNavigator;
    procedure TotalContas;
    procedure FiltrarDatas;
    procedure FiltrarFornecedores;
    procedure FiltrarApagarDetalhes;
    procedure HabilitarBotoes;
    procedure DesativarTabelas;
    procedure AtivarTabelas;
    procedure AtualizarData;
    procedure DesabilitarBotoes;
    procedure VerificarPagamento;
    procedure AtualizarTotalPago;
    procedure AjustarTamanho;
  public
    consulta : string;
  end;

var
  frm_ContasPagar: Tfrm_ContasPagar;

implementation

uses contaseditar, vendasU, darbaixacontas, ajustesU, loginU, principalU,
  contasreceber;

{$R *.dfm}

procedure Tfrm_ContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_ContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DesativarTabelas;
end;

procedure Tfrm_ContasPagar.FormCreate(Sender: TObject);
begin
AtivarTabelas;
VerificarPagamento;
HabilitarNavigator;
TotalContas;
AtualizarData;
DesabilitarBotoes;


end;

procedure Tfrm_ContasPagar.AjustarTamanho;
begin
frm_ContasPagar.Width := 75;
frm_ContasPagar.Height := 715;


end;

procedure Tfrm_ContasPagar.HabilitarNavigator;
begin
if tbl_ContasPagar.RecordCount > 0 then
begin
DBNavigator1.Enabled := true;
end else
DBNavigator1.Enabled := false;
end;

procedure Tfrm_ContasPagar.BitBtn2Click(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_ContasPagar.btnNovoClick(Sender: TObject);
begin
edit := 1;
frm_ContasEditar := Tfrm_ContasEditar.Create(Self);
frm_ContasEditar.ShowModal;
try
finally
frm_ContasEditar.Free;
frm_ContasEditar := nil;
end;
end;

procedure Tfrm_ContasPagar.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;
  GroupBox1.Color := cor - 30;
  GroupBox2.Color := cor - 30;
  GroupBox3.Color := cor - 30;
  frm_ContasPagar.Color := cor;
TotalContas;
AjustarTamanho;
end;

procedure Tfrm_ContasPagar.TotalContas;
var
status : String;
somar : Real;
begin
inherited;
somar := 0;
status := 'SIM';
with tbl_ContasDetalhes do
begin
tbl_ContasDetalhes.Active := true;
tbl_ContasDetalhes.First;

Filtered := false;
Filter := 'Status_ContasDetalhes <> '+QuotedStr(status)+' and Valor_restContasDetalhes >0 and Data_VencContasDetalhes >= '+QuotedStr(DateToStr(editData.Date))+'and Data_VencContasDetalhes <= '+QuotedStr(DateToStr(editDataVenc.Date));
Filtered := true;


while not tbl_ContasDetalhes.Eof do
begin
somar := (somar + tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').AsFloat);
tbl_ContasDetalhes.Next;
end;
end;
lblTotal.Caption := FormatFloat('R$ #,,,,.0.0',somar);
end;

procedure Tfrm_ContasPagar.FiltrarDatas;
var
data, datavenc : String;
begin
data := DateToStr(editData.Date);
datavenc := DateToStr(editDataVenc.Date);
tbl_ContasPagar.Active := true;
tbl_ContasPagar.Filtered := false;
tbl_ContasPagar.Filter := 'Data_VencContasPagar >= '+Quotedstr(data)+ ' and Data_VencContasPagar <= ' + Quotedstr(datavenc);
tbl_ContasPagar.Filtered := true;
end;

procedure Tfrm_ContasPagar.editConsultarChange(Sender: TObject);
begin
if Length(editConsultar.Text)> 0 then
begin
FiltrarFornecedores;
if tbl_ContasPagar.RecordCount > 0  then
begin
consulta := tbl_ContasPagar.FieldByName('Fornecedor_ContasPagar').Value;
end;
AtualizarData;
lblTotal.Visible := false;
end else
tbl_ContasPagar.Filtered := false;
end;

procedure Tfrm_ContasPagar.FiltrarFornecedores;
begin
tbl_ContasPagar.Filtered := false;
tbl_ContasPagar.Filter := 'Fornecedor_ContasPagar = '+Quotedstr(editConsultar.Text+'*');
tbl_ContasPagar.Filtered := true;
end;

procedure Tfrm_ContasPagar.editConsultarExit(Sender: TObject);
begin
editConsultar.Color := clWhite;
lblTotal.Visible := true;


if Length(editConsultar.Text)=0 then
begin
editConsultar.Text := 'DIGITE O NOME DO FORNECEDOR...';
tbl_ContasPagar.Filtered := false;
end;
end;

procedure Tfrm_ContasPagar.btnVizualizarClick(Sender: TObject);
var
codigo : Integer;
begin
edit := 2;
codigo := tbl_ContasPagar.FieldByName('Cod_ContasPagar').Value;
frm_ContasEditar := Tfrm_ContasEditar.Create(Self);
frm_ContasEditar.ShowModal;
try
finally
frm_ContasEditar.Free;
frm_ContasEditar := nil;
btnVizualizar.Enabled := false;
end;
end;

procedure Tfrm_ContasPagar.btnDeletarClick(Sender: TObject);
begin
if MessageDlg('Deseja apagar a conta n� '+IntToStr(cod)+' do registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
if tbl_ContasPagar.RecordCount >0 then
begin
tbl_ContasPagar.Delete;
FiltrarApagarDetalhes;
btnDeletar.Enabled := false;
AtualizarTotalPago;
end else
MessageDlg('N�o a registros existentes a serem deletados!',MtError,[mbok],0);
btnDeletar.Enabled := false;
end else
abort;
end;

procedure Tfrm_ContasPagar.DBContasPagarCellClick(Column: TColumn);
begin
if tbl_ContasPagar.RecordCount >0 then
begin
cod := tbl_ContasPagar.FieldByName('Cod_ContasPagar').Value;
end;
edit := 4;
HabilitarBotoes;
end;

procedure Tfrm_ContasPagar.FiltrarApagarDetalhes;
var
count, i, y, pegar_id : Integer;
begin

tbl_ContasDetalhes.Filtered := false;
tbl_ContasDetalhes.Filter := 'Id_ContasPagar = '+Quotedstr(IntToStr(cod));
tbl_ContasDetalhes.Filtered := true;

count := tbl_ContasDetalhes.RecordCount;

for i := 1 to count do
begin
tbl_ContasDetalhes.Filtered := false;
tbl_ContasDetalhes.Filter := 'Id_ContasPagar = '+Quotedstr(IntToStr(cod));
tbl_ContasDetalhes.Filtered := true;

count := tbl_ContasDetalhes.RecordCount;

pegar_id := tbl_ContasDetalhes.FieldByName('Cod_ContasDetalhes').AsInteger;

tbl_ContasDetalhes.Delete;

tbl_Lancamentos.Filtered := false;
tbl_Lancamentos.Filter := 'Cod_ContasLancamento = '+Quotedstr(IntToStr(pegar_id));
tbl_Lancamentos.Filtered := true;

count := tbl_Lancamentos.RecordCount;

for y := 1 to count do
begin
tbl_Lancamentos.Delete;
end;

end;

if tbl_ContasPagar.RecordCount >0 then
begin
cod := tbl_ContasPagar.FieldByName('Cod_ContasPagar').Value;
end;

end;

procedure Tfrm_ContasPagar.HabilitarBotoes;
begin

btnNovo.Enabled := true;
btnVizualizar.Enabled := true;
btnDarBaixa.Enabled := true;
btnDeletar.Enabled := true;
btnImpressao.Enabled := true;

end;

procedure Tfrm_ContasPagar.btnDarBaixaClick(Sender: TObject);
begin
frm_BaixaContasPagar := Tfrm_BaixaContasPagar.Create(Self);
frm_BaixaContasPagar.ShowModal;
try
finally
frm_BaixaContasPagar.Free;
frm_BaixaContasPagar := nil;
end;
end;

procedure Tfrm_ContasPagar.DesativarTabelas;
begin
tbl_ContasPagar.Active := false;
tbl_ContasDetalhes.Active := false;
tbl_Lancamentos.Active := false;
end;

procedure Tfrm_ContasPagar.AtivarTabelas;
begin
tbl_ContasPagar.Active := true;
tbl_ContasDetalhes.Active := true;
tbl_Lancamentos.Active := true;
end;

procedure Tfrm_ContasPagar.btnVisualizarClick(Sender: TObject);
var
codigo : Integer;
begin
edit := 2;
codigo := tbl_ContasPagar.FieldByName('Cod_ContasPagar').Value;
frm_ContasEditar := Tfrm_ContasEditar.Create(Self);
frm_ContasEditar.ShowModal;
try
finally
frm_ContasEditar.Free;
frm_ContasEditar := nil;
btnVizualizar.Enabled := false;
end;
end;

procedure Tfrm_ContasPagar.btnNovoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
p1.Color := clMenuHighlight;

p2.Color := clBtnFace;
p3.Color := clBtnFace;
p4.Color := clBtnFace;
p5.Color := clBtnFace;
end;

procedure Tfrm_ContasPagar.DBContasPagarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
p1.Color := clBtnFace;
p2.Color := clBtnFace;
p3.Color := clBtnFace;
p4.Color := clBtnFace;
p5.Color := clBtnFace;
end;

procedure Tfrm_ContasPagar.GroupBox3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
p1.Color := clBtnFace;
p2.Color := clBtnFace;
p3.Color := clBtnFace;
p4.Color := clBtnFace;
p5.Color := clBtnFace;
end;

procedure Tfrm_ContasPagar.btnVizualizarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
p2.Color := clMenuHighlight;

p1.Color := clBtnFace;
p3.Color := clBtnFace;
p4.Color := clBtnFace;
p5.Color := clBtnFace;
end;

procedure Tfrm_ContasPagar.btnDarBaixaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
p3.Color := clMenuHighlight;

p1.Color := clBtnFace;
p2.Color := clBtnFace;
p4.Color := clBtnFace;
p5.Color := clBtnFace;
end;

procedure Tfrm_ContasPagar.btnImpressaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
p4.Color := clMenuHighlight;

p1.Color := clBtnFace;
p2.Color := clBtnFace;
p3.Color := clBtnFace;
p5.Color := clBtnFace;
end;

procedure Tfrm_ContasPagar.btnDeletarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
p5.Color := clMenuHighlight;

p1.Color := clBtnFace;
p2.Color := clBtnFace;
p3.Color := clBtnFace;
p4.Color := clBtnFace;
end;

procedure Tfrm_ContasPagar.AtualizarData;
begin
editData.Date := date - 30;
editDataVenc.Date := date;
end;

procedure Tfrm_ContasPagar.editDataVencChange(Sender: TObject);
begin
FiltrarDatas;
HabilitarNavigator;
TotalContas;
end;

procedure Tfrm_ContasPagar.editDataChange(Sender: TObject);
begin
FiltrarDatas;
HabilitarNavigator;
TotalContas;
end;

procedure Tfrm_ContasPagar.DesabilitarBotoes;
begin
btnVizualizar.Enabled := false;
btnDarBaixa.Enabled := false;
btnImpressao.Enabled := false;
btnDeletar.Enabled := false;
end;

procedure Tfrm_ContasPagar.DBContasPagarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Pago_ContasPagar').Value = 'SIM'   then
  begin
  (Sender as TDBGrid).Canvas.Font.Color := clGreen;
  (Sender as TDBGrid).Canvas.Font.Style:= [fsbold];
end;

(Sender as TDBGrid).Canvas.FillRect(Rect);
(Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as   TDBGrid).columns[datacol].field, State);

end;

procedure Tfrm_ContasPagar.VerificarPagamento;
begin
end;


procedure Tfrm_ContasPagar.editConsultarClick(Sender: TObject);
begin
editConsultar.Clear;
end;

procedure Tfrm_ContasPagar.btnAtualizarClick(Sender: TObject);
begin
TotalContas;
end;

procedure Tfrm_ContasPagar.AtualizarTotalPago;
begin
frm_ContasPagar.Close;
frm_ContasPagar.Hide;
frm_ContasPagar := Tfrm_ContasPagar.Create(Self);
frm_ContasPagar.ShowModal;
try
finally
frm_ContasPagar.Free;
frm_ContasPagar := nil;
end;
end;

procedure Tfrm_ContasPagar.btnImpressaoClick(Sender: TObject);
begin
frm_ContasReceber.ExportToExcel(tbl_ContasPagar);
end;

end.
