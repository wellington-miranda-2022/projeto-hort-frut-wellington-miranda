unit planodecontasU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ComCtrls, DB, DBTables,
  Buttons, ExtCtrls, ToolWin;

type
  Tfrm_PlanoContas = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    btnAdicionar: TBitBtn;
    ds_PlanoContas: TDataSource;
    tbl_PlanoContas: TTable;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Panel4: TPanel;
    EditConsulta: TEdit;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    DBPlanoContas: TDBGrid;
    ToolBar1: TToolBar;
    tbl_PlanoContasCod_PlanoContas: TIntegerField;
    tbl_PlanoContasTipo_PlanoContas: TStringField;
    tbl_PlanoContasCategoria_PlanoContas: TStringField;
    tbl_PlanoContasAtivo_PlanoContas: TStringField;
    tbl_PlanoContasSequencia_PlanoContas: TStringField;
    tbl_Filtro: TTable;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    editCod: TDBEdit;
    Label2: TLabel;
    editSequencia: TDBEdit;
    Label1: TLabel;
    editDescricao: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbCategoria: TComboBox;
    cbTipo: TComboBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    ckAtivo: TDBCheckBox;
    tbl_FiltroCod_PlanoContas: TIntegerField;
    tbl_FiltroSequencia_PlanoContas: TStringField;
    tbl_FiltroDescricao_PlanoContas: TStringField;
    tbl_FiltroTipo_PlanoContas: TStringField;
    tbl_FiltroCategoria_PlanoContas: TStringField;
    tbl_FiltroAtivo_PlanoContas: TStringField;
    tbl_PlanoContasDescricao_PlanoContas: TStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBPlanoContasCellClick(Column: TColumn);
    procedure DBPlanoContasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EditConsultaChange(Sender: TObject);
    procedure EditConsultaClick(Sender: TObject);
    procedure EditConsultaExit(Sender: TObject);
    procedure editDescricaoEnter(Sender: TObject);
    procedure editDescricaoExit(Sender: TObject);
    procedure cbCategoriaEnter(Sender: TObject);
    procedure cbCategoriaExit(Sender: TObject);
    procedure cbTipoEnter(Sender: TObject);
    procedure cbTipoExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure DBPlanoContasDblClick(Sender: TObject);
    procedure DBPlanoContasDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    procedure Incrementar;
    procedure FecharTabelas;
    procedure AtivarTabelas;
    procedure TrataBotoes;
    procedure Sequencia;
    procedure Cancelar;
    procedure Classificar;
    procedure Espacar;
    procedure LimparCampos;
    procedure Editar;
    procedure TirarEspaco;
    procedure GotoPage;
    procedure FiltrarNome;
    procedure HabilitarAdicionar;
    procedure AdicionarPlano;
   public
    numeracao : String;
  end;

var
  frm_PlanoContas: Tfrm_PlanoContas;

implementation

uses editreceberU, newmovimentacoesU, contaseditar, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_PlanoContas.btnNovoClick(Sender: TObject);
begin
tbl_PlanoContas.Filtered := false;
if btnDeletar.Enabled = true then
begin
btnDeletar.Enabled := false;
end;

Incrementar;
PageControl1.TabIndex := 0;
TrataBotoes;
Editar;
LimparCampos;
end;

procedure Tfrm_PlanoContas.Incrementar;
var
prox : Integer;
begin
tbl_PlanoContas.Last;
prox := tbl_PlanoContas.FieldByName('Cod_PlanoContas').AsInteger + 1;
tbl_PlanoContas.Append;
tbl_PlanoContas.FieldByName('Cod_PlanoContas').AsInteger := prox;

end;

procedure Tfrm_PlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_PlanoContas.FecharTabelas;
begin
tbl_PlanoContas.Active := false;
end;

procedure Tfrm_PlanoContas.FormCreate(Sender: TObject);
begin
HabilitarAdicionar;
AtivarTabelas;
GotoPage;
Editar;

end;

procedure Tfrm_PlanoContas.AtivarTabelas;
begin
tbl_PlanoContas.Active := true;
end;

