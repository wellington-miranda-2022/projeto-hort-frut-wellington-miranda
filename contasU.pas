unit contasU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, DB, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBTables;

type
  Tfrm_Contas = class(TForm)
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
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    GroupBox2: TGroupBox;
    ds_Contas: TDataSource;
    DBNavigator1: TDBNavigator;
    tbl_Contas: TTable;
    tbl_ContasId_Conta: TAutoIncField;
    tbl_ContasDescricao_Conta: TStringField;
    tbl_ContasCodigo_Conta: TStringField;
    tbl_ContasAtivo_Conta: TStringField;
    DBContas: TDBGrid;
    SpeedButton3: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbPesquisaChange(Sender: TObject);
    procedure DBContasTitleClick(Column: TColumn);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure editConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure DBContasCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    procedure AtivarTabelas;
    procedure FecharTabelas;
    procedure CarregarCombobox;
    procedure Filtrar;
  public
    { Public declarations }
  end;

var
  frm_Contas: Tfrm_Contas;

implementation

uses modeloconsulta, newcontaU, principalU, vendasU, ajustesU;

{$R *.dfm}

procedure Tfrm_Contas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_Contas.SpeedButton3Click(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_Contas.btnNovoClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
edit := 1;
frm_NewBanco := Tfrm_NewBanco.Create(Self);
frm_NewBanco.ShowModal;
try
finally
frm_NewBanco.Free;
frm_newBanco := nil;
end;
end;

procedure Tfrm_Contas.btnEditarClick(Sender: TObject);
begin
edit := 2;
frm_NewBanco := Tfrm_NewBanco.Create(Self);
frm_NewBanco.ShowModal;
try
finally
frm_NewBanco.Free;
frm_newBanco := nil;
end;
end;

procedure Tfrm_Contas.btnDeletarClick(Sender: TObject);
begin
if tbl_Contas.RecordCount = 0 then
begin
MessageDlg('Não a registros a serem deletados',MtWarning,[mbok],0);
exit;
end;
if MessageDlg('Deseja realmente deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_Contas.Delete;
end else
abort;
end;

procedure Tfrm_Contas.btnGravarClick(Sender: TObject);
begin
tbl_Contas.Post;
end;

procedure Tfrm_Contas.btnCancelarClick(Sender: TObject);
begin
tbl_Contas.Cancel;
end;

procedure Tfrm_Contas.FormCreate(Sender: TObject);
begin
AtivarTabelas;
CarregarCombobox;
cbPesquisa.ItemIndex := 0;
nomecampo := DBContas.Columns[0].FieldName;
end;

procedure Tfrm_Contas.AtivarTabelas;
begin
tbl_Contas.Active := true;
end;

procedure Tfrm_Contas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_Contas.FecharTabelas;
begin
tbl_Contas.Active := false;
end;

procedure Tfrm_Contas.DBContasDrawColumnCell(Sender: TObject;
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

procedure Tfrm_Contas.cbPesquisaChange(Sender: TObject);
var
i : Integer;
pesquisa : String;
tipo : TFieldType;
begin
btnDeletar.Enabled := false;
tbl_Contas.Filtered := false;
i := cbPesquisa.ItemIndex;
nomecampo := DBContas.Columns[i].FieldName;
tipo := tbl_Contas.FieldByName(nomecampo).DataType;
if tipo <> ftDate then
begin
editConsulta.SetFocus;
end;
end;

procedure Tfrm_Contas.DBContasTitleClick(Column: TColumn);
begin
cbPesquisa.ItemIndex := Column.Index;
nomecampo := Column.FieldName;
tbl_Contas.Filtered := false;
editConsulta.SetFocus;
end;

procedure Tfrm_Contas.CarregarCombobox;
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

procedure Tfrm_Contas.editConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text)=0 then
begin
tbl_Contas.Filtered := false;
end;
end;

procedure Tfrm_Contas.editConsultaClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
editConsulta.Clear;
end;

procedure Tfrm_Contas.editConsultaExit(Sender: TObject);
begin
editConsulta.Text := 'DIGITE SEU TEXTO AQUI';
end;

procedure Tfrm_Contas.editConsultaKeyPress(Sender: TObject; var Key: Char);
var
tipo : TFieldType;
begin
tipo := tbl_Contas.FieldByName(nomecampo).DataType;
if (tipo <> ftString)then
begin
if not (Key in['0'..'9',#8])then
begin
Key := #0;
end;

end;
end;

procedure Tfrm_Contas.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
	 begin
     btnPesquisar.Click;
	 end;
  end;
procedure Tfrm_Contas.btnPesquisarClick(Sender: TObject);
begin
btnDeletar.Enabled := false;
if (editConsulta.Text <> 'DIGITE SEU TEXTO AQUI')and(editConsulta.Text <> '')then
begin
Filtrar;
end;
end;

procedure Tfrm_Contas.Filtrar;
var
tipo : TFieldType;
databeg, dataend : TDateTime;
begin
tipo := tbl_Contas.FieldByName(nomecampo).DataType;

if tipo = ftString then
begin
tbl_Contas.Filtered := false;
tbl_Contas.Filter := ''+nomecampo+' = '+Quotedstr(editConsulta.Text+'*');
tbl_Contas.Filtered := true;
end;
if tipo =  ftInteger then
begin
tbl_Contas.Filtered := false;
tbl_Contas.Filter := ''+UpperCase(nomecampo)+' = '+Quotedstr(editConsulta.Text);
tbl_Contas.Filtered := true;
end;
end;


procedure Tfrm_Contas.GroupBox1Click(Sender: TObject);
begin
btnDeletar.Enabled := false;
end;

procedure Tfrm_Contas.Panel1Click(Sender: TObject);
begin
btnDeletar.Enabled := false;
end;

procedure Tfrm_Contas.DBContasCellClick(Column: TColumn);
begin
btnDeletar.Enabled := true;
end;

procedure Tfrm_Contas.FormShow(Sender: TObject);
begin
  Panel1.Color := frm_Ajustes.tbl_Ajustes.FieldByName('Ajustes_AJuste').Value;
  GroupBox1.Color := frm_Ajustes.tbl_Ajustes.FieldByName('Ajustes_AJuste').Value;
  GroupBox2.Color := frm_Ajustes.tbl_Ajustes.FieldByName('Ajustes_AJuste').Value - 30;
end;

end.
