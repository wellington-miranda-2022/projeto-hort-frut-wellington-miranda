unit clientesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Mask,
  ComCtrls, Grids, DBGrids;

type
  Tfrm_Clientes = class(TForm)
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
    tbl_Cliente: TTable;
    ds_Cliente: TDataSource;
    tbl_ClienteCod_Cliente: TIntegerField;
    tbl_ClienteNome_Cliente: TStringField;
    tbl_ClienteEndereco_Cliente: TStringField;
    tbl_ClienteBairro_Cliente: TStringField;
    tbl_ClienteCidade_Cliente: TStringField;
    tbl_ClienteUF_Cliente: TStringField;
    tbl_ClienteTelefone_Cliente: TStringField;
    tbl_ClienteCelular_Cliente: TStringField;
    tbl_ClienteEmpresa_Cliente: TStringField;
    tbl_ClienteData_Cad: TDateField;
    tbl_ClientePrivilegio_Cliente: TStringField;
    tbl_ClienteCPF_Cliente: TStringField;
    tbl_ClienteRG_Cliente: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    editCod: TDBEdit;
    editNome: TDBEdit;
    editEndereco: TDBEdit;
    EditBairro: TDBEdit;
    editDataCad: TDBEdit;
    EditEmpresa: TDBEdit;
    cbCidades: TDBComboBox;
    cbUF: TDBComboBox;
    cbPrivilegios: TDBComboBox;
    editTelefone: TDBEdit;
    editCelular: TDBEdit;
    editRG: TDBEdit;
    editCPF: TDBEdit;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    Label13: TLabel;
    EditConsulta: TEdit;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    btnAdicionar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure tratabotoes();
    procedure editDataCadExit(Sender: TObject);
    procedure editTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure editDataCadKeyPress(Sender: TObject; var Key: Char);
    procedure editCelularKeyPress(Sender: TObject; var Key: Char);
    procedure editRGKeyPress(Sender: TObject; var Key: Char);
    procedure editCPFKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EditConsultaChange(Sender: TObject);
    procedure EditConsultaClick(Sender: TObject);
    procedure EditConsultaExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure editNomeEnter(Sender: TObject);
    procedure editEnderecoEnter(Sender: TObject);
    procedure EditBairroEnter(Sender: TObject);
    procedure cbCidadesEnter(Sender: TObject);
    procedure cbUFEnter(Sender: TObject);
    procedure editTelefoneEnter(Sender: TObject);
    procedure editCelularEnter(Sender: TObject);
    procedure EditEmpresaEnter(Sender: TObject);
    procedure editRGEnter(Sender: TObject);
    procedure editCPFEnter(Sender: TObject);
    procedure cbPrivilegiosEnter(Sender: TObject);
    procedure editNomeExit(Sender: TObject);
    procedure editEnderecoExit(Sender: TObject);
    procedure EditBairroExit(Sender: TObject);
    procedure cbCidadesExit(Sender: TObject);
    procedure cbUFExit(Sender: TObject);
    procedure editTelefoneExit(Sender: TObject);
    procedure editCelularExit(Sender: TObject);
    procedure EditEmpresaExit(Sender: TObject);
    procedure editRGExit(Sender: TObject);
    procedure editCPFExit(Sender: TObject);
    procedure cbPrivilegiosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    procedure FiltrarNome;
    procedure AbrirLista;
    procedure MostrarBotaoAdicionar;
    procedure AdicionarCliente;
    procedure MostrarCliente;
    procedure AtivarTabela;
    procedure FecharTabela;
  public
    { Public declarations }
  end;

var
  frm_Clientes: Tfrm_Clientes;

implementation

uses principalU, usuariosU, editreceberU, baixareceberU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Clientes.btnSairClick(Sender: TObject);
begin
self.Close;
tbl_Cliente.Cancel;

end;

procedure Tfrm_Clientes.btnNovoClick(Sender: TObject);
var
prox : Integer;
begin
if messagedlg('Deseja criar um novo registro?',MtConfirmation,[mbyes,mbno],0)=mryes
  then
    begin
PageControl1.TabIndex := 0;
tbl_Cliente.Active := false;
tbl_Cliente.Active := true;
tbl_Cliente.Last;
prox := tbl_Cliente.FieldByName('Cod_Cliente').AsInteger + 1;
tbl_Cliente.Append;
tbl_Cliente.FieldByName('Cod_Cliente').AsInteger := prox;
editNome.SetFocus;
editdataCad.Text := Datetostr(now);
cbCidades.Text := 'SÃO PAULO';
cbUF.Text := 'SP';
cbPrivilegios.Text := 'SIM';
tratabotoes;

  end else
  abort;
