unit Fbackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ZipMstr,
  jpeg, ExtCtrls, FileCtrl;

type
  TfrmBackup = class(TForm)
    btnBackup: TBitBtn;
    CheckBox1: TCheckBox;
    ZipMaster1: TZipMaster;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    editNome: TEdit;
    StatusBar1: TStatusBar;
    cbHabilitar: TCheckBox;
    GroupBox2: TGroupBox;
    editLocal: TEdit;
    btnLocal: TButton;
    Button1: TButton;
    procedure btnBackupClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbHabilitarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLocalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure procura;
  public
   diretorio : String;
   function SelectADirectory(Title : string) : string;
  end;
var
  frmBackup: TfrmBackup;

implementation




uses Math,
  principalU,
  ajustesU,
  loginU;

{$R *.dfm}

procedure TFrmBackup.Procura;
var
  Procurar : TSearchRec;
  Arquivos: Integer;
begin
  Arquivos := 0;
  Arquivos := Arquivos + faDirectory;
  Arquivos := Arquivos + faArchive;
  Arquivos := Arquivos + faAnyFile;

    if FindFirst(ExtractFilePath(Application.ExeName)+'\*.*', Arquivos, Procurar) = 0 then
    begin
      repeat
        if (Procurar.Attr and Arquivos) = Procurar.Attr then
          If ((Pos('.exe', Procurar.Name)=0) and (Pos('.HLP', Procurar.Name)=0)and
              (Pos('.cnt', Procurar.Name)=0) and (Pos('.dll', Procurar.Name)=0)and
              (Pos('.bin', Procurar.Name)=0)) Then
          Begin
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Ajustes.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Avarias.db');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_VendTotal.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Vendas.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Usuario.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Transferencia.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Produto.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Planos.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_PlanoContas.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_PedTotal.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Pedido.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Movimentacao.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Local.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Fornecedores.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasReceber.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasPagar.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasLancamento.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasDetalhes.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContaCorrente.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContaBanco.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_CompTotal.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Compras.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Cliente.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Cidade.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Bancos.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Baixa.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Avarias.db');
          End;
      until FindNext(Procurar) <> 0;
      FindClose(Procurar);
    end;
end;


procedure TfrmBackup.btnBackupClick(Sender: TObject);
begin
  btnBackup.Enabled:=False;
  btnBackup.Caption := 'AGUARDE...';
  Image1.Visible := True;
  GroupBox1.Visible := false;
  if cbHabilitar.Checked = false then
  begin
  ZipMaster1.ZipFileName:=ExtractFilePath(Application.ExeName)+'Dados\'+'Backup do '+EditNome.Text+'.zip';
  end else
  if (cbHabilitar.Checked = true)and(Trim(editLocal.Text) <> '') then
  begin
  ZipMaster1.ZipFileName:= diretorio+'Backup do '+EditNome.Text+'.zip';
  end else
  begin
  MessageDlg('Escolha um caminho para o backup!',MtInformation,[mbok],0);
  Image1.Visible := false;
  exit;
  end;
  ZipMaster1.FSpecArgs.Clear;
  Procura;
  ZipMaster1.Add;

  If CheckBox1.Checked=True Then
    CopyFile(PChar(ExtractFilePath(Application.ExeName)+'Backup'+FormatDateTime('ddmmyyyy', Date)+'.zip'), PChar('A:\Backup'+FormatDateTime('ddmmyyyy', Date)+'.zip'), true);

  If ZipMaster1.SuccessCnt >= 1 then
    MessageDlg('Backup realizado com sucesso!', mtInformation, [mbOk],0)

  Else
    MessageDlg('Erro ao fazer o Backup. Tente novamente!', mtError, [mbOk],0);
  Image1.Visible:=False;
  btnBackup.Enabled:=True;
  btnBackup.Caption := 'Fazer Backup';
  GroupBox1.Visible := true;
end;

procedure TfrmBackup.Button1Click(Sender: TObject);
begin
ShowMessage(diretorio+'Backup do '+EditNome.Text+'.zip');
end;

procedure TfrmBackup.cbHabilitarClick(Sender: TObject);
begin
if cbHabilitar.Checked = true then
begin
GroupBox2.Visible := true;
cbHabilitar.Font.Color := clGray;
editLocal.Enabled := true;
btnLocal.Enabled := true;
editLocal.Color := clGray;
editLocal.ReadOnly := true;

end else
if cbHabilitar.Checked = false then
begin
GroupBox2.Visible := False;
cbHabilitar.Font.Color := clBlue;

end;
end;

procedure TfrmBackup.FormCreate(Sender: TObject);
begin
 editNome.Text := nome;
 GroupBox2.Visible := false;
end;

procedure TfrmBackup.btnLocalClick(Sender: TObject);
begin
editLocal.Color := clWhite;
editLocal.Text := SelectADirectory('Selecione uma pasta');
diretorio := editLocal.Text;

end;


function TfrmBackup.SelectADirectory(Title: string): string;
var
  Pasta : String;
begin
  SelectDirectory(Title, '', Pasta);

  if (Trim(Pasta) <> '') then
    if (Pasta[Length(Pasta)] <> '\') then
      Pasta := Pasta + '\';

  Result := Pasta;
  end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  GroupBox1.Color := cor;
  GroupBox2.Color := cor - 30;
end;

end.
