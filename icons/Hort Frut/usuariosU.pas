unit usuariosU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, DB, DBTables, Mask;

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
    Bevel2: TBevel;
    box1: TCheckBox;
    cbTipo: TDBComboBox;
    tbl_UsuarioCod_Usuario: TIntegerField;
    tbl_UsuarioNome_Usuario: TStringField;
    tbl_UsuarioSenha_Usuario: TStringField;
    tbl_UsuarioTipo_Usuario: TStringField;
    tbl_UsuarioData_Usuario: TDateField;
    editData: TDBEdit;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Usuarios: Tfrm_Usuarios;

implementation

{$R *.dfm}

procedure Tfrm_Usuarios.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure Tfrm_Usuarios.tratabotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not  btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
end;

procedure Tfrm_Usuarios.btnNovoClick(Sender: TObject);
var
prox : Integer;
begin
  tratabotoes;
  If  MessageDlg('Voc� tem certeza que deseja criar um novo o registro?',mtConfirmation,[mbyes,mbno],0)=mryes
  then
    begin
  tbl_Usuario.Active := true;
  tbl_Usuario.Last;
  prox := tbl_Usuario.FieldByName('Cod_Usuario').AsInteger + 1;
  tbl_Usuario.Append;
  tbl_Usuario.FieldByName('Cod_Usuario').AsInteger := prox;
  editNome.SetFocus;
  editData.Text := Datetostr(now);
  btnGravar.Enabled := true;
    
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
end;

procedure Tfrm_Usuarios.btnEditarClick(Sender: TObject);
begin
tratabotoes();
if messagedlg('Deseja editar esse registro?',MtConfirmation,[mbyes,mbno],0)=mrYes
then
  begin
    tbl_Usuario.Active := true;
    tbl_Usuario.Edit;
    btnNovo.Enabled := true;
    btngravar.Enabled := true;
    btnEditar.Enabled := false;
  end
else
    tratabotoes();
    abort;
end;

procedure Tfrm_Usuarios.btnDeletarClick(Sender: TObject);
begin
tratabotoes();
if messagedlg('Deseja realmente excluir esse registro?',mtConfirmation,[mbyes,mbno],0)=mryes
then
  begin
    tbl_Usuario.Delete;
    messagedlg('Registro excluido com Sucesso!',MtConfirmation,[mbok],0);
    tratabotoes();
  end
else
  abort;
end;

procedure Tfrm_Usuarios.btnGravarClick(Sender: TObject);
begin
tratabotoes();
tbl_Usuario.Post;
messagedlg('Registro salvo com sucesso!',MtConfirmation,[mbyes],0);
btnNovo.Enabled := true;
btnCancelar.Enabled := true;
btnGravar.Enabled := true;
btnEditar.Enabled := false;
btnDeletar.Enabled := true;
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
tbl_Usuario.Active := false;
btnNovo.Enabled := true;
end;

procedure Tfrm_Usuarios.FormCreate(Sender: TObject);
begin
btnCancelar.Enabled := false;
btnDeletar.Enabled := false;
btnNovo.Enabled := true;
end;

end.
