unit usuariosU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, DB, DBTables, Mask, Grids,
  DBGrids;

type
  Tfrm_Usuarios = class(TForm)
    Label1: TLabel;
    editCod: TDBEdit;
    Label2: TLabel;
    EditNome: TDBEdit;
    Label3: TLabel;
    editSenha: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    tbl_Usuario: TTable;
    ds_Usuario: TDataSource;
    box1: TCheckBox;
    cbTipo: TDBComboBox;
    tbl_UsuarioCod_Usuario: TIntegerField;
    tbl_UsuarioNome_Usuario: TStringField;
    tbl_UsuarioSenha_Usuario: TStringField;
    tbl_UsuarioTipo_Usuario: TStringField;
    tbl_UsuarioData_Usuario: TDateField;
    Panel1: TPanel;
    Bevel1: TBevel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    Panel2: TPanel;
    DBUsuario: TDBGrid;
    editData: TDBEdit;
    tbl_UsuarioNome_Completo_Usuario: TStringField;
    tbl_UsuarioBloqueio_Usuario: TStringField;
    Label7: TLabel;
    editUsuario: TDBEdit;
    editConsulta: TEdit;
    DBNavigator1: TDBNavigator;
    procedure btnSairClick(Sender: TObject);
    procedure tratabotoes();
    procedure btnNovoClick(Sender: TObject);
    procedure EditNomeEnter(Sender: TObject);
    procedure EditNomeExit(Sender: TObject);
    procedure editSenhaEnter(Sender: TObject);
    procedure editSenhaExit(Sender: TObject);
    procedure cbTipoEnter(Sender: TObject);
    procedure cbTipoExit(Sender: TObject);
    procedure editDataEnter(Sender: TObject);
    procedure editDataExit(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure box1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure DBUsuarioDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBUsuarioDblClick(Sender: TObject);
    procedure editUsuarioEnter(Sender: TObject);
    procedure editUsuarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     procedure FiltrarUsuario;
  public
    { Public declarations }
  end;

var
  frm_Usuarios: Tfrm_Usuarios;

implementation

uses principalU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Usuarios.btnSairClick(Sender: TObject);
begin
Close;
tbl_Usuario.Close;
tbl_Usuario.Active := false;
end;

procedure Tfrm_Usuarios.tratabotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not  btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
DBUsuario.Enabled := not DBUsuario.Enabled;
editConsulta.Enabled := not editConsulta.Enabled;
end;

procedure Tfrm_Usuarios.btnNovoClick(Sender: TObject);
var
prox : Integer;
begin
   If  MessageDlg('Voc� tem certeza que deseja criar um novo o registro?',MtConfirmation,[mbyes,mbno],0)=mryes
  then
    begin
  tbl_Usuario.Last;
  prox := tbl_Usuario.FieldByName('Cod_Usuario').AsInteger + 1;
  tbl_Usuario.Append;
  tbl_Usuario.FieldByName('Cod_Usuario').AsInteger := prox;
  editUsuario.SetFocus;
  editData.Text := Datetostr(now);
  tratabotoes;
  tbl_Usuario.FieldByName('Bloqueio_Usuario').Value := 'N';
    
end;

end;

procedure Tfrm_Usuarios.EditNomeEnter(Sender: TObject);
begin
editNome.Color := clSkyBlue;
end;

procedure Tfrm_Usuarios.EditNomeExit(Sender: TObject);
begin
editNome.Color := clWhite;
end;

procedure Tfrm_Usuarios.editSenhaEnter(Sender: TObject);
begin
editSenha.Color := clSkyBlue;
end;

procedure Tfrm_Usuarios.editSenhaExit(Sender: TObject);
begin
editSenha.Color := clWhite;
end;

procedure Tfrm_Usuarios.cbTipoEnter(Sender: TObject);
begin
cbTipo.Color := clSkyBlue;
end;

procedure Tfrm_Usuarios.cbTipoExit(Sender: TObject);
begin
cbTipo.Color := clWhite;
end;

procedure Tfrm_Usuarios.editDataEnter(Sender: TObject);
begin
editData.Color := clSkyBlue;
end;

procedure Tfrm_Usuarios.editDataExit(Sender: TObject);
begin
editData.Color := clWhite;
editData.Text := DatetoStr(date);
end;

procedure Tfrm_Usuarios.btnEditarClick(Sender: TObject);
begin
if messagedlg('Deseja editar esse registro?',MtConfirmation,[mbyes,mbno],0)=mrYes
then
  begin
    tbl_Usuario.Edit;
    tratabotoes();
    
  end
else
    abort;
end;

procedure Tfrm_Usuarios.btnDeletarClick(Sender: TObject);
begin
if messagedlg('Deseja realmente excluir esse registro?',MtInformation,[mbyes,mbno],0)=mryes
then
  begin
    if tbl_Usuario.RecordCount > 0 then
    begin
    tbl_Usuario.Delete;
    messagedlg('Registro excluido com Sucesso!',MtConfirmation,[mbok],0);
    end else
    MessageDlg('N�o registros a serem deletados!',MtWarning,[mbok],0);
    end
else
  abort;

end;

procedure Tfrm_Usuarios.btnGravarClick(Sender: TObject);
begin
tbl_Usuario.Post;
messagedlg('Registro salvo com sucesso!',MtInformation,[mbok],0);
tratabotoes;
editConsulta.Text := 'DIGITE O NOME DO USU�RIO...';
tbl_Usuario.Filtered := false;
end;

procedure Tfrm_Usuarios.box1Click(Sender: TObject);
begin
if editSenha.PasswordChar = '*' then
 begin
    editSenha.PasswordChar := #0;
 end
 else
    editSenha.PasswordChar := '*';
end;

procedure Tfrm_Usuarios.btnCancelarClick(Sender: TObject);
begin
tratabotoes();
editData.Clear;
tbl_Usuario.Cancel;
end;

procedure Tfrm_Usuarios.FormCreate(Sender: TObject);
begin
tbl_Usuario.Active := false;
tbl_Usuario.Close;
tbl_Usuario.Active := true;
tbl_Usuario.Open;
btnCancelar.Enabled := false;
btnDeletar.Enabled := false;
btnNovo.Enabled := true;
end;

procedure Tfrm_Usuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
	begin
		Key := #0;
		Perform(wm_nextDlgCtl, 0, 0);
	end;
end;

procedure Tfrm_Usuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_Usuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
tbl_Usuario.Active := false;
tbl_Usuario.Close;
end;

procedure Tfrm_Usuarios.editConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text) > 0  then
begin
FiltrarUsuario;
end else
tbl_Usuario.Filtered := false;
end;

