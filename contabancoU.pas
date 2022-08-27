unit contabancoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Buttons,
  ExtCtrls, DB, DBTables;

type
  Tfrm_ContaBanco = class(TForm)
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
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    ds_ContaBanco: TDataSource;
    tbl_ContaBanco: TTable;
    tbl_ContaBancoDescricao_ContaBanco: TStringField;
    tbl_ContaBancoAgencia_ContaBanco: TStringField;
    tbl_ContaBancoConta_ContaBanco: TStringField;
    tbl_ContaBancoBanco_ContaBanco: TStringField;
    tbl_ContaBancoAtivo: TStringField;
    tbl_ContaBancoId_ContaBanco: TIntegerField;
    tbl_ContaBancoCod_BancoConta: TFloatField;
    Label3: TLabel;
    cbCodigoBanco: TComboBox;
    cbBanco: TComboBox;
    tbl_Bancos: TTable;
    tbl_BancosCod_Banco: TAutoIncField;
    tbl_BancosId_Banco: TStringField;
    tbl_BancosBanco_Banco: TStringField;
    cbAtivo: TComboBox;
    editDescricao: TDBEdit;
    editAgencia: TDBEdit;
    editConta: TDBEdit;
    DBGrid1: TDBGrid;
    procedure editAgenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbCodigoBancoChange(Sender: TObject);
    procedure cbBancoChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure editDescricaoEnter(Sender: TObject);
    procedure cbAtivoEnter(Sender: TObject);
    procedure editAgenciaEnter(Sender: TObject);
    procedure editContaEnter(Sender: TObject);
    procedure cbCodigoBancoEnter(Sender: TObject);
    procedure cbBancoEnter(Sender: TObject);
    procedure editDescricaoExit(Sender: TObject);
    procedure cbAtivoExit(Sender: TObject);
    procedure editAgenciaExit(Sender: TObject);
    procedure editContaExit(Sender: TObject);
    procedure cbCodigoBancoExit(Sender: TObject);
    procedure cbBancoExit(Sender: TObject);
    procedure EditConsultaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure EditConsultaChange(Sender: TObject);
    procedure EditConsultaExit(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    procedure MostrarLista;
    procedure CarregarCodBancos;
    procedure AtivarTabelas;
    procedure FecharTabelas;
    procedure CarregarBancos;
    procedure FiltrarCodigo;
    procedure FiltrarBanco;
    procedure ReceberInformacoes;
    procedure HabilitarCampos;
    procedure TratarBotoes;
    procedure AdicionarConta;
    procedure FiltrarNome;
  public
    { Public declarations }
  end;

var
  frm_ContaBanco: Tfrm_ContaBanco;

implementation

uses baixareceberU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_ContaBanco.editAgenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_ContaBanco.btnSairClick(Sender: TObject);
begin
tbl_ContaBanco.Cancel;
Self.Close;
end;

procedure Tfrm_ContaBanco.FormCreate(Sender: TObject);
begin
AtivarTabelas;
MostrarLista;
CarregarCodBancos;
CarregarBancos;
ReceberInformacoes;
end;

procedure Tfrm_ContaBanco.MostrarLista;
begin
if frm_BaixaReceber <> nil then
begin
PageControl1.TabIndex := 1;
btnAdicionar.Visible := true;
end;
end;

procedure Tfrm_ContaBanco.DBGrid1CellClick(Column: TColumn);
begin
btnAdicionar.Enabled := true;
btnDeletar.Enabled := true;
if tbl_ContaBanco.FieldByName('Descricao_ContaBanco').Value <> null then
begin
btnAdicionar.Enabled := true;
end;
end;

procedure Tfrm_ContaBanco.PageControl1Change(Sender: TObject);
begin
btnAdicionar.Enabled := false;
btnDeletar.Enabled := false;
end;

procedure Tfrm_ContaBanco.CarregarCodBancos;
begin
with tbl_Bancos do
begin
  Active := false;
  Active := true;

  if not isEmpty then
while not Eof do
    begin
      cbCodigoBanco.Items.Add(tbl_Bancos.FieldByName('Id_Banco').Value);
      Next;
    end;
  end;
end;

procedure Tfrm_ContaBanco.AtivarTabelas;
begin
tbl_ContaBanco.Active := true;
tbl_Bancos.Active := true;
end;

procedure Tfrm_ContaBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_ContaBanco.FecharTabelas;
begin
tbl_ContaBanco.Active := false;
tbl_Bancos.Active := false;
end;

procedure Tfrm_ContaBanco.CarregarBancos;
begin
with tbl_Bancos do
begin
  Active := false;
  Active := true;

  if not isEmpty then
while not Eof do
    begin
      cbBanco.Items.Add(tbl_Bancos.FieldByName('Banco_Banco').Value);
      Next;
    end;
  end;
end;

procedure Tfrm_ContaBanco.FiltrarCodigo;
var
banco, codigo : String;
begin
codigo := cbCodigoBanco.Text;

tbl_Bancos.Filtered := false;
tbl_Bancos.Filter := 'Id_Banco = '+Quotedstr(codigo);
tbl_Bancos.Filtered := true;

banco := tbl_Bancos.FieldByName('Banco_Banco').AsString;
cbBanco.Text := banco ;


end;

procedure Tfrm_ContaBanco.cbCodigoBancoChange(Sender: TObject);
begin
FiltrarCodigo;
end;

procedure Tfrm_ContaBanco.cbBancoChange(Sender: TObject);
begin
FiltrarBanco;
end;

procedure Tfrm_ContaBanco.FiltrarBanco;
var
codigo, banco : String;
begin
banco := cbBanco.Text;

tbl_Bancos.Filtered := false;
tbl_Bancos.Filter := 'Banco_Banco = '+Quotedstr(banco);
tbl_Bancos.Filtered := true;

codigo := tbl_Bancos.FieldByName('Id_Banco').AsString;

cbCodigoBanco.Text := codigo;

end;

procedure Tfrm_ContaBanco.ReceberInformacoes;
begin
cbAtivo.Text := tbl_ContaBanco.FieldByName('Ativo').AsString;
cbCodigoBanco.Text := tbl_ContaBanco.FieldByName('Cod_BancoConta').AsString;
cbBanco.Text := tbl_ContaBanco.FieldByName('Banco_ContaBanco').AsString;
end;

procedure Tfrm_ContaBanco.HabilitarCampos;
begin
editDescricao.Enabled := not editDescricao.Enabled;
editAgencia.Enabled := not editAgencia.Enabled;
editConta.Enabled := not editConta.Enabled;
cbAtivo.Enabled := not cbAtivo.Enabled;
cbCodigoBanco.Enabled := not cbCodigoBanco.Enabled;
cbBanco.Enabled := not cbBanco.Enabled;
end;

procedure Tfrm_ContaBanco.btnNovoClick(Sender: TObject);
begin
btnAdicionar.Enabled := false;
tbl_ContaBanco.Insert;
PageControl1.TabIndex := 0;
HabilitarCampos;
editDescricao.SetFocus;
cbCodigoBanco.Text := '';
cbBanco.Text := '';
btnDeletar.Enabled := false;
TratarBotoes;
end;

procedure Tfrm_ContaBanco.btnEditarClick(Sender: TObject);
begin
if tbl_ContaBanco.RecordCount = 0 then
begin
MessageDlg('N�o a registros a serem editados!',MtWarning,[mbok],0);
exit;
end;
btnAdicionar.Enabled := false;
tbl_ContaBanco.Edit;
HabilitarCampos;
PageControl1.TabIndex := 0;
btnDeletar.Enabled := false;
TratarBotoes;
end;

procedure Tfrm_ContaBanco.btnDeletarClick(Sender: TObject);
begin
if tbl_ContaBanco.RecordCount = 0 then
begin
MessageDlg('N�o a registros a serem deletados!',MtWarning,[mbok],0);
exit;
end;

if MessageDlg('Deseja realmente deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
btnAdicionar.Enabled := false;
tbl_ContaBanco.Delete;
TratarBotoes;
end else
abort;
end;

procedure Tfrm_ContaBanco.btnGravarClick(Sender: TObject);
begin
btnAdicionar.Enabled := false;
tbl_ContaBanco.FieldByName('Ativo').AsString := cbAtivo.Text;
tbl_ContaBanco.FieldByName('Cod_BancoConta').AsString := cbCodigoBanco.Text;
tbl_ContaBanco.FieldByName('Banco_ContaBanco').AsString := cbBanco.Text;
tbl_ContaBanco.Post;
MessageDlg('Registro salvo com sucesso!',MtInformation,[mbok],0);
HabilitarCampos;
PageControl1.TabIndex := 1;
btnDeletar.Enabled := false;
TratarBotoes;
end;

procedure Tfrm_ContaBanco.btnCancelarClick(Sender: TObject);
begin
btnAdicionar.Enabled := false;
tbl_ContaBanco.Cancel;
PageControl1.TabIndex := 1;
HabilitarCampos;
btnDeletar.Enabled := false;
TratarBotoes;
end;

procedure Tfrm_ContaBanco.editDescricaoEnter(Sender: TObject);
begin
editDescricao.Color := clSkyBlue;
end;

procedure Tfrm_ContaBanco.cbAtivoEnter(Sender: TObject);
begin
cbAtivo.Color := clSkyBlue;
end;

procedure Tfrm_ContaBanco.editAgenciaEnter(Sender: TObject);
begin
editAgencia.Color := clSkyBlue;
end;

procedure Tfrm_ContaBanco.editContaEnter(Sender: TObject);
begin
editConta.Color := clSkyBlue;
end;

procedure Tfrm_ContaBanco.cbCodigoBancoEnter(Sender: TObject);
begin
cbCodigoBanco.Color := clSkyBlue;
end;

procedure Tfrm_ContaBanco.cbBancoEnter(Sender: TObject);
begin
cbBanco.Color := clSkyBlue;
end;

procedure Tfrm_ContaBanco.editDescricaoExit(Sender: TObject);
begin
editDescricao.Color := clWhite;
end;

procedure Tfrm_ContaBanco.cbAtivoExit(Sender: TObject);
begin
cbAtivo.Color := clWhite;
end;

procedure Tfrm_ContaBanco.editAgenciaExit(Sender: TObject);
begin
editAgencia.Color := clWhite;
end;

procedure Tfrm_ContaBanco.editContaExit(Sender: TObject);
begin
editConta.Color := clWhite;
end;

procedure Tfrm_ContaBanco.cbCodigoBancoExit(Sender: TObject);
begin
cbCodigoBanco.Color := clWhite;
end;

procedure Tfrm_ContaBanco.cbBancoExit(Sender: TObject);
begin
cbBanco.Color := clWhite;
end;

procedure Tfrm_ContaBanco.TratarBotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnEditar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure Tfrm_ContaBanco.EditConsultaClick(Sender: TObject);
begin
btnAdicionar.Enabled := false;
editConsulta.Text := '';
btnDeletar.Enabled := false;
end;

procedure Tfrm_ContaBanco.AdicionarConta;
begin
frm_BaixaReceber.editContaCorrente.Text := tbl_ContaBanco.FieldByName('Descricao_ContaBanco').AsString;
Self.Close;
end;

procedure Tfrm_ContaBanco.DBGrid1DblClick(Sender: TObject);
begin
AdicionarConta;
end;

procedure Tfrm_ContaBanco.btnAdicionarClick(Sender: TObject);
begin
AdicionarConta;
end;

procedure Tfrm_ContaBanco.EditConsultaChange(Sender: TObject);
begin
FiltrarNome;
end;

procedure Tfrm_ContaBanco.EditConsultaExit(Sender: TObject);
begin
editConsulta.Text := 'DIGITE NOME DO BANCO...';
tbl_ContaBanco.Filtered := true;
end;

procedure Tfrm_ContaBanco.FiltrarNome;
begin
if (Length(editConsulta.Text)>0) and (editConsulta.Text <> 'DIGITE NOME DO BANCO...') then
begin
tbl_ContaBanco.Filtered := false;
tbl_ContaBanco.Filter := 'Descricao_ContaBanco = '+Quotedstr(editConsulta.Text+'*');
tbl_ContaBanco.Filtered := true;
end else
tbl_ContaBanco.Filtered := false;
end;

procedure Tfrm_ContaBanco.GroupBox1Click(Sender: TObject);
begin
btnDeletar.Enabled := false;
end;

procedure Tfrm_ContaBanco.Panel2Click(Sender: TObject);
begin
btnDeletar.Enabled := true;
end;

procedure Tfrm_ContaBanco.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBGrid1.DataSource.Dataset.RecNo)then
begin
DBGrid1.Canvas.Brush.Color := $00E9E9E9;
end else
DBGrid1.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBGrid1.Canvas.Brush.Color := clHighlight;
DBGrid1.Canvas.Font.Color := clWhite;
DBGrid1.Canvas.Font.Style := [fsBold];
end;
DBGrid1.Canvas.FillRect(Rect);
DBGrid1.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_ContaBanco.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;
end;

end.
