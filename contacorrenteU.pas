unit contacorrenteU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ComCtrls, ExtCtrls;

type
  Tfrm_ContaCorrentes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    btnPesquisar: TSpeedButton;
    editConsulta: TEdit;
    Panel7: TPanel;
    cbPesquisa: TComboBox;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    SpeedButton3: TSpeedButton;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    GroupBox2: TGroupBox;
    DBNavigator1: TDBNavigator;
    DBContas: TDBGrid;
    ds_ContasCorrentes: TDataSource;
    tbl_ContasCorrentes: TTable;
    tbl_ContasCorrentesCod_ContaCorrente: TAutoIncField;
    tbl_ContasCorrentesDescricao_ContaCorrente: TStringField;
    tbl_ContasCorrentesAgencia_ContaCorrente: TStringField;
    tbl_ContasCorrentesBanco_ContaCorrente: TStringField;
    tbl_ContasCorrentesAtivo_ContaCorrente: TStringField;
    tbl_ContasCorrentesId_Conta: TIntegerField;
    tbl_ContasCorrentesConta_ContaCorrente: TStringField;
    tbl_Movimentacao: TTable;
    tbl_MovimentacaoCod_Movimentacao: TAutoIncField;
    tbl_MovimentacaoId_Movimentacao: TIntegerField;
    tbl_MovimentacaoData_Movimentacao: TDateField;
    tbl_MovimentacaoHistorico_Movimentacao: TStringField;
    tbl_MovimentacaoDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoConciliado_Movimentacao: TStringField;
    tbl_MovimentacaoData_FinalMovimentacao: TDateField;
    tbl_MovimentacaoExtrato_Movimentacao: TGraphicField;
    tbl_Planos: TTable;
    btnAdicionar: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBContasCellClick(Column: TColumn);
    procedure Panel1Click(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure cbPesquisaClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure cbPesquisaChange(Sender: TObject);
    procedure DBContasTitleClick(Column: TColumn);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure editConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure DBContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBContasDblClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FecharTabelas;
    procedure AtivarTabelas;
    procedure CarregarCombobox;
    procedure Filtrar;
    procedure RemoverSaldo;
  public
    { Public declarations }
  end;

var
  frm_ContaCorrentes: Tfrm_ContaCorrentes;

implementation

uses newcontaU, vendasU, newcontacorrentesU, modeloconsulta,
  newmovimentacoesU, baixareceberU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_ContaCorrentes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_ContaCorrentes.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13)and(editConsulta.Text <>'') then
btnPesquisar.Click;

end;

procedure Tfrm_ContaCorrentes.FormCreate(Sender: TObject);
begin
AtivarTabelas;

CarregarCombobox;
cbPesquisa.ItemIndex := 0;
nomecampo := DBContas.Columns[0].FieldName;
end;

procedure Tfrm_ContaCorrentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_ContaCorrentes.AtivarTabelas;
begin
tbl_ContasCorrentes.Active := true;
tbl_Movimentacao.Active := true;
tbl_Planos.Active := true;
end;

procedure Tfrm_ContaCorrentes.FecharTabelas;
begin
tbl_ContasCorrentes.Active := false;
tbl_Movimentacao.Active := false;
tbl_Planos.Active := false;
end;

