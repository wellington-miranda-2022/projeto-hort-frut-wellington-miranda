unit contasreceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids, DBGrids, DB,
  DBTables, DBCtrls, ComObj;

type
  Tfrm_ContasReceber = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    p1: TPanel;
    btnNovo: TSpeedButton;
    p2: TPanel;
    btnVizualizar: TSpeedButton;
    p3: TPanel;
    btnDarBaixa: TSpeedButton;
    p4: TPanel;
    btnImpressao: TSpeedButton;
    p5: TPanel;
    btnDeletar: TSpeedButton;
    GroupBox2: TGroupBox;
    Bevel1: TBevel;
    Label1: TLabel;
    btnSair: TBitBtn;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    editConsulta: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    DBTodos: TDBGrid;
    ds_ContasReceber: TDataSource;
    tbl_ContasReceber: TTable;
    tbl_ContasReceberCod_ContasReceber: TIntegerField;
    tbl_ContasReceberNum_DocContasReceber: TStringField;
    tbl_ContasReceberQtd_ParcContasReceber: TIntegerField;
    tbl_ContasReceberValor_ContasReceber: TCurrencyField;
    tbl_ContasReceberData_ContasReceber: TDateField;
    tbl_ContasReceberData_VencContasReceber: TDateField;
    tbl_ContasReceberTipo_ReceitaContasReceber: TStringField;
    lblCod: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblDescricao: TLabel;
    lblDocumento: TLabel;
    lblQtd: TLabel;
    lblData: TLabel;
    lblValor: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    editDataVenc: TDateTimePicker;
    Label9: TLabel;
    editData: TDateTimePicker;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    tbl_ContasReceberQuitado_ContasReceber: TDateField;
    tbl_ContasReceberFalta_ContasReceber: TCurrencyField;
    tbl_ContasReceberRecebido_ContasReceber: TCurrencyField;
    Label10: TLabel;
    lblRecebido: TLabel;
    lblReceber: TLabel;
    Label4: TLabel;
    tbl_Receber: TTable;
    tbl_Recebido: TTable;
    ds_Recebido: TDataSource;
    ds_Receber: TDataSource;
    DBRecebido: TDBGrid;
    DBAReceber: TDBGrid;
    tbl_RecebidoCod_ContasReceber: TIntegerField;
    tbl_RecebidoNum_DocContasReceber: TStringField;
    tbl_RecebidoValor_ContasReceber: TCurrencyField;
    tbl_RecebidoData_ContasReceber: TDateField;
    tbl_RecebidoData_VencContasReceber: TDateField;
    tbl_RecebidoTipo_ReceitaContasReceber: TStringField;
    tbl_RecebidoQuitado_ContasReceber: TDateField;
    tbl_RecebidoFalta_ContasReceber: TCurrencyField;
    tbl_RecebidoRecebido_ContasReceber: TCurrencyField;
    tbl_ReceberCod_ContasReceber: TIntegerField;
    tbl_ReceberNum_DocContasReceber: TStringField;
    tbl_ReceberValor_ContasReceber: TCurrencyField;
    tbl_ReceberData_ContasReceber: TDateField;
    tbl_ReceberData_VencContasReceber: TDateField;
    tbl_ReceberTipo_ReceitaContasReceber: TStringField;
    tbl_ReceberQuitado_ContasReceber: TDateField;
    tbl_ReceberFalta_ContasReceber: TCurrencyField;
    tbl_ReceberRecebido_ContasReceber: TCurrencyField;
    tbl_ReceberQtd_ParcContasReceber: TIntegerField;
    tbl_RecebidoQtd_ParcContasReceber: TIntegerField;
    tbl_ReceberCliente_ContasReceber: TStringField;
    tbl_ContasReceberCliente_ContasReceber: TStringField;
    tbl_RecebidoCliente_ContasReceber: TStringField;
    tbl_Baixa: TTable;
    DBNavigator1: TDBNavigator;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBTodosCellClick(Column: TColumn);
    procedure DBRecebidoCellClick(Column: TColumn);
    procedure DBAReceberCellClick(Column: TColumn);
    procedure editDataChange(Sender: TObject);
    procedure editDataVencChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnVizualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDarBaixaClick(Sender: TObject);
    procedure DBTodosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBRecebidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBAReceberDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnImpressaoClick(Sender: TObject);
  private
    procedure AtivarTabelas;
    procedure FecharTabelas;
    procedure PegarInformacoes;
    procedure TotalAReceber;
    procedure ToTalRecebido;
    procedure FiltrarRecebido;
    procedure FiltrarReceber;
    procedure PegarRecebido;
    procedure PegarReceber;
    procedure FiltrarData;
    procedure AtualizarData;
    procedure ToTalRecebido1;
    procedure TotalAReceber2;
    procedure Consultar;
    procedure Deletar;
    procedure DeletarBaixa;
    procedure AjustarTamanho;
  public
    function ExportToExcel(const pDataSet: TTable):String;
  end;