procedure Tfrm_PlanoContas.btnSairClick(Sender: TObject);
begin
tbl_PlanoContas.Cancel;
Cancelar;
Self.Close;
end;

procedure Tfrm_PlanoContas.btnCancelarClick(Sender: TObject);
begin
TrataBotoes;
tbl_PlanoContas.Cancel;
Editar;
PageControl1.TabIndex := 1;
end;

procedure Tfrm_PlanoContas.btnDeletarClick(Sender: TObject);
begin
if btnNovo.Enabled = true then
begin
btnDeletar.Enabled := false
end else
if btnNovo.Enabled = false then
begin
TrataBotoes;
end;

tbl_PlanoContas.delete;
end;

procedure Tfrm_PlanoContas.btnGravarClick(Sender: TObject);
begin
if (cbCategoria.Text = '')or(cbTipo.Text = '')then
begin
MessageDlg('Campos vazios, verifique!',MtWarning,[mbok],0);
exit;
end;

TrataBotoes;
tbl_PlanoContas.Post;

if editSequencia.Text = '' then
begin
Sequencia;
end;

numeracao := editSequencia.Text;

tbl_PlanoContas.Last;

tbl_PlanoContas.Edit;

tbl_PlanoContas.FieldByName('Categoria_PlanoContas').Value := cbCategoria.Text;

if cbTipo.Text = 'DESPESA' then
begin
tbl_PlanoContas.FieldByName('Tipo_PlanoContas').Value := 'D';
end;
if cbTipo.Text = 'RECEITA' then
begin
tbl_PlanoContas.FieldByName('Tipo_PlanoContas').Value := 'R';
end;

tbl_PlanoContas.FieldByName('Sequencia_PlanoContas').Value := numeracao;

Espacar;

tbl_PlanoContas.Post;

Editar;

PageControl1.TabIndex := 1;

end;

procedure Tfrm_PlanoContas.TrataBotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure Tfrm_PlanoContas.btnEditarClick(Sender: TObject);
begin
TrataBotoes;
PageControl1.TabIndex := 0;
tbl_PlanoContas.Edit;
Editar;
tbl_PlanoContas.FieldByName('Descricao_PlanoContas').Value := Trim(tbl_PlanoContas.FieldByName('Descricao_PlanoContas').Value);
end;

procedure Tfrm_PlanoContas.Sequencia;
var
num1, num2, num3 : Integer;
begin
if cbTipo.Text = 'DESPESA' then
begin
if cbCategoria.Text = 'A' then
begin
tbl_Filtro.Open;
tbl_Filtro.Filtered := false;
tbl_Filtro.Filter := 'Categoria_PlanoContas = '+Quotedstr('A');
tbl_Filtro.Filtered := true;

num3 := tbl_Filtro.RecordCount;
end;

num1 := 1;
tbl_Filtro.Open;
tbl_Filtro.Filtered := false;
tbl_Filtro.Filter := 'Tipo_PlanoContas = '+Quotedstr('D')+'and Categoria_PlanoContas = '+Quotedstr('S');
tbl_Filtro.Filtered := true;

num2 := tbl_Filtro.RecordCount;

if (cbCategoria.Text = 'A')and(num2 > 0) then
begin
tbl_Filtro.Filtered := false;
tbl_Filtro.Filter := 'Tipo_PlanoContas = '+Quotedstr('D')+'and Categoria_PlanoContas = '+Quotedstr('S');
tbl_Filtro.Filtered := true;

num2 := tbl_Filtro.RecordCount;

num2 := num2 - 1;
end;

editSequencia.Text := '0'+IntToStr(num1)+'.0'+IntToStr(num2)+'.0'+IntToStr(num3);
Exit;
end else

num1 := 2;
tbl_Filtro.Open;
tbl_Filtro.Filtered := false;
tbl_Filtro.Filter := 'Tipo_PlanoContas = '+Quotedstr('R')+'and Categoria_PlanoContas = '+Quotedstr('S');;
tbl_Filtro.Filtered := true;

num2 := tbl_Filtro.RecordCount;