end;

procedure Tfrm_Clientes.tratabotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;

end;

procedure Tfrm_Clientes.editDataCadExit(Sender: TObject);
begin
editdataCad.Text := Datetostr(now);
end;

procedure Tfrm_Clientes.editTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
Key := #0;
end;

procedure Tfrm_Clientes.editDataCadKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
Key := #0;
end;

procedure Tfrm_Clientes.editCelularKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
Key := #0;
end;

procedure Tfrm_Clientes.editRGKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
Key := #0;
end;

procedure Tfrm_Clientes.editCPFKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
Key := #0;
end;

procedure Tfrm_Clientes.btnCancelarClick(Sender: TObject);
begin
tbl_Cliente.Cancel;
btnAdicionar.Enabled := false;
tratabotoes();
end;

procedure Tfrm_Clientes.btnGravarClick(Sender: TObject);
begin
tbl_Cliente.Edit;
tbl_Cliente.FieldByName('UF_Cliente').Value := cbUF.Text;
tbl_Cliente.Post;
btnAdicionar.Enabled := false;
messagedlg('Registro salvo com sucesso!',MtInformation,[mbok],0);
tratabotoes();
end;

procedure Tfrm_Clientes.btnDeletarClick(Sender: TObject);
begin
if tbl_Cliente.RecordCount > 0 then
begin
if messagedlg('Deseja realmente deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes
  then
    begin
      tbl_Cliente.Delete;
      btnAdicionar.Enabled := false;
      tratabotoes();
    end else
  abort;
end else
MessageDlg('Nenhum registro a ser deletado!',MtInformation,[mbyes],0);
end;

procedure Tfrm_Clientes.btnEditarClick(Sender: TObject);
begin
if messagedlg('Deseja editar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes
  then
    begin
      tbl_Cliente.Edit;
      cbUF.Text := tbl_Cliente.FieldByName('UF_Cliente').AsString;
      tratabotoes();
    end else
  abort;
end;

procedure Tfrm_Clientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
	begin
		Key := #0;
		Perform(wm_nextDlgCtl, 0, 0);
	end;
end;

procedure Tfrm_Clientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_Clientes.FormCreate(Sender: TObject);
begin
AtivarTabela;
AbrirLista;
MostrarBotaoAdicionar;
MostrarCliente;
end;



procedure Tfrm_Clientes.DBGrid1CellClick(Column: TColumn);
begin
if btnNovo.Enabled = true then
begin
tbl_Cliente.Edit;
tratabotoes;
end;
btnAdicionar.Enabled := true;
end;

procedure Tfrm_Clientes.FiltrarNome;
begin
if (Length(editConsulta.Text)>0) and (editConsulta.Text <> 'DIGITE SUA PESQUISA...') then
begin
tbl_Cliente.Filtered := false;
tbl_Cliente.Filter := 'Nome_Cliente = '+Quotedstr(editConsulta.Text+'*');
tbl_Cliente.Filtered := true;
end else
tbl_Cliente.Filtered := false;
end;

procedure Tfrm_Clientes.EditConsultaChange(Sender: TObject);
begin
FiltrarNome;
end;

procedure Tfrm_Clientes.EditConsultaClick(Sender: TObject);
begin
editConsulta.Text := '';
end;

procedure Tfrm_Clientes.EditConsultaExit(Sender: TObject);
begin
editConsulta.Text := 'DIGITE SUA PESQUISA...';
tbl_Cliente.Filtered := true;
end;

procedure Tfrm_Clientes.AbrirLista;
begin
if frm_EditReceber = nil then
begin
PageControl1.TabIndex := 0;
end else
PageControl1.TabIndex := 1;
end;

procedure Tfrm_Clientes.MostrarBotaoAdicionar;
begin
if frm_EditReceber = nil then
begin
btnAdicionar.Visible := false;
end else
btnAdicionar.Visible := true;
btnAdicionar.Enabled := false;
end;
procedure Tfrm_Clientes.AdicionarCliente;
var
cliente : String;
begin
if frm_EditReceber <> nil then
begin
cliente := editNome.Text;
btnAdicionar.Enabled := true;
frm_EditReceber.cbCliente.Text := cliente;
Self.Close;

end;
end;

procedure Tfrm_Clientes.btnAdicionarClick(Sender: TObject);
begin
AdicionarCliente;
end;

procedure Tfrm_Clientes.DBGrid1DblClick(Sender: TObject);
begin
AdicionarCliente;
end;

procedure Tfrm_Clientes.editNomeEnter(Sender: TObject);
begin
editNome.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.editEnderecoEnter(Sender: TObject);
begin
editEndereco.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.EditBairroEnter(Sender: TObject);
begin
editBairro.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.cbCidadesEnter(Sender: TObject);
begin
cbCidades.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.cbUFEnter(Sender: TObject);
begin
cbUF.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.editTelefoneEnter(Sender: TObject);
begin
editTelefone.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.editCelularEnter(Sender: TObject);
begin
editCelular.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.EditEmpresaEnter(Sender: TObject);
begin
editEmpresa.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.editRGEnter(Sender: TObject);
begin
editRG.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.editCPFEnter(Sender: TObject);
begin
editCPF.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.cbPrivilegiosEnter(Sender: TObject);
begin
cbPrivilegios.Color := clSkyBlue;
end;

procedure Tfrm_Clientes.editNomeExit(Sender: TObject);
begin
editNome.Color := clWhite;
end;

procedure Tfrm_Clientes.editEnderecoExit(Sender: TObject);
begin
editEndereco.Color := clWhite;
end;

procedure Tfrm_Clientes.EditBairroExit(Sender: TObject);
begin
editBairro.Color := clWhite;
end;

procedure Tfrm_Clientes.cbCidadesExit(Sender: TObject);
begin
cbCidades.Color := clWhite;
end;

procedure Tfrm_Clientes.cbUFExit(Sender: TObject);
begin
cbUF.Color := clWhite;
end;

procedure Tfrm_Clientes.editTelefoneExit(Sender: TObject);
begin
editTelefone.Color := clWhite;
end;

procedure Tfrm_Clientes.editCelularExit(Sender: TObject);
begin
editCelular.Color := clWhite;
end;

procedure Tfrm_Clientes.EditEmpresaExit(Sender: TObject);
begin
editEmpresa.Color := clWhite;
end;

procedure Tfrm_Clientes.editRGExit(Sender: TObject);
begin
editRG.Color := clWhite;
end;

procedure Tfrm_Clientes.editCPFExit(Sender: TObject);
begin
editCPF.Color := clWhite;
end;

procedure Tfrm_Clientes.cbPrivilegiosExit(Sender: TObject);
begin
cbPrivilegios.Color := clWhite;
end;

procedure Tfrm_Clientes.MostrarCliente;
var
cliente : String;
codigo, prox : Integer;
begin
if frm_BaixaReceber  <> nil then
begin
cliente := frm_BaixaReceber.lblNome.Caption;
tbl_Cliente.Filtered := false;
tbl_Cliente.Filter := 'Nome_Cliente ='+Quotedstr(cliente);
tbl_Cliente.Filtered := true;

if tbl_Cliente.FieldByName('Nome_Cliente').Value = null then
begin
PageControl1.TabIndex := 0;
tbl_Cliente.Active := false;
tbl_Cliente.Active := true;
tbl_Cliente.Filtered := false;
tbl_Cliente.Last;
prox := tbl_Cliente.FieldByName('Cod_Cliente').AsInteger + 1;
tbl_Cliente.Append;
tbl_Cliente.FieldByName('Cod_Cliente').AsInteger := prox;
editNome.Text := frm_BaixaReceber.lblNome.Caption;
editdataCad.Text := Datetostr(now);
cbCidades.Text := 'SÃO PAULO';
cbUF.Text := 'SP';
cbPrivilegios.Text := 'SIM';
tratabotoes;

end else
if tbl_Cliente.FieldByName('Nome_Cliente').Value <> '' then
begin

codigo := tbl_Cliente.FieldByName('Cod_Cliente').AsInteger;
tbl_Cliente.Filtered := false;

tbl_Cliente.Locate('Cod_Cliente',IntToStr(codigo),[]);
editTelefone.Color := clSkyBlue;
editCelular.Color := clSkyBlue;
end;
end;
end;

procedure Tfrm_Clientes.AtivarTabela;
begin
tbl_Cliente.Active := true;
end;

procedure Tfrm_Clientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabela;
end;

procedure Tfrm_Clientes.FecharTabela;
begin
tbl_Cliente.Active := false;
end;

procedure Tfrm_Clientes.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Tfrm_Clientes.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;
end;

end.