var
  frm_ContasReceber: Tfrm_ContasReceber;


implementation

uses principalU, editreceberU, comprasU, vendasU, baixareceberU, ajustesU,
  loginU;

{$R *.dfm}

procedure Tfrm_ContasReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_ContasReceber.btnSairClick(Sender: TObject);
begin
Self.Close;
inserirqtd := 0;
end;

procedure Tfrm_ContasReceber.FormCreate(Sender: TObject);
begin
AtivarTabelas;
AtualizarData;
PegarInformacoes;
TotalAReceber;
ToTalRecebido;
FiltrarRecebido;
FiltrarReceber;
PageControl1.ActivePageIndex := 0;
end;

procedure Tfrm_ContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_ContasReceber.AtivarTabelas;
begin
tbl_ContasReceber.Active := true;
tbl_Receber.Active := true;
tbl_Recebido.Active := true;
tbl_Baixa.Active := true;
end;

procedure Tfrm_ContasReceber.FecharTabelas;
begin
tbl_ContasReceber.Active := false;
tbl_Receber.Active := false;
tbl_Recebido.Active := false;
tbl_Baixa.Active := false;
end;

procedure Tfrm_ContasReceber.Button1Click(Sender: TObject);
begin
tbl_ContasReceber.Post;
end;

procedure Tfrm_ContasReceber.DBTodosCellClick(Column: TColumn);
begin
PegarInformacoes;
if tbl_ContasReceber.RecordCount >0 then
begin
inserirqtd := tbl_ContasReceber.FieldByName('Cod_ContasReceber').Value;
end;
end;

procedure Tfrm_ContasReceber.PegarInformacoes;
begin
lblCod.Caption := '0'+tbl_ContasReceber.FieldByName('Cod_ContasReceber').AsString;
lblDescricao.Caption := tbl_ContasReceber.FieldByName('Cliente_ContasReceber').AsString;
lblDocumento.Caption := tbl_ContasReceber.FieldByName('Num_DocContasReceber').AsString;
lblQtd.Caption := tbl_ContasReceber.FieldByName('Qtd_ParcContasReceber').AsString;
lblData.Caption := tbl_ContasReceber.FieldByName('Data_VencContasReceber').AsString;
lblValor.Caption := 'R$ '+tbl_ContasReceber.FieldByName('Valor_ContasReceber').AsString+',00';
end;

procedure Tfrm_ContasReceber.TotalAReceber;
var
somar : Real;
begin
inherited;
somar := 0;
with tbl_ContasReceber do
begin
tbl_ContasReceber.First;
while not tbl_ContasReceber.Eof do
begin
somar := (somar + tbl_ContasReceber.FieldByName('Falta_ContasReceber').AsFloat);
tbl_ContasReceber.Next;
end;
end;
lblReceber.Caption := FormatFloat('R$ #,,,,.0.0',somar);
end;

procedure Tfrm_ContasReceber.ToTalRecebido;
var
somar : Real;
begin
inherited;
somar := 0;
with tbl_ContasReceber do
begin
tbl_ContasReceber.First;
while not tbl_ContasReceber.Eof do
begin
somar := (somar + tbl_ContasReceber.FieldByName('Recebido_ContasReceber').AsFloat);
tbl_ContasReceber.Next;
end;
end;
lblRecebido.Caption := FormatFloat('R$ #,,,,.0.0',somar);
end;

procedure Tfrm_ContasReceber.FiltrarRecebido;
var
data, datavenc : String;
begin
//data := '01/01/2000';
//datavenc := '01/01/3000';

tbl_Recebido.Filtered := false;
//tbl_Recebido.Filter := 'Quitado_ContasReceber >= '+Quotedstr(data)+ ' and Quitado_ContasReceber <= ' + Quotedstr(datavenc);
tbl_Recebido.Filter := 'Recebido_ContasReceber > 0';
tbl_Recebido.Filtered := true;
end;

procedure Tfrm_ContasReceber.FiltrarReceber;
var
nada : String;
begin
nada := '';
tbl_Receber.Filtered := false;
tbl_Receber.Filter := 'Falta_ContasReceber > 0';
tbl_Receber.Filtered := true;
end;

