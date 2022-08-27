unit cidadesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask,
  ComCtrls, Grids, DBGrids, XPMan;

type
  Tfrm_Cidades = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnDeletar: TBitBtn;
    btnSair: TBitBtn;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Tab2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ds_Local: TDataSource;
    tbl_Local: TTable;
    tbl_LocalCodigo: TIntegerField;
    tbl_LocalLocal: TStringField;
    tbl_LocalSaida: TFloatField;
    tbl_LocalChegada: TFloatField;
    tbl_LocalTotal: TCurrencyField;
    tbl_LocalPreco: TFloatField;
    tbl_LocalKmRodado: TFloatField;
    tbl_LocalGastLitro: TFloatField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    editCod: TDBEdit;
    Panel3: TPanel;
    Label7: TLabel;
    editKmrodado: TDBEdit;
    Label5: TLabel;
    editTotal: TDBEdit;
    btnInserir: TBitBtn;
    btnCalcular: TBitBtn;
    GroupBox2: TGroupBox;
    DBLocal: TDBGrid;
    Panel4: TPanel;
    Label9: TLabel;
    editConsulta: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    editLocal: TDBEdit;
    editPreco: TDBEdit;
    editSaida: TDBEdit;
    editChegada: TDBEdit;
    editGastLitro: TDBEdit;
    Label4: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    tbl_LocalMotorista: TStringField;
    tbl_LocalCarro: TStringField;
    tbl_LocalData: TDateField;
    DBEdit1: TDBEdit;
    XPManifest1: TXPManifest;
    DBEdit2: TDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure LIMPARVARIAVEIS;
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure editConsultaChange(Sender: TObject);
    procedure DBLocalDblClick(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure btnPreencherClick(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure DBLocalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure PREENCHER;
  public
    preco : Real;
    saida, chegada, kmrodado, gastLitro : Integer;
precodocombustivel, valorviagem : Real;
  end;

var
  frm_Cidades: Tfrm_Cidades;

implementation

uses prevfreteU, novopedU, vendasU, comprasU, insertqtdU, principalU,
  listavenddetalhes, listacompdetalhesU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Cidades.btnSairClick(Sender: TObject);
begin
Close;
inserirqtd :=0;
tbl_Local.Last;
if tbl_Local.RecordCount >0 then
begin
if editTotal.Text = '' then
begin
tbl_Local.Delete;
tbl_Local.Active := false;
end;
end;
end;

procedure Tfrm_Cidades.btnCalcularClick(Sender: TObject);
var saida, chegada, kmrodado, gastLitro : Integer;
precodocombustivel, valorviagem : Real;

begin
if (editPreco.Text = '')or(editSaida.Text = '')or(editChegada.Text = '')or(editGastLitro.Text = '') then
begin
MessageDlg('Campos vazios, verifique!',MtWarning,[mbok],0);
abort;
end else

saida :=strtoint(editSaida.Text);
chegada := strtoint(editChegada.Text);
gastLitro := strtoint(editGastLitro.Text);
preco := StrToFloat(editPreco.Text);

kmrodado := chegada - saida;
precodocombustivel := preco / gastLitro;

valorviagem := (kmrodado * precodocombustivel)*3;


editKmrodado.Text := inttostr(kmrodado);

    if Length(editPreco.Text)> 0 then begin

// acontecer alguma coisa

    preco := StrToFloat(editPreco.Text);
     tbl_Local.Edit;
    editTotal.Text := FormatFloat(',,,,.0.0',(valorviagem));
     end;
    tbl_Local.Post;

end;

procedure Tfrm_Cidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
	begin
		Key := #0;
		Perform(wm_nextDlgCtl, 0, 0);
	end;
end;

procedure Tfrm_Cidades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_Cidades.btnInserirClick(Sender: TObject);
begin
LIMPARVARIAVEIS;
if (editPreco.Text = '')or(editSaida.Text = '')or(editChegada.Text = '')or(editGastLitro.Text = '') then
begin
MessageDlg('Campos vazios, verifique!',MtWarning,[mbok],0);
abort;
end else

saida :=strtoint(editSaida.Text);
chegada := strtoint(editChegada.Text);
gastLitro := strtoint(editGastLitro.Text);
preco := StrToFloat(editPreco.Text);

kmrodado := chegada - saida;
precodocombustivel := preco / gastLitro;

valorviagem := (kmrodado * precodocombustivel)*3;


editKmrodado.Text := inttostr(kmrodado);

    if Length(editPreco.Text)> 0 then begin

// acontecer alguma coisa
    tbl_Local.Edit;
    preco := StrToFloat(editPreco.Text);

    tbl_Local.Post;
    end;
if inserirqtd = 1 then
begin
totalprevfrete := valorviagem;
frm_Cidades.Close;
frm_Vendas.Hide;
frm_Vendas.Show;
end else
if inserirqtd = 2 then
begin
totalprevfrete := valorviagem;
frm_Cidades.Close;
frm_Compras.Hide;
frm_Compras.Show;
end else if inserirqtd = 4 then
begin
totalprevfrete := valorviagem;
frm_Cidades.Close;
frm_ListaVendaDetalhes.Hide;
frm_ListaVendaDetalhes.Show;
frm_ListaVendaDetalhes.editFrete.Text := FormatFloat('R$ ,,,,.0.0',totalprevfrete);
end else if inserirqtd = 6 then
begin
totalprevfrete := valorviagem;
frm_Cidades.Close;
frm_ListaCompDetalhes.Hide;
frm_ListaCompDetalhes.Show;

end;
end;

procedure Tfrm_Cidades.FormCreate(Sender: TObject);
var
prox : Integer;
begin
Tab2.ActivePage := TabSheet1;
if tbl_Local.RecordCount = 0 then
begin
tbl_Local.Active := true;
prox := 1;
tbl_Local.Append;
tbl_Local.FieldByName('Codigo').AsInteger := prox;
btnCalcular.Enabled := true;
exit;
end;

if editLocal.Text <> Trim('')then
begin
tbl_Local.Active := true;
tbl_Local.Last;
prox := tbl_Local.FieldByName('Codigo').AsInteger + 1;
tbl_Local.Append;
tbl_Local.FieldByName('Codigo').AsInteger := prox;
btnCalcular.Enabled := true;
end else
tbl_Local.Edit;
btnCalcular.Enabled := true;
end;

procedure Tfrm_Cidades.btnDeletarClick(Sender: TObject);
begin
if tbl_Local.RecordCount < 1 then
begin
Application.MessageBox('Nenhum registro a ser deletado!','Aviso ao tentar excluir um registro',+ mb_iconexclamation);
btnDeletar.Enabled := false;
end else
if MessageDlg('Deseja realmente deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_Local.Delete;
end else
abort;
end;

procedure Tfrm_Cidades.LIMPARVARIAVEIS;
begin
saida := 0;
chegada := 0;
kmrodado := 0;
gastLitro := 0;
precodocombustivel := 0;
valorviagem := 0;

end;

procedure Tfrm_Cidades.FormShow(Sender: TObject);
begin

  Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;

DBLocal.Columns[0].Title.Alignment := taCenter;
DBLocal.Columns[1].Title.Alignment := taCenter;

if inserirqtd < 1 then
begin
btnInserir.Enabled := false;
end else
btnInserir.Enabled := true;
end;

procedure Tfrm_Cidades.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
if editLocal.Text = Trim('')then
begin
tbl_Local.Cancel;
end;
end;

procedure Tfrm_Cidades.editConsultaChange(Sender: TObject);
begin
if tbl_Local.RecordCount >0 then
begin
if (Length(editConsulta.Text) >0) then
begin
tbl_Local.Filtered := false;
tbl_Local.Filter := 'Local = '+Quotedstr(editConsulta.Text+'*');
tbl_Local.Filtered := true;
end else
tbl_Local.Filtered := false;
end;
end;

procedure Tfrm_Cidades.DBLocalDblClick(Sender: TObject);
begin
PREENCHER;

end;

procedure Tfrm_Cidades.editConsultaExit(Sender: TObject);
begin
if Length(editConsulta.Text)= 0 then
begin
editConsulta.Text := 'DIGITE SEU TEXO AQUI';
tbl_Local.Filtered := false;
end;
end;

procedure Tfrm_Cidades.btnPreencherClick(Sender: TObject);
begin
PREENCHER;
end;


procedure Tfrm_Cidades.PREENCHER;
var
local : String;
begin
Local := tbl_Local.FieldByName('Local').AsString;
  if Length(local) = 0 then
    begin
      MessageDlg('N�o tem nenhum local no campo selecionado',MtWarning,[mbok],0);
    exit;
  end else
      tbl_Local.Last;
      tbl_Local.edit;
      tbl_Local.FieldByName('Local').Value := local;
      tbl_Local.Post;
      Tab2.ActivePage := TabSheet1;
end;

procedure Tfrm_Cidades.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure Tfrm_Cidades.DBLocalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBLocal.DataSource.Dataset.RecNo)then
begin
DBLocal.Canvas.Brush.Color := $00E9E9E9;
end else
DBLocal.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBLocal.Canvas.Brush.Color := clHighlight;
DBLocal.Canvas.Font.Color := clWhite;
DBLocal.Canvas.Font.Style := [fsBold];
end;
DBLocal.Canvas.FillRect(Rect);
DBLocal.DefaultDrawColumnCell( Rect, DataCol, Column, State);

end;

end.