if (cbCategoria.Text = 'A')and(num2 > 0) then
begin
tbl_Filtro.Filtered := false;
tbl_Filtro.Filter := 'Tipo_PlanoContas = '+Quotedstr('R')+'and Categoria_PlanoContas = '+Quotedstr('S');
tbl_Filtro.Filtered := true;

num2 := tbl_Filtro.RecordCount;

num2 := num2 - 1;
end;

editSequencia.Text := '0'+IntToStr(num1)+'.0'+IntToStr(num2)+'.0'+IntToStr(num3);
end;

procedure Tfrm_PlanoContas.Button1Click(Sender: TObject);
var
num2 : Integer;
begin
tbl_Filtro.Open;
tbl_Filtro.Filtered := false;
tbl_Filtro.Filter := 'Tipo_PlanoContas = '+Quotedstr('D');
tbl_Filtro.Filtered := true;

num2 := tbl_Filtro.RecordCount;
ShowMessage(IntToStr(num2));
end;

procedure Tfrm_PlanoContas.DBPlanoContasCellClick(Column: TColumn);
begin
btnDeletar.Enabled := true;
btnAdicionar.Enabled := true;
end;

procedure Tfrm_PlanoContas.Cancelar;
begin
tbl_PlanoContas.Last;
if tbl_PlanoContas.FieldByName('Sequencia_PlanoContas').Value = '' then
begin
tbl_PlanoContas.Delete;
end;
end;

procedure Tfrm_PlanoContas.Classificar;
begin

end;

procedure Tfrm_PlanoContas.DBPlanoContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
begin
if (Sender as TDBGrid).DataSource.DataSet.FieldByName('Categoria_PlanoContas').Value = 'S' then
  begin
   (Sender as TDBGrid).Canvas.Font.Style:= [fsbold];
end;

(Sender as TDBGrid).Canvas.FillRect(Rect);
(Sender as TDBGrid).DefaultDrawDataCell(Rect, (Sender as   TDBGrid).columns[datacol].field, State);

end;
begin
if Odd(DBPlanoContas.DataSource.Dataset.RecNo)then
begin
DBPlanoContas.Canvas.Brush.Color := $00E9E9E9;
end else
DBPlanoContas.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBPlanoContas.Canvas.Brush.Color := clHighlight;
DBPlanoContas.Canvas.Font.Color := clWhite;
DBPlanoContas.Canvas.Font.Style := [fsBold];
end;
DBPlanoContas.Canvas.FillRect(Rect);
DBPlanoContas.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;
end;

procedure Tfrm_PlanoContas.Espacar;
var
espacar : String;
begin
espacar := editDescricao.Text;
if ((cbCategoria.Text = 'S')and(editDescricao.Text <> 'DESPESAS')and(editDescricao.Text <> 'RECEITAS')) then
begin
editDescricao.Text := '  '+espacar;
end else
if ((cbCategoria.Text = 'A')and(editDescricao.Text <> 'DESPESAS')and(editDescricao.Text <> 'RECEITAS')) then
begin
editDescricao.Text := '       '+espacar;
end;
end;

procedure Tfrm_PlanoContas.LimparCampos;
begin
cbTipo.Text := '';
cbCategoria.Text := '';
editDescricao.Setfocus;
end;

procedure Tfrm_PlanoContas.Editar;
begin
editCod.Enabled := not editCod.Enabled;
editSequencia.Enabled := not editSequencia.Enabled;
editDescricao.Enabled := not editDescricao.Enabled;
cbTipo.Enabled := not cbTipo.Enabled;
cbCategoria.Enabled := not cbCategoria.Enabled;
ckAtivo.Enabled := not ckAtivo.Enabled;
end;

procedure Tfrm_PlanoContas.TirarEspaco;
var
espaco : String;
begin
espaco := Trim(editDescricao.Text);
editDescricao.Text := espaco;

end;

procedure Tfrm_PlanoContas.GotoPage;
begin
if (frm_EditReceber <> nil)or(frm_NewMovimentacao <> nil)or(frm_ContasEditar <> nil) then
begin
PageControl1.TabIndex := 1;
end else
PageControl1.TabIndex := 0;
end;