procedure Tfrm_ContasReceber.PegarRecebido;
begin
lblCod.Caption := '0'+tbl_Recebido.FieldByName('Cod_ContasReceber').AsString;
lblDescricao.Caption := tbl_Recebido.FieldByName('Cliente_ContasReceber').AsString;
lblDocumento.Caption := tbl_Recebido.FieldByName('Num_DocContasReceber').AsString;
lblQtd.Caption := tbl_Recebido.FieldByName('Qtd_ParcContasReceber').AsString;
lblData.Caption := tbl_Recebido.FieldByName('Data_VencContasReceber').AsString;
lblValor.Caption := 'R$ '+tbl_Recebido.FieldByName('Valor_ContasReceber').AsString+',00';
end;

procedure Tfrm_ContasReceber.DBRecebidoCellClick(Column: TColumn);
begin
PegarRecebido;
end;

procedure Tfrm_ContasReceber.DBAReceberCellClick(Column: TColumn);
begin
PegarReceber;
end;

procedure Tfrm_ContasReceber.PegarReceber;
begin
lblCod.Caption := '0'+tbl_Receber.FieldByName('Cod_ContasReceber').AsString;
lblDescricao.Caption := tbl_Receber.FieldByName('Cliente_ContasReceber').AsString;
lblDocumento.Caption := tbl_Receber.FieldByName('Num_DocContasReceber').AsString;
lblQtd.Caption := tbl_Receber.FieldByName('Qtd_ParcContasReceber').AsString;
lblData.Caption := tbl_Receber.FieldByName('Data_VencContasReceber').AsString;
lblValor.Caption := 'R$ '+tbl_Receber.FieldByName('Valor_ContasReceber').AsString+',00';

end;

procedure Tfrm_ContasReceber.FiltrarData;
var
data, datavenc : String;
begin

if TabSheet1.PageControl.ActivePageIndex = 0 then
begin

data := DateToStr(editData.Date);
datavenc := DateToStr(editDataVenc.Date);
tbl_ContasReceber.Filtered := false;
tbl_ContasReceber.Filter := 'Data_VencContasReceber >= '+Quotedstr(data)+ ' and Data_VencContasReceber <= ' + Quotedstr(datavenc);
tbl_ContasReceber.Filtered := true;
TotalAReceber;
ToTalRecebido;

end else
if TabSheet2.PageControl.ActivePageIndex = 1 then
begin

data := DateToStr(editData.Date);
datavenc := DateToStr(editDataVenc.Date);
tbl_Recebido.Filtered := false;
tbl_Recebido.Filter := 'Quitado_ContasReceber >= '+Quotedstr(data)+ ' and Quitado_ContasReceber <= ' + Quotedstr(datavenc)+'and Falta_ContasReceber <= 0';
tbl_Recebido.Filtered := true;
TotalRecebido1;
lblReceber.Caption := 'R$ 00,00';

end else
if TabSheet3.PageControl.ActivePageIndex = 2 then
begin

data := DateToStr(editData.Date);
datavenc := DateToStr(editDataVenc.Date);
tbl_Receber.Filtered := false;
tbl_Receber.Filter := 'Data_VencContasReceber >= '+Quotedstr(data)+ ' and Data_VencContasReceber <= ' + Quotedstr(datavenc)+'and Falta_ContasReceber > 1';
tbl_Receber.Filtered := true;
TotalAReceber2;
lblRecebido.Caption := 'R$ 00,00';

end;

end;



procedure Tfrm_ContasReceber.editDataChange(Sender: TObject);
begin
FiltrarData;
end;

procedure Tfrm_ContasReceber.editDataVencChange(Sender: TObject);
begin
FiltrarData;
end;

procedure Tfrm_ContasReceber.PageControl1Change(Sender: TObject);
begin
if TabSheet1.PageControl.ActivePageIndex = 0 then
begin
PegarInformacoes;
FiltrarRecebido;
FiltrarReceber;
AtualizarData;
TotalRecebido;
TotalAReceber;
end else
if TabSheet2.PageControl.ActivePageIndex = 1 then
begin
PegarRecebido;
tbl_ContasReceber.Filtered := false;
FiltrarRecebido;
AtualizarData;
TotalRecebido1;
TotalAReceber2;
//lblReceber.Caption := 'R$ 00,00';
end else
if TabSheet3.PageControl.ActivePageIndex = 2 then
begin
PegarReceber;
tbl_ContasReceber.Filtered := false;
FiltrarReceber;
AtualizarData;
TotalAReceber2;
lblRecebido.Caption := 'R$ 00,00';
end;
end;

procedure Tfrm_ContasReceber.AtualizarData;
begin
editData.Date := date;
editDataVenc.Date := date;
end;

