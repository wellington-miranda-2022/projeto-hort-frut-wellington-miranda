unit newcontaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, ComCtrls;

type
  Tfrm_NewBanco = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    StatusBar1: TStatusBar;
    ds_Contas: TDataSource;
    tbl_Contas: TTable;
    tbl_ContasId_Conta: TAutoIncField;
    tbl_ContasDescricao_Conta: TStringField;
    tbl_ContasCodigo_Conta: TStringField;
    tbl_ContasAtivo_Conta: TStringField;
    Label1: TLabel;
    editCodigo: TDBEdit;
    Label2: TLabel;
    editNome: TDBEdit;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    SpeedButton1: TSpeedButton;
    btnPesquisar: TSpeedButton;
    tbl_Bancos: TTable;
    tbl_BancosCod_Banco: TAutoIncField;
    tbl_BancosId_Banco: TStringField;
    tbl_BancosBanco_Banco: TStringField;
    procedure ds_ContasDataChange(Sender: TObject; Field: TField);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure editCodigoEnter(Sender: TObject);
    procedure editCodigoExit(Sender: TObject);
    procedure editNomeEnter(Sender: TObject);
    procedure editNomeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    procedure AtivarTabelas;
    procedure FecharTabelas;
    procedure Novo;
    procedure Editar;
    procedure FiltrarCodigo;
    public
    { Public declarations }
  end;

var
  frm_NewBanco: Tfrm_NewBanco;

implementation

uses vendasU, contasU, consultabancosU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_NewBanco.ds_ContasDataChange(Sender: TObject; Field: TField);
begin
if ds_Contas.State in [dsInsert, dsEdit] then
begin
btnGravar.Enabled := true;
end else
btnGravar.Enabled := false;
end;

procedure Tfrm_NewBanco.btnCancelarClick(Sender: TObject);
begin
tbl_Contas.Cancel;
Self.Close;
end;

procedure Tfrm_NewBanco.FormCreate(Sender: TObject);
begin
AtivarTabelas;
Novo;
Editar;
end;

procedure Tfrm_NewBanco.AtivarTabelas;
begin
tbl_Contas.Active := true;
tbl_Bancos.Active := true;
end;

procedure Tfrm_NewBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_NewBanco.FecharTabelas;
begin
tbl_Contas.Active := false;
tbl_Bancos.Active := false;
end;

procedure Tfrm_NewBanco.Novo;
begin
if edit = 1 then
begin
tbl_Contas.Insert;
end;
end;

procedure Tfrm_NewBanco.Editar;
begin
if edit = 2 then
begin
tbl_Contas.Locate('Id_Conta',frm_Contas.tbl_Contas.FieldByName('Id_Conta').Value,[]);
tbl_Contas.Edit;
end;
end;

procedure Tfrm_NewBanco.btnGravarClick(Sender: TObject);
begin
tbl_Contas.Post;
MessageDlg('Registro salvo com sucesso!',MtInformation,[mbok],0);
Self.Close;
frm_Contas.tbl_Contas.Refresh;
end;

procedure Tfrm_NewBanco.editCodigoEnter(Sender: TObject);
begin
editCodigo.Color := clSkyBlue;
end;

procedure Tfrm_NewBanco.editCodigoExit(Sender: TObject);
begin
editCodigo.Color := clWhite;
end;

procedure Tfrm_NewBanco.editNomeEnter(Sender: TObject);
begin
editNome.Color := clSkyBlue;
end;

procedure Tfrm_NewBanco.editNomeExit(Sender: TObject);
begin
editNome.Color := clWhite;
end;

procedure Tfrm_NewBanco.SpeedButton1Click(Sender: TObject);
begin
frm_ConsultaBancos := Tfrm_ConsultaBancos.Create(Self);
frm_ConsultaBancos.ShowModal;
try
finally
frm_ConsultaBancos.Free;
frm_ConsultaBancos := nil;
end;
end;

procedure Tfrm_NewBanco.FiltrarCodigo;
var
banco, codigo : String;
begin
codigo := editCodigo.Text;

tbl_Bancos.Filtered := false;
tbl_Bancos.Filter := 'Id_Banco = '+Quotedstr(codigo);
tbl_Bancos.Filtered := true;

banco := tbl_Bancos.FieldByName('Banco_Banco').AsString;
editNome.Text := banco ;


end;

procedure Tfrm_NewBanco.btnPesquisarClick(Sender: TObject);
begin
FiltrarCodigo;
end;



procedure Tfrm_NewBanco.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
	 begin
     btnPesquisar.Click;
	 end;
  end;

procedure Tfrm_NewBanco.FormShow(Sender: TObject);
begin
  GroupBox1.Color := cor;
 
end;

end.
