unit loginU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XPMan, ExtCtrls, DB, DBTables, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdDayTime, idSNTP,
  DBXpress, SqlExpr, IniFiles, ZipMstr, Wininet;

type
  TfrmLogin = class(TForm)
    editLogin: TLabeledEdit;
    Label1: TLabel;
    editSenha: TLabeledEdit;
    btnClose: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    btnLogin: TBitBtn;
    editTipo: TComboBox;
    Label2: TLabel;
    Image1: TImage;
    ds_Usuario: TDataSource;
    tbl_Usuario: TTable;
    tbl_UsuarioCod_Usuario: TIntegerField;
    tbl_UsuarioNome_Usuario: TStringField;
    tbl_UsuarioSenha_Usuario: TStringField;
    tbl_UsuarioTipo_Usuario: TStringField;
    tbl_UsuarioData_Usuario: TDateField;
    tbl_UsuarioNome_Completo_Usuario: TStringField;
    tbl_UsuarioBloqueio_Usuario: TStringField;
    Database1: TDatabase;
    ZipMaster1: TZipMaster;
    tbl_Ajustes: TTable;
    tbl_AjustesCod_Ajuste: TAutoIncField;
    tbl_AjustesDescricao_Ajuste: TStringField;
    tbl_AjustesAjustes_AJuste: TFloatField;
    procedure editLoginEnter(Sender: TObject);
    procedure editLoginExit(Sender: TObject);
    procedure editSenhaEnter(Sender: TObject);
    procedure editSenhaExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure editTipoEnter(Sender: TObject);
    procedure editTipoExit(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure LimparCampos;
    procedure ArquivoIni;
    procedure Descompactar;
    procedure CriarNovo;
    procedure AtualizarData;
    procedure ChamarAjustes;
    procedure FiltrarCor;

    public
    bloqueio : String;
    end;

var
  frmLogin: TfrmLogin;
  cor : Integer;

implementation

uses principalU, pedidoU, novopedU, ajustesU;

{$R *.dfm}
{$INCLUDE ZipVers.inc}
{$IfDef VER140}
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$endif}

procedure TfrmLogin.editLoginEnter(Sender: TObject);
begin
editLogin.Color := clSkyBlue;
end;

procedure TfrmLogin.editLoginExit(Sender: TObject);
begin
editLogin.Color := clWhite;
end;

procedure TfrmLogin.editSenhaEnter(Sender: TObject);
begin
editSenha.Color := clSkyBlue;
end;

procedure TfrmLogin.editSenhaExit(Sender: TObject);
begin
editSenha.Color := clWhite;
end;

procedure TfrmLogin.btn1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
Application.Terminate;
tbl_Usuario.Active := false;
tbl_Usuario.Close;
end;

procedure TfrmLogin.editTipoEnter(Sender: TObject);
begin
editTipo.Color := clSkyBlue;
end;

procedure TfrmLogin.editTipoExit(Sender: TObject);
begin
editTipo.Color := clWhite;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
data, datafinal : String;
begin



  tbl_Usuario.Active := true;
  tbl_Usuario.Filtered := true;
  tbl_Usuario.Filter := 'Nome_Usuario = '+Quotedstr(editLogin.Text+'*');

  if tbl_Usuario.FieldByName('Nome_Usuario').Value = null then
  begin
  MessageDlg('Não há usúario cadastrados no sistema, entre em contato com o suporte!',MtError,[mbok],0);
  exit;
  end;

  data := DateToStr(now);
  datafinal := '15/06/2030';

  AtualizarData;

  if StrToDate(data) >= StrToDate(datafinal) then
  begin
  MessageDlg('Esse sistema é um sistema para teste free para 30 dias, por favor contate o suporte! ligue para Wellington Miranda (15)99687-9862.',MtInformation,[mbok],0);
  Application.Terminate;
  exit;
  end;

  nome := tbl_usuario.FieldByName('Nome_Usuario').AsString;
  senha := tbl_usuario.FieldByName('Senha_Usuario').AsString;
  tipo := tbl_Usuario.FieldByName('Tipo_Usuario').AsString;
  bloqueio := tbl_Usuario.FieldByName('Bloqueio_Usuario').AsString;

  if (Trim(editLogin.Text) = '') and (editSenha.Text = '') then
  begin
  MessageDlg('Campos Vazios!',MtWarning,[mbok],0);
  LimparCampos;
  exit;
  end;
  if (editLogin.Text <> nome) or ( editSenha.Text <> senha) or (editTipo.Text <> tipo)then
  begin
  MessageDlg('Dados Incorretos, verifique!',MtWarning,[mbok],0);
  LimparCampos;
  exit;
  end;

  if (editLogin.Text = nome) and (editSenha.Text = senha) and (editTipo.Text = tipo) then
  begin
    if bloqueio = 'S' then
  begin
  MessageDlg('Usuário bloqueado pelo sistema!, contate o administrador!',MtError,[mbok],0);
  LimparCampos;
  exit;
  end;

  if FileExists(ExtractFilePath(Application.ExeName)+'Dados\Backup do '+nome+'.zip') then
  begin
    Descompactar;
  end else
    CriarNovo;
  end;

  MessageDlg('Bem vindo ao sistema!',MtInformation,[mbok],0);
  nomecompleto := tbl_Usuario.FieldByName('Nome_Completo_Usuario').Value;
  frmLogin.Hide;
  frmPrincipal.Show;