procedure Tfrm_ContasReceber.ToTalRecebido1;
var
somar : Real;
begin
inherited;
somar := 0;
with tbl_Recebido do
begin
tbl_Recebido.First;
while not tbl_Recebido.Eof do
begin
somar := (somar + tbl_Recebido.FieldByName('Recebido_ContasReceber').AsFloat);
tbl_Recebido.Next;
end;
end;
lblRecebido.Caption := FormatFloat('R$ #,,,,.0.0',somar);
end;

procedure Tfrm_ContasReceber.TotalAReceber2;
var
somar : Real;
begin
inherited;
somar := 0;
with tbl_Receber do
begin
tbl_Receber.First;
while not tbl_Receber.Eof do
begin
somar := (somar + tbl_Receber.FieldByName('Falta_ContasReceber').AsFloat);
tbl_Receber.Next;
end;
end;
lblReceber.Caption := FormatFloat('R$ #,,,,.0.0',somar);
end;

procedure Tfrm_ContasReceber.Consultar;
begin
if PageControl1.TabIndex = 0 then
begin
tbl_ContasReceber.Filtered := false;
tbl_ContasReceber.Filter := 'Num_DocContasReceber = '+Quotedstr(editConsulta.Text+'*');
tbl_ContasReceber.Filtered := true;
end else
if PageControl1.TabIndex = 1 then
begin
tbl_Recebido.Filtered := false;
tbl_Recebido.Filter := 'Num_DocContasReceber = '+Quotedstr(editConsulta.Text+'*')+'and Recebido_ContasReceber > 0';
tbl_Recebido.Filtered := true;
end else
if PageControl1.TabIndex = 2 then
begin
tbl_Receber.Filtered := false;
tbl_Receber.Filter := 'Num_DocContasReceber = '+Quotedstr(editConsulta.Text+'*')+'and Falta_ContasReceber > 1';
tbl_Receber.Filtered := true;
end;
end;

procedure Tfrm_ContasReceber.editConsultaChange(Sender: TObject);
begin

if PageControl1.ActivePageIndex = 0 then
begin
if Length(editConsulta.Text)>0 then
begin
Consultar;
TotalRecebido;
TotalAReceber;
end else
tbl_ContasReceber.Filtered := false;
end;

if PageControl1.ActivePageIndex = 1 then
begin
if Length(editConsulta.Text)>0 then
begin
Consultar;
TotalRecebido1;
TotalAReceber2;
end else
FiltrarRecebido;
end;

if PageControl1.ActivePageIndex = 2 then
begin
if Length(editConsulta.Text)>0 then
begin
FiltrarReceber;
end else
Consultar;
TotalAReceber2;
end;

end;
procedure Tfrm_ContasReceber.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure Tfrm_ContasReceber.btnNovoClick(Sender: TObject);
begin
edit := 0;
frm_EditReceber := Tfrm_EditReceber.Create(self);
frm_EditReceber.ShowModal;
try
finally
frm_EditReceber.Free;
frm_EditReceber := nil;
end;
end;

procedure Tfrm_ContasReceber.btnVizualizarClick(Sender: TObject);
begin
edit := 1;
frm_EditReceber := Tfrm_EditReceber.Create(self);
frm_EditReceber.ShowModal;
try
finally
frm_EditReceber.Free;
frm_EditReceber := nil;
end;
end;

procedure Tfrm_ContasReceber.btnDeletarClick(Sender: TObject);
begin
Deletar;
end;

procedure Tfrm_ContasReceber.FormShow(Sender: TObject);
begin
//AjustarTamanho;
PegarInformacoes;
TotalAReceber;
ToTalRecebido;
  
end;

procedure Tfrm_ContasReceber.AjustarTamanho;
begin
frm_ContasReceber.Width := 75;
frm_ContasReceber.Height := 715;


end;

procedure Tfrm_ContasReceber.btnDarBaixaClick(Sender: TObject);
begin
frm_BaixaReceber := Tfrm_BaixaReceber.Create(self);
frm_BaixaReceber.ShowModal;
try
finally
frm_BaixaReceber.Free;
frm_BaixaReceber := nil;
end;
end;

procedure Tfrm_ContasReceber.Deletar;
begin
if tbl_ContasReceber.RecordCount = 0 then
begin
MessageDlg('N�o a registros no banco de dados a serem excluidos!',MtWarning,[mbok],0);
exit;
end;
if MessageDlg('Deseja realmente deletar esse registro?',MtInformation,[mbyes,mbno],0)=mryes then
begin
DeletarBaixa;
tbl_ContasReceber.Delete;
PegarInformacoes;
TotalAReceber;
ToTalRecebido;
end else
abort;
end;