procedure Tfrm_Usuarios.FiltrarUsuario;
begin
tbl_Usuario.Filtered := false;
tbl_Usuario.Filter := 'Nome_Completo_Usuario = '+UpperCase(Quotedstr(editConsulta.Text+'*'));
tbl_Usuario.Filtered := true;
end;

procedure Tfrm_Usuarios.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure Tfrm_Usuarios.editConsultaExit(Sender: TObject);
begin
if editConsulta.Text = '' then
begin
editConsulta.Text := 'DIGITE O NOME DO USU�RIO...';
tbl_Usuario.Filtered := false;
end;
end;

procedure Tfrm_Usuarios.DBUsuarioDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  var
  retangulo : TRect;
  check : Integer;
begin
if Odd(DBUsuario.DataSource.Dataset.RecNo)then
begin
DBUsuario.Canvas.Brush.Color := $00E9E9E9;
end else
DBUsuario.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBUsuario.Canvas.Brush.Color := clHighlight;
DBUsuario.Canvas.Font.Color := clWhite;
DBUsuario.Canvas.Font.Style := [fsBold];
end;
DBUsuario.Canvas.FillRect(Rect);
DBUsuario.DefaultDrawColumnCell( Rect, DataCol, Column, State);

if DBUsuario.DataSource.DataSet.IsEmpty then
begin
exit;
end;

  if Column.FieldName = 'Bloqueio_Usuario' then
    begin
    DBUsuario.Canvas.FillRect(retangulo);

    if tbl_Usuario.FieldByName('Bloqueio_Usuario').Value = 'S' then
    begin
    check := DFCS_CHECKED;
    end
    else
    check := 0;
    retangulo := Rect;
    InflateRect(retangulo,-3,-3);
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle,retangulo,DFC_BUTTON,DFCS_BUTTONCHECK or check);
   end;
  end;

procedure Tfrm_Usuarios.DBUsuarioDblClick(Sender: TObject);
begin
 if DBUsuario.Columns.Items[3].Field.Text = 'N' then
 begin
 tbl_Usuario.Edit;
 tbl_Usuario.FieldByName('Bloqueio_Usuario').Value := 'S';
 tbl_Usuario.Post;
end else
  begin
 tbl_Usuario.Edit;
 tbl_Usuario.FieldByName('Bloqueio_Usuario').Value := 'N';
 tbl_Usuario.Post;
  end;
 tbl_Usuario.Edit;
 end;


procedure Tfrm_Usuarios.editUsuarioEnter(Sender: TObject);
begin
editUsuario.Color := clSkyBlue;
end;

procedure Tfrm_Usuarios.editUsuarioExit(Sender: TObject);
begin
editUsuario.Color := clWhite;
end;

procedure Tfrm_Usuarios.FormShow(Sender: TObject);
begin
 Panel1.Color := cor;
  Panel2.Color := cor - 30;

 
end;

end.