end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
editLogin.Clear;
editSenha.Clear;
editLogin.SetFocus;
ChamarAjustes;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
begin
if messageDlg('Deseja sair da aplicação?',mtConfirmation,[mbyes,mbno],0)=mryes then
Application.Terminate;
end else
abort;

end;

procedure TfrmLogin.btnCloseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Application.Terminate;
end;

procedure TfrmLogin.LimparCampos;
begin
editLogin.Clear;
editSenha.Clear;
editTipo.Text := 'ADM';
editLogin.SetFocus;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
tbl_Usuario.Active := false;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
tbl_Usuario.Active := true;
tbl_Ajustes.Active := true;
ArquivoIni;

end;

procedure TfrmLogin.ArquivoIni;
Begin
end;

procedure TfrmLogin.Descompactar;
begin

ZipMaster1.ZipFileName := ExtractFilePath(Application.ExeName)+'Dados\Backup do '+nome+'.zip';
ZipMaster1.ExtrBaseDir := ExtractFilePath(Application.ExeName)+'Dados\';
ZipMaster1.Extract;

if FileExists(ExtractFilePath(Application.ExeName)+'Dados\tbl_Usuario.db') then
begin
ShowMessage('Dados carregados com sucesso');
end else
ShowMessage('Não deu certo!');
end;

procedure TfrmLogin.CriarNovo;
begin

ZipMaster1.ZipFileName := ExtractFilePath(Application.ExeName)+'Dados\Backup do.zip';
ZipMaster1.ExtrBaseDir := ExtractFilePath(Application.ExeName)+'Dados\';
ZipMaster1.Extract;

if FileExists(ExtractFilePath(Application.ExeName)+'Dados\tbl_Usuario.db') then
begin
ShowMessage('Dados carregados com sucesso');
end else
ShowMessage('Não deu certo!');
end;

procedure TfrmLogin.AtualizarData;
var
SNTPClient : TIdSNTP;
internet : DWord;
begin
  if InternetGetConnectedState(@internet,0)then
  begin
SNTPClient := TIdSNTP.Create(nil);
  try
    SNTPClient.Host := 'pool.ntp.org';
    SNTPClient.SyncTime;
  finally
    SNTPClient.Free;
  end;
  end
  else
  begin
  MessageDlg('Sem conexão!  verifique e tente  novamente!',mtWarning,[mbok],0);
  Application.Terminate;
  exit;
  end;
end;

procedure TfrmLogin.ChamarAjustes;
begin
 with tbl_Ajustes do
  begin
    FiltrarCor;
  if tbl_Ajustes.FieldByName('Ajustes_AJuste').Value = null then
  begin
    Panel1.Color := 16752448;
    Panel2.Color := 16752448;
    tbl_Ajustes.Edit;
    tbl_Ajustes.FieldByName('Ajustes_AJuste').Value := 16752448;
    tbl_Ajustes.FieldByName('Ajustes_AJuste').Value := 16752448;
    tbl_Ajustes.Post;
  end;

  cor := tbl_Ajustes.FieldByName('Ajustes_AJuste').Value;

  Panel1.Color := cor;
  Panel2.Color := cor;

  end;

end;

procedure TfrmLogin.FiltrarCor;
begin
 with tbl_Ajustes do
  begin
    Filtered := false;
    Filter := 'Cod_Ajuste = 6';
    Filtered := true;
  end;
end;

end.