procedure Tfrm_ContasReceber.DeletarBaixa;
var
codigo, i, count : Integer;
begin
if tbl_ContasReceber.RecordCount >0 then
begin
codigo := tbl_ContasReceber.FieldByName('Cod_ContasReceber').Value;
tbl_Baixa.Filtered := false;
tbl_Baixa.Filter := 'id_ContasReceber = '+Quotedstr(IntToStr(codigo));
tbl_Baixa.Filtered := true;

count := tbl_Baixa.RecordCount;

for i := 1 to count do
begin
tbl_Baixa.Delete;
end;
end;
end;

procedure Tfrm_ContasReceber.DBTodosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Quitado_ContasReceber').Value <> null   then
  begin
  (Sender as TDBGrid).Canvas.Font.Color := clGreen;
  (Sender as TDBGrid).Canvas.Font.Style:= [fsbold];
end;

(Sender as TDBGrid).Canvas.FillRect(Rect);
(Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as   TDBGrid).columns[datacol].field, State);

end;

procedure Tfrm_ContasReceber.DBRecebidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Quitado_ContasReceber').Value <> null   then
  begin
  (Sender as TDBGrid).Canvas.Font.Color := clGreen;
  (Sender as TDBGrid).Canvas.Font.Style:= [fsbold];
end;

(Sender as TDBGrid).Canvas.FillRect(Rect);
(Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as   TDBGrid).columns[datacol].field, State);

end;

procedure Tfrm_ContasReceber.DBAReceberDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBAReceber.DataSource.Dataset.RecNo)then
begin
DBAReceber.Canvas.Brush.Color := $00E9E9E9;
end else
DBAReceber.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBAReceber.Canvas.Brush.Color := clHighlight;
DBAReceber.Canvas.Font.Color := clWhite;
DBAReceber.Canvas.Font.Style := [fsBold];
end;
DBAReceber.Canvas.FillRect(Rect);
DBAReceber.DefaultDrawColumnCell( Rect, DataCol, Column, State);
if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Quitado_ContasReceber').Value <> null   then
  begin
  (Sender as TDBGrid).Canvas.Font.Color := clGreen;
  (Sender as TDBGrid).Canvas.Font.Style:= [fsbold];
end;

(Sender as TDBGrid).Canvas.FillRect(Rect);
(Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as   TDBGrid).columns[datacol].field, State);

end;

procedure Tfrm_ContasReceber.btnImpressaoClick(Sender: TObject);
begin
ExportToExcel(tbl_ContasReceber);
end;

function Tfrm_ContasReceber.ExportToExcel(const pDataSet: TTable): String;
var
linha, coluna : integer;
I: Integer;
planilha : variant;
valorcampo,nomedatabela : string;
tabela : TQuery;
pFieldsPref: array of string;
begin
  nomedatabela := pDataSet.TableName;
  tabela := frmPrincipal.Query1;
  tabela.SQL.Clear;
  tabela.SQL.Add('select * from '+nomedatabela);
  tabela.Active := true;

  planilha:= CreateoleObject('Excel.Application');
  //planilha.WorkBooks.add(1);
  planilha.WorkBooks.Open('C:\Users\Konect\Desktop\formatado.xlsx');
  planilha.caption := 'dados';
  planilha.visible := False;

  tabela.First;

  try
    tabela.DisableControls;
    //cabe�alho
    for linha := 0 to tabela.RecordCount - 1 do begin
      Application.ProcessMessages;
      for coluna := 1 to tabela.FieldCount do begin
        valorcampo := tabela.Fields[coluna - 1].AsString;
        planilha.cells[linha + 2,coluna] := valorCampo;
      end;
      tabela.Next;
    end;

    //linhas
    for coluna := 1 to tabela.FieldCount do begin

      if Length(pFieldsPref) > 0 then begin
        for I := Low(pFieldsPref) to High(pFieldsPref) do begin
          if tabela.Fields[coluna-1].FieldName = pFieldsPref[I] then begin
            valorcampo := tabela.Fields[coluna - 1].DisplayLabel;

            planilha.cells[1,coluna] := valorcampo;
          end;
        end;
      end
      else begin
        valorcampo := tabela.Fields[coluna - 1].DisplayLabel;
        planilha.cells[1,coluna] := valorcampo;
      end;
    end;
    planilha.columns.Autofit;
  finally
    tabela.EnableControls;

    ShowMessage('Arquivo foi criado com sucesso!');
  end;
  planilha.visible := True;
end;

end.
