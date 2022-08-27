unit modeloconsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DBCtrls, DB, DBTables, Grids,
  DBGrids;

type
  TfrmModelo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    editConsulta: TEdit;
    Panel7: TPanel;
    btnPesquisar: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    ds_Padrao: TDataSource;
    cbPesquisa: TComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbPesquisaChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure editConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure editConsultaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AtivarTabelas;
    procedure FecharTabelas;
    procedure CustomGrid;
    procedure CarregarCombobox;
    procedure Filtrar;
  public
    { Public declarations }
  end;
type
TDBGridPadrao = class(TDBGrid);
var
  frmModelo: TfrmModelo;
  tablepadrao : TTable;
  dbpadrao : TDBGrid;
  nomecampo : String;

implementation

uses consultausuarios, consultaclientesU, ajustesU, loginU;

{$R *.dfm}

procedure TfrmModelo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
begin
Self.Close;
end;
end;

procedure TfrmModelo.SpeedButton3Click(Sender: TObject);
begin
editConsulta.Clear;
cbPesquisa.ItemIndex := 1;
Self.Close;
tablepadrao.Active := false;
end;

procedure TfrmModelo.FormCreate(Sender: TObject);
begin
AtivarTabelas;
end;

procedure TfrmModelo.AtivarTabelas;
begin
//tablepadrao := tbl_Modelo;
//tablepadrao.Active := true;
dbpadrao := DBGrid1;
CustomGrid;
CarregarCombobox;
cbPesquisa.ItemIndex := 0;
nomecampo := DBGrid1.Columns[0].FieldName;
end;

procedure TfrmModelo.FecharTabelas;
begin
tablepadrao.Active := false;
end;

procedure TfrmModelo.CustomGrid;
begin
TDBGridPadrao(dbpadrao).DefaultRowHeight := 30;
TDBGridPadrao(dbpadrao).ClientHeight := (30 * TDBGridPadrao(dbpadrao).RowCount )+ 30;
end;

procedure TfrmModelo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(dbpadrao.DataSource.Dataset.RecNo)then
begin
dbpadrao.Canvas.Brush.Color := $00E9E9E9;
end else
dbpadrao.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
dbpadrao.Canvas.Brush.Color := clHighlight;
dbpadrao.Canvas.Font.Color := clWhite;
dbpadrao.Canvas.Font.Style := [fsBold];
end;
dbpadrao.Canvas.FillRect(Rect);
dbpadrao.DefaultDrawColumnCell( Rect, DataCol, Column, State);

// mudando posi��o e alinhamento vertical do texto de cada linha

dbpadrao.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );



end;

procedure TfrmModelo.cbPesquisaChange(Sender: TObject);
var
i : Integer;
pesquisa : String;
tipo : TFieldType;
begin
tablepadrao.Filtered := false;
i := cbPesquisa.ItemIndex;
nomecampo := DBGrid1.Columns[i].FieldName;
tipo := tablepadrao.FieldByName(nomecampo).DataType;
if tipo <> ftDate then
begin
editConsulta.SetFocus;
end;
end;

procedure TfrmModelo.DBGrid1TitleClick(Column: TColumn);
begin
cbPesquisa.ItemIndex := Column.Index;
nomecampo := Column.FieldName;
tablepadrao.Filtered := false;
editConsulta.SetFocus;
end;

procedure TfrmModelo.CarregarCombobox;
var
i, count : Integer;
titulo : String;
begin

count := dbpadrao.Columns.Count;

for i:= 0 to count -1 do
    begin
    titulo := dbpadrao.Columns[i].Title.Caption;
    cbPesquisa.Items.Add(titulo);

  end;
 end;

procedure TfrmModelo.Filtrar;
var
tipo : TFieldType;
databeg, dataend : TDateTime;
begin
tipo := tablepadrao.FieldByName(nomecampo).DataType;

if tipo = ftString then
begin
tablepadrao.Filtered := false;
tablepadrao.Filter := ''+nomecampo+' = '+Quotedstr(editConsulta.Text+'*');
tablepadrao.Filtered := true;
end;
if tipo =  ftInteger then
begin
tablepadrao.Filtered := false;
tablepadrao.Filter := ''+UpperCase(nomecampo)+' = '+Quotedstr(editConsulta.Text);
tablepadrao.Filtered := true;
end;
end;
procedure TfrmModelo.btnPesquisarClick(Sender: TObject);
begin
if (editConsulta.Text <> 'DIGITE SEU TEXTO AQUI')and(editConsulta.Text <> '')then
begin
Filtrar;
end;
end;


procedure TfrmModelo.editConsultaKeyPress(Sender: TObject; var Key: Char);
var
tipo : TFieldType;
begin
tipo := tablepadrao.FieldByName(nomecampo).DataType;
if (tipo <> ftString)then
begin
if not (Key in['0'..'9',#8])then
begin
Key := #0;
end;

end;
end;

procedure TfrmModelo.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure TfrmModelo.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
	 begin
     btnPesquisar.Click;
	 end;
  end;

procedure TfrmModelo.editConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text)=0 then
begin
tablepadrao.Filtered := false;
end;
end;

procedure TfrmModelo.editConsultaExit(Sender: TObject);
begin
editConsulta.Text := 'DIGITE SEU TEXTO AQUI';
end;

procedure TfrmModelo.FormShow(Sender: TObject);
begin
CustomGrid;
  Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;
  GroupBox1.Color := cor - 30;
end;

end.