procedure Tfrm_PlanoContas.EditConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text)>0 then
begin
FiltrarNome;
end else
tbl_PlanoContas.Filtered := false;
end;

procedure Tfrm_PlanoContas.EditConsultaClick(Sender: TObject);
begin
editConsulta.Text := '';
end;

procedure Tfrm_PlanoContas.EditConsultaExit(Sender: TObject);
begin
if editConsulta.Text = '' then
begin
editConsulta.Text := 'DIGITE SUA PESQUISA...';
tbl_PlanoContas.Filtered := false;
end else
tbl_PlanoContas.Filtered := true;
end;

procedure Tfrm_PlanoContas.FiltrarNome;
var
espaco, pesquisa : String;
begin
espaco := '       ';
pesquisa := 'Descricao_PlanoContas';
if (Length(editConsulta.Text)>0) and (editConsulta.Text <> 'DIGITE SUA PESQUISA...') then
begin
tbl_PlanoContas.Filtered := false;
tbl_PlanoContas.Filter := 'Descricao_PlanoContas = '+QuotedStr(espaco+editConsulta.Text+'*');
tbl_PlanoContas.Filtered := true;
end else
tbl_PlanoContas.Filtered := false;
end;

procedure Tfrm_PlanoContas.HabilitarAdicionar;
begin
if (frm_EditReceber = nil) then
begin
btnAdicionar.Visible := false;
end else
if (frm_EditReceber <> nil)then
begin
btnAdicionar.Visible := true;
exit;
end;

if (frm_NewMovimentacao = nil) then
begin
btnAdicionar.Visible := false;
end else
if (frm_NewMovimentacao <> nil)then
begin
btnAdicionar.Visible := true;
end;
end;

procedure Tfrm_PlanoContas.editDescricaoEnter(Sender: TObject);
begin
editDescricao.Color := clSkyBlue;
end;

procedure Tfrm_PlanoContas.editDescricaoExit(Sender: TObject);
begin
editDescricao.Color := clWhite;
end;

procedure Tfrm_PlanoContas.cbCategoriaEnter(Sender: TObject);
begin
cbCategoria.Color := clSkyBlue;
end;

procedure Tfrm_PlanoContas.cbCategoriaExit(Sender: TObject);
begin
cbCategoria.Color := clWhite;
end;

procedure Tfrm_PlanoContas.cbTipoEnter(Sender: TObject);
begin
cbTipo.Color := clSkyBlue;
end;

procedure Tfrm_PlanoContas.cbTipoExit(Sender: TObject);
begin
cbTipo.Color := clWhite;
end;

procedure Tfrm_PlanoContas.btnAdicionarClick(Sender: TObject);
begin
AdicionarPlano;
end;
procedure Tfrm_PlanoContas.AdicionarPlano;
var
descricao : String;
begin
if frm_EditReceber <> nil then
begin
descricao := tbl_PlanoContas.FieldByName('Descricao_PlanoContas').Value;
frm_EditReceber.cbPlano.Text := Trim(descricao);
self.Close;
end else
if frm_NewMovimentacao <> nil then
begin
descricao := tbl_PlanoContas.FieldByName('Descricao_PlanoContas').Value;
frm_NewMovimentacao.cbPlanoContas.Text := Trim(descricao);
self.Close;
end else
if frm_ContasEditar <> nil then
begin
descricao := tbl_PlanoContas.FieldByName('Descricao_PlanoContas').Value;
frm_ContasEditar.cbPlano.Text := Trim(descricao);
self.Close;
end;
end;

procedure Tfrm_PlanoContas.DBPlanoContasDblClick(Sender: TObject);
begin
AdicionarPlano;
end;

procedure Tfrm_PlanoContas.DBPlanoContasDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if not odd(tbl_PlanoContas.RecNo) then
    if not (gdSelected in State) then
      begin
      DBPlanoContas.Canvas.Brush.Color := $00E9E9E9;
      DBPlanoContas.Canvas.FillRect(Rect);
      DBPlanoContas.DefaultDrawDataCell(rect, Field,state);

    end;
end;

procedure Tfrm_PlanoContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_PlanoContas.FormShow(Sender: TObject);
begin
 Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;
end;

end.
