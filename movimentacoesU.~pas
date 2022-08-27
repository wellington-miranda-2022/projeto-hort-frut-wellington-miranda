unit movimentacoesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, DBCtrls, DB, ComCtrls,
  ExtCtrls, DBTables;

type
  Tfrm_Movimentacao = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cbPesquisa: TComboBox;
    Label2: TLabel;
    editData: TDateTimePicker;
    Label3: TLabel;
    editDataFinal: TDateTimePicker;
    ds_Movimentacao: TDataSource;
    DBNavigator1: TDBNavigator;
    DBMovimentacoes: TDBGrid;
    Label4: TLabel;
    editAnterior: TEdit;
    Label5: TLabel;
    editPeriodo: TEdit;
    Label6: TLabel;
    editSaldoAtual: TEdit;
    btnSair: TSpeedButton;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnConciliar: TBitBtn;
    btnTransferir: TBitBtn;
    tbl_Movimentacoes: TTable;
    tbl_ContasCorrentes: TTable;
    Label7: TLabel;
    editConsulta: TEdit;
    tbl_ContasCorrentesCod_ContaCorrente: TAutoIncField;
    tbl_ContasCorrentesDescricao_ContaCorrente: TStringField;
    tbl_ContasCorrentesAgencia_ContaCorrente: TStringField;
    tbl_ContasCorrentesBanco_ContaCorrente: TStringField;
    tbl_ContasCorrentesAtivo_ContaCorrente: TStringField;
    tbl_ContasCorrentesId_Conta: TIntegerField;
    tbl_ContasCorrentesConta_ContaCorrente: TStringField;
    tbl_ContasCorrentesSaldo_ContaCorrente: TCurrencyField;
    btnAbrir: TBitBtn;
    tbl_MovimentacoesCod_Movimentacao: TAutoIncField;
    tbl_MovimentacoesId_Movimentacao: TIntegerField;
    tbl_MovimentacoesData_Movimentacao: TDateField;
    tbl_MovimentacoesHistorico_Movimentacao: TStringField;
    tbl_MovimentacoesDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesConciliado_Movimentacao: TStringField;
    tbl_MovimentacoesData_FinalMovimentacao: TDateField;
    tbl_MovimentacoesExtrato_Movimentacao: TGraphicField;
    cbPesquisa2: TComboBox;
    btnPesquisar: TSpeedButton;
    tbl_Periodo: TTable;
    tbl_PeriodoCod_Movimentacao: TAutoIncField;
    tbl_PeriodoId_Movimentacao: TIntegerField;
    tbl_PeriodoData_Movimentacao: TDateField;
    tbl_PeriodoHistorico_Movimentacao: TStringField;
    tbl_PeriodoDebito_Movimentacao: TCurrencyField;
    tbl_PeriodoCredito_Movimentacao: TCurrencyField;
    tbl_PeriodoConciliado_Movimentacao: TStringField;
    tbl_PeriodoData_FinalMovimentacao: TDateField;
    tbl_PeriodoExtrato_Movimentacao: TGraphicField;
    tbl_MovimentacoesFoto_Movimentacao: TStringField;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBMovimentacoesCellClick(Column: TColumn);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure editDataChange(Sender: TObject);
    procedure editDataFinalChange(Sender: TObject);
    procedure DBMovimentacoesTitleClick(Column: TColumn);
    procedure cbPesquisa2Change(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure editConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure DBMovimentacoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConciliarClick(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure CarregarContasCorrentes;
    procedure CarregarCombobox;
    procedure FiltrarContaCorrente;
    procedure FiltrarData;
    procedure Filtrar;
    procedure Saldo;
    procedure Periodo;
    procedure AtualizarData;
    procedure VerificarMovimentacao;
    procedure PeriodoAnterior;
    procedure DeletarPlano;
    procedure Desabilitar;
  public
    codigo, cod_mov : Integer;
    nomecampo : String;
  end;

var
  frm_Movimentacao: Tfrm_Movimentacao;
  
implementation

uses newmovimentacoesU, vendasU, newcontacorrentesU, frm_ConciliarU,
  ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Movimentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_Movimentacao.btnSairClick(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_Movimentacao.FormCreate(Sender: TObject);
begin
AbrirTabelas;
if tbl_Movimentacoes.RecordCount = 0 then
begin
VerificarMovimentacao;
exit;
end;
CarregarContasCorrentes;
CarregarComboBox;
nomecampo := DBMovimentacoes.Columns[0].FieldName;
AtualizarData;
Saldo;
Periodo;
cbPesquisa.ItemIndex := 0;
cbPesquisa2.ItemIndex := 0;
codigo := 0;
editSaldoAtual.Text := 'R$ 0,00';
end;

procedure Tfrm_Movimentacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_Movimentacao.AbrirTabelas;
begin
tbl_Movimentacoes.Active := true;
tbl_ContasCorrentes.Active := true;
tbl_Periodo.Active := true;
tbl_Planos.Active := true;
end;

procedure Tfrm_Movimentacao.FecharTabelas;
begin
tbl_Planos.Active := false;
tbl_Movimentacoes.Active := false;
tbl_ContasCorrentes.Active := false;
tbl_Periodo.Active := false;
end;

procedure Tfrm_Movimentacao.CarregarContasCorrentes;
begin
with tbl_ContasCorrentes do
begin
  tbl_ContasCorrentes.Active := false;
  tbl_ContasCorrentes.Active := true;

  if not isEmpty then
    begin
      while not Eof do
       begin
       cbPesquisa.Items.add (FieldByName('Descricao_ContaCorrente').AsString);
       Next;
  end
  end;
end;
end;

procedure Tfrm_Movimentacao.DBMovimentacoesCellClick(Column: TColumn);
begin
if (tbl_Movimentacoes.RecordCount > 0)and(tbl_Movimentacoes.Active = true) then
begin
btnDeletar.Enabled := true;
end;
end;

procedure Tfrm_Movimentacao.btnDeletarClick(Sender: TObject);
begin
if tbl_Movimentacoes.RecordCount = 0 then
begin
MessageDlg('Não há nenhum registro a ser deletado!',MtWarning,[mbok],0);
exit;
end;

if MessageDlg('Deseja realmente deletar esse item?',MtWarning,[mbyes,mbno],0)=mryes then
begin
// recebendo o código na váriavel cod_mov
cod_mov := tbl_Movimentacoes.FieldByName('Cod_Movimentacao').Value;
tbl_Movimentacoes.Delete;
DeletarPlano;
Saldo;
end else
abort;
end;

procedure Tfrm_Movimentacao.btnAbrirClick(Sender: TObject);
begin
FiltrarContaCorrente;
Periodo;
Saldo;
FiltrarData;
PeriodoAnterior;
FiltrarContaCorrente;
tbl_Movimentacoes.Refresh;
end;

procedure Tfrm_Movimentacao.FiltrarContaCorrente;
begin
if tbl_ContasCorrentes.RecordCount >0 then
begin

tbl_ContasCorrentes.Filtered := false;
tbl_ContasCorrentes.Filter := 'Descricao_ContaCorrente = '+Quotedstr(cbPesquisa.Text);
tbl_ContasCorrentes.Filtered := true;

codigo := tbl_ContasCorrentes.FieldByName('Cod_ContaCorrente').Value;

tbl_Movimentacoes.Filtered := false;
tbl_Movimentacoes.Filter := 'id_Movimentacao = '+Quotedstr(IntToStr(codigo));
tbl_Movimentacoes.Filtered := true;

end;


end;

procedure Tfrm_Movimentacao.FiltrarData;
var
data, datavenc : String;
begin

data := DateToStr(editData.Date);
datavenc := DateToStr(editDataFinal.Date);

tbl_Movimentacoes.Filtered := false;
tbl_Movimentacoes.Filter := 'Data_Movimentacao >= ' +Quotedstr(data)+ ' and Data_Movimentacao <= ' + Quotedstr(datavenc)+ ' and Id_Movimentacao = ' + Quotedstr(IntToStr(codigo));
tbl_Movimentacoes.Filtered := true;
end;

procedure Tfrm_Movimentacao.editDataChange(Sender: TObject);
begin
FiltrarData;
Periodo;
end;

procedure Tfrm_Movimentacao.editDataFinalChange(Sender: TObject);
begin
FiltrarData;
Periodo;
end;

procedure Tfrm_Movimentacao.DBMovimentacoesTitleClick(Column: TColumn);
begin
cbPesquisa2.ItemIndex := Column.Index;
nomecampo := Column.FieldName;
editConsulta.SetFocus;
end;

procedure Tfrm_Movimentacao.CarregarCombobox;
var
i, count : Integer;
titulo : String;
begin

count := DBMovimentacoes.Columns.Count;

for i:= 0 to count -1 do
    begin
    titulo := DBMovimentacoes.Columns[i].Title.Caption;
    cbPesquisa2.Items.Add(titulo);

  end;
 end;

procedure Tfrm_Movimentacao.cbPesquisa2Change(Sender: TObject);
var
i : Integer;
pesquisa : String;
tipo : TFieldType;
begin
i := cbPesquisa2.ItemIndex;
nomecampo := DBMovimentacoes.Columns[i].FieldName;
tipo := tbl_Movimentacoes.FieldByName(nomecampo).DataType;
if tipo <> ftDate then
begin
editConsulta.SetFocus;
end;
end;

procedure Tfrm_Movimentacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
	 begin
     btnPesquisar.Click;
	 end;

end;

procedure Tfrm_Movimentacao.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
if (Length(editConsulta.Text)=0)and(tbl_Movimentacoes.RecordCount > 0) then
FiltrarContaCorrente;
end;

procedure Tfrm_Movimentacao.editConsultaExit(Sender: TObject);
begin
editConsulta.Text := 'DIGITE SEU TEXTO AQUI';
end;

procedure Tfrm_Movimentacao.editConsultaKeyPress(Sender: TObject;
  var Key: Char);
var
tipo : TFieldType;
begin
tipo := tbl_Movimentacoes.FieldByName(nomecampo).DataType;
if (tipo <> ftString)then
begin
if not (Key in['0'..'9',#8])then
begin
Key := #0;
end;

end;
end;

procedure Tfrm_Movimentacao.btnPesquisarClick(Sender: TObject);
begin
if (editConsulta.Text <> 'DIGITE SEU TEXTO AQUI')and(editConsulta.Text <> '')then
begin
Filtrar;
end;

end;

procedure Tfrm_Movimentacao.Filtrar;
var
tipo : TFieldType;
data, datavenc : String;
begin

data := DateToStr(editData.Date);
datavenc := DateToStr(editDataFinal.Date);

tipo := tbl_Movimentacoes.FieldByName(nomecampo).DataType;

if tipo = ftString then
begin
tbl_Movimentacoes.Filtered := false;
tbl_Movimentacoes.Filter := ''+nomecampo+' = '+Quotedstr(editConsulta.Text+'*')+' and Id_Movimentacao = '+Quotedstr(IntToStr(codigo));
//+' and Data_Movimentacao >= '+Quotedstr(data)+ ' and Data_Movimentacao <= Data_Movimentacao = '+Quotedstr(datavenc);
tbl_Movimentacoes.Filtered := true;
end;
if tipo =  ftInteger then
begin
tbl_Movimentacoes.Filtered := false;
tbl_Movimentacoes.Filter := ''+UpperCase(nomecampo)+' = '+Quotedstr(editConsulta.Text);
tbl_Movimentacoes.Filtered := true;
end;
end;

procedure Tfrm_Movimentacao.Saldo;
var
credito, debito, saldo : Real;
begin
inherited;
credito := 0;
debito := 0;

tbl_Movimentacoes.Filtered := false;
tbl_Movimentacoes.Filter := 'Id_Movimentacao = ' + Quotedstr(IntToStr(codigo));
tbl_Movimentacoes.Filtered := true;

with tbl_Movimentacoes do
begin
 tbl_Movimentacoes.First;
  while not tbl_Movimentacoes.Eof do
begin

debito := (debito + tbl_Movimentacoes.FieldByName('Debito_Movimentacao').AsFloat);
credito := (credito + tbl_Movimentacoes.FieldByName('Credito_Movimentacao').AsFloat);

tbl_Movimentacoes.Next;

end;

end;
saldo := credito - debito;
editSaldoAtual.Text := FormatFloat('R$ #,,,,.0.0',saldo);
end;

procedure Tfrm_Movimentacao.Periodo;
var
data, datavenc : String;
debito, credito, periodo : Real;
begin

data := DateToStr(editData.Date);
datavenc := DateToStr(editDataFinal.Date);

tbl_Movimentacoes.Filtered := false;
tbl_Movimentacoes.Filter := 'Data_Movimentacao >= ' +Quotedstr(data)+ ' and Data_Movimentacao <= ' + Quotedstr(datavenc)+ ' and Id_Movimentacao = ' + Quotedstr(IntToStr(codigo));
tbl_Movimentacoes.Filtered := true;

debito := 0;
credito := 0;
with tbl_Movimentacoes do
begin
tbl_Movimentacoes.First;
while not tbl_Movimentacoes.Eof do
begin
credito := (credito + tbl_Movimentacoes.FieldByName('Credito_Movimentacao').AsFloat);
debito := (debito + tbl_Movimentacoes.FieldByName('Debito_Movimentacao').AsFloat);
tbl_Movimentacoes.Next;
end;
end;
periodo := credito - debito;
editPeriodo.Text := FormatFloat('R$ #,,,,.0.0',periodo);

end;

procedure Tfrm_Movimentacao.DBMovimentacoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBMovimentacoes.DataSource.Dataset.RecNo)then
begin
DBMovimentacoes.Canvas.Brush.Color := $00E9E9E9;
end else
DBMovimentacoes.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBMovimentacoes.Canvas.Brush.Color := clHighlight;
DBMovimentacoes.Canvas.Font.Color := clWhite;
DBMovimentacoes.Canvas.Font.Style := [fsBold];
end;
DBMovimentacoes.Canvas.FillRect(Rect);
DBMovimentacoes.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_Movimentacao.AtualizarData;
var
data, datafinal : TDateTime;
begin
data := date;
datafinal := data - IncMonth(1);

editDataFinal.Date := data;

editData.Date := datafinal;

end;

procedure Tfrm_Movimentacao.btnNovoClick(Sender: TObject);
begin
if tbl_Movimentacoes.RecordCount = 0 then
begin
MessageDlg('Abra um Local / Conta Corrente para iniciar um novo lançamento!',MtWarning,[mbok],0);
exit;
end;
edit := 1;
frm_NewMovimentacao := Tfrm_NewMovimentacao.Create(Self);
frm_NewMovimentacao.ShowModal;
try
finally
frm_NewMovimentacao.Free;
frm_NewMovimentacao := nil;
end;
end;

procedure Tfrm_Movimentacao.VerificarMovimentacao;
begin
MessageDlg('Não há Contas Correntes cadastradas!',MtWarning,[mbok],0);
FecharTabelas;
Desabilitar;
btnSair.Click;

end;

procedure Tfrm_Movimentacao.editConsultaChange(Sender: TObject);
begin
if (Length(editConsulta.Text)=0)and(tbl_Movimentacoes.RecordCount > 0) then
FiltrarContaCorrente;
end;

procedure Tfrm_Movimentacao.PeriodoAnterior;
var
mespassado: TDateTime;
credito, debito, total : Real;
begin
mespassado := (editData.Date);
credito := 0;
debito := 0;
total := 0;

tbl_Periodo.Filtered := false;
tbl_Periodo.Filter := 'Id_Movimentacao = '+Quotedstr(IntToStr(codigo))+' and Data_Movimentacao <= '+Quotedstr(DateToStr(mespassado));
tbl_Periodo.Filtered := true;

with tbl_Periodo do
begin
tbl_Periodo.First;
while not tbl_Periodo.Eof do
begin
debito := (debito + tbl_Periodo.FieldByName('Debito_Movimentacao').AsFloat);
credito := (credito + tbl_Periodo.FieldByName('Credito_Movimentacao').AsFloat);
tbl_Periodo.Next;
end;
end;
total := credito - debito;
editAnterior.Text := FormatFloat('R$ #,,,,.0.0',total);
end;

procedure Tfrm_Movimentacao.btnEditarClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
if tbl_Movimentacoes.RecordCount = 0 then
begin
MessageDlg('Não a registros a serem editados',MtWarning,[mbok],0);
exit;
end;
edit := 2;
frm_NewMovimentacao := Tfrm_NewMovimentacao.Create(Self);
frm_NewMovimentacao.ShowModal;
try
finally
frm_NewMovimentacao.Free;
frm_NewMovimentacao := nil;
end;
end;

procedure Tfrm_Movimentacao.btnConciliarClick(Sender: TObject);
begin
frm_Conciliar := Tfrm_Conciliar.Create(self);
frm_Conciliar.ShowModal;
try
finally
frm_Conciliar.free;
frm_Conciliar := nil;
end;
end;

procedure Tfrm_Movimentacao.btnTransferirClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
if tbl_Movimentacoes.RecordCount = 0 then
begin
MessageDlg('Não a registros para fazer a transferência!',MtWarning,[mbok],0);
exit;
end;
edit := 3;
frm_NewMovimentacao := Tfrm_NewMovimentacao.Create(Self);
frm_NewMovimentacao.ShowModal;
try
finally
frm_NewMovimentacao.Free;
frm_NewMovimentacao := nil;
end;
end;

procedure Tfrm_Movimentacao.DeletarPlano;
begin
with tbl_Planos do
begin
Filtered := false;
Filter := 'Id_Movimentacao = '+Quotedstr(IntToStr(cod_mov));
Filtered := true;
if tbl_Planos.RecordCount >0 then
begin
tbl_Planos.Delete;
end;
end;
end;

procedure Tfrm_Movimentacao.Desabilitar;
begin
btnAbrir.Enabled := false;
editConsulta.Enabled := false;
editData.Enabled := false;
editDataFinal.Enabled := false;
cbPesquisa.Enabled := false;
cbPesquisa2.Enabled := false;
btnNovo.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := false;
btnConciliar.Enabled := false;
btnTransferir.Enabled := false;
btnPesquisar.Enabled := false;
DBMovimentacoes.Enabled := false;
end;

procedure Tfrm_Movimentacao.FormShow(Sender: TObject);
begin
 Panel1.Color := cor;
  Panel2.Color := cor;
end;

end.