procedure Tfrm_ContaCorrentes.SpeedButton3Click(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_ContaCorrentes.btnNovoClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
edit := 1;
frm_NewContaCorrentes := Tfrm_NewContaCorrentes.Create(Self);
frm_NewContaCorrentes.ShowModal;
try
finally
frm_NewContaCorrentes.Free;
frm_NewContaCorrentes := nil;
end;
end;

procedure Tfrm_ContaCorrentes.btnEditarClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
if tbl_ContasCorrentes.RecordCount = 0 then
begin
MessageDlg('Não a registros a serem editados',MtWarning,[mbok],0);
exit;
end;
edit := 2;
frm_NewContaCorrentes := Tfrm_NewContaCorrentes.Create(Self);
frm_NewContaCorrentes.ShowModal;
try
finally
frm_NewContaCorrentes.Free;
frm_NewContaCorrentes := nil;
end;
end;

procedure Tfrm_ContaCorrentes.btnDeletarClick(Sender: TObject);
begin
if tbl_ContasCorrentes.RecordCount = 0 then
begin
MessageDlg('Não a registros a serem deletados',MtWarning,[mbok],0);
exit;
end;
if MessageDlg('Deseja realmente deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
RemoverSaldo;
tbl_ContasCorrentes.Delete;
end else
abort;
end;

procedure Tfrm_ContaCorrentes.DBContasCellClick(Column: TColumn);
begin
btnDeletar.Enabled := true;
if frm_BaixaReceber <> nil then
begin
btnAdicionar.Enabled := true;
btnAdicionar.Visible := true;
end;
end;

procedure Tfrm_ContaCorrentes.Panel1Click(Sender: TObject);
begin
btnDeletar.Enabled := false;
end;

procedure Tfrm_ContaCorrentes.editConsultaClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
editConsulta.Clear;
end;

procedure Tfrm_ContaCorrentes.cbPesquisaClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
end;

procedure Tfrm_ContaCorrentes.btnPesquisarClick(Sender: TObject);
begin
if (editConsulta.Text <> 'DIGITE SEU TEXTO AQUI')and(editConsulta.Text <> '')then
begin
Filtrar;
end;
btnDeletar.Enabled := false;
end;

procedure Tfrm_ContaCorrentes.GroupBox2Click(Sender: TObject);
begin
if (editConsulta.Text <> 'DIGITE SEU TEXTO AQUI')and(editConsulta.Text <> '')then
begin
Filtrar;
end;
btnDeletar.Enabled := false;
end;


procedure Tfrm_ContaCorrentes.cbPesquisaChange(Sender: TObject);
var
i : Integer;
pesquisa : String;
tipo : TFieldType;
begin
btnDeletar.Enabled := false;
tbl_ContasCorrentes.Filtered := false;
i := cbPesquisa.ItemIndex;
nomecampo := DBContas.Columns[i].FieldName;
tipo := tbl_ContasCorrentes.FieldByName(nomecampo).DataType;
if tipo <> ftDate then
begin
editConsulta.SetFocus;
end;
end;


procedure Tfrm_ContaCorrentes.DBContasTitleClick(Column: TColumn);
begin
cbPesquisa.ItemIndex := Column.Index;
nomecampo := Column.FieldName;
tbl_ContasCorrentes.Filtered := false;
editConsulta.SetFocus;
end;

procedure Tfrm_ContaCorrentes.CarregarCombobox;
var
i, count : Integer;
titulo : String;
begin

count := DBContas.Columns.Count;

for i:= 0 to count -1 do
    begin
    titulo := DBContas.Columns[i].Title.Caption;
    cbPesquisa.Items.Add(titulo);

  end;
 end;

procedure Tfrm_ContaCorrentes.Filtrar;
var
tipo : TFieldType;
databeg, dataend : TDateTime;
begin
tipo := tbl_ContasCorrentes.FieldByName(nomecampo).DataType;

if tipo = ftString then
begin
tbl_ContasCorrentes.Filtered := false;
tbl_ContasCorrentes.Filter := ''+nomecampo+' = '+Quotedstr(editConsulta.Text+'*');
tbl_ContasCorrentes.Filtered := true;
end;
if tipo =  ftInteger then
begin
tbl_ContasCorrentes.Filtered := false;
tbl_ContasCorrentes.Filter := ''+UpperCase(nomecampo)+' = '+Quotedstr(editConsulta.Text);
tbl_ContasCorrentes.Filtered := true;
end;
end;


procedure Tfrm_ContaCorrentes.editConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text)=0 then
begin
tbl_ContasCorrentes.Filtered := false;
end;
end;

procedure Tfrm_ContaCorrentes.editConsultaExit(Sender: TObject);
begin
editConsulta.Text := 'DIGITE SEU TEXTO AQUI';
end;

procedure Tfrm_ContaCorrentes.editConsultaKeyPress(Sender: TObject;
  var Key: Char);
var
tipo : TFieldType;
begin
tipo := tbl_ContasCorrentes.FieldByName(nomecampo).DataType;
if (tipo <> ftString)then
begin
if not (Key in['0'..'9',#8])then
begin
Key := #0;
end;
end;
end;

procedure Tfrm_ContaCorrentes.DBContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBContas.DataSource.Dataset.RecNo)then
begin
DBContas.Canvas.Brush.Color := $00E9E9E9;
end else
DBContas.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBContas.Canvas.Brush.Color := clHighlight;
DBContas.Canvas.Font.Color := clWhite;
DBContas.Canvas.Font.Style := [fsBold];
end;
DBContas.Canvas.FillRect(Rect);
DBContas.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_ContaCorrentes.RemoverSaldo;
var
i, codigo : Integer;
begin

if tbl_ContasCorrentes.RecordCount > 0 then
begin
codigo := tbl_ContasCorrentes.FieldByName('Cod_ContaCorrente').Value;
end;
if tbl_ContasCorrentes.RecordCount = 0 then
begin
exit;
end;
tbl_Movimentacao.Filtered := false;
tbl_Movimentacao.Filter := 'Id_Movimentacao = '+Quotedstr(IntToStr(codigo));
tbl_Movimentacao.Filtered := true;

for i:= 1 to tbl_Movimentacao.RecordCount do
begin
tbl_Movimentacao.Delete;
end;

with tbl_Planos do
begin
Filtered := false;
Filter := 'Id_Movimentacao = '+Quotedstr(IntToStr(codigo));
Filtered := true;

First;
for i:=1 to tbl_Planos.RecordCount do
begin
Delete;
Next;
end;
end;
end;

procedure Tfrm_ContaCorrentes.DBContasDblClick(Sender: TObject);
begin
if frm_NewMovimentacao <> nil then
begin
if frm_NewMovimentacao.editContaSaida.Text = tbl_ContasCorrentes.FieldByName('Descricao_ContaCorrente').Value then
begin
MessageDlg('A conta de trânsferencia deve ser diferente da de entrada!',MtWarning,[mbok],0);
exit;
end;
frm_NewMovimentacao.editContaEntrada.Text := tbl_ContasCorrentes.FieldByName('Descricao_ContaCorrente').Value;
frm_NewMovimentacao.id := tbl_ContasCorrentes.FieldByName('Cod_ContaCorrente').AsString;
Self.Close;
end;
if frm_BaixaReceber <> nil then
begin
frm_BaixaReceber.editContaCorrente.Text := tbl_ContasCorrentes.FieldByName('Descricao_ContaCorrente').Value;
Close;
end;
end;

procedure Tfrm_ContaCorrentes.btnAdicionarClick(Sender: TObject);
begin
if frm_BaixaReceber <> nil then
begin
frm_BaixaReceber.editContaCorrente.Text := tbl_ContasCorrentes.FieldByName('Descricao_ContaCorrente').Value;
Close;
end;
end;

procedure Tfrm_ContaCorrentes.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  GroupBox1.Color := cor;
  GroupBox2.Color := cor - 30;
end;

end.
