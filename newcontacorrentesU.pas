unit newcontacorrentesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, ComCtrls, Buttons;

type
  Tfrm_NewContaCorrentes = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    StatusBar1: TStatusBar;
    ds_ContasCorrentes: TDataSource;
    tbl_ContasCorrentes: TTable;
    tbl_Contas: TTable;
    tbl_ContasCorrentesCod_ContaCorrente: TAutoIncField;
    tbl_ContasCorrentesDescricao_ContaCorrente: TStringField;
    tbl_ContasCorrentesAgencia_ContaCorrente: TStringField;
    tbl_ContasCorrentesBanco_ContaCorrente: TStringField;
    tbl_ContasCorrentesAtivo_ContaCorrente: TStringField;
    tbl_ContasCorrentesId_Conta: TIntegerField;
    editAgencia: TDBEdit;
    editConta: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    tbl_ContasId_Conta: TAutoIncField;
    tbl_ContasDescricao_Conta: TStringField;
    tbl_ContasCodigo_Conta: TStringField;
    tbl_ContasAtivo_Conta: TStringField;
    ds_Conta: TDataSource;
    cbBanco: TComboBox;
    editDescricao: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    editSaldo: TEdit;
    tbl_Movimentacao: TTable;
    tbl_MovimentacaoCod_Movimentacao: TAutoIncField;
    tbl_MovimentacaoId_Movimentacao: TIntegerField;
    tbl_MovimentacaoData_Movimentacao: TDateField;
    tbl_MovimentacaoHistorico_Movimentacao: TStringField;
    tbl_MovimentacaoDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoConciliado_Movimentacao: TStringField;
    tbl_MovimentacaoExtrato_Movimentacao: TGraphicField;
    Button1: TButton;
    tbl_ContasCorrentesConta_ContaCorrente: TStringField;
    tbl_ContasCorrentesSaldo_ContaCorrente: TCurrencyField;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure editSaldoExit(Sender: TObject);
    procedure editSaldoClick(Sender: TObject);
    procedure editAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure editContaKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure editAgenciaEnter(Sender: TObject);
    procedure editContaEnter(Sender: TObject);
    procedure editDescricaoEnter(Sender: TObject);
    procedure cbBancoEnter(Sender: TObject);
    procedure editSaldoEnter(Sender: TObject);
    procedure editAgenciaExit(Sender: TObject);
    procedure editContaExit(Sender: TObject);
    procedure editDescricaoExit(Sender: TObject);
    procedure cbBancoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FecharTabelas;
    procedure AbrirTabelas;
    procedure CarregarBancos;
    procedure Gravar;
    procedure AdicionarSaldo;
    procedure Novo;
    procedure FiltrarConta;
    procedure Editar;

    public
    { Public declarations }
  end;

var
  frm_NewContaCorrentes: Tfrm_NewContaCorrentes;

implementation

uses consultabancosU, contacorrenteU, vendasU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_NewContaCorrentes.btnSairClick(Sender: TObject);
begin
self.Close;
end;

procedure Tfrm_NewContaCorrentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_NewContaCorrentes.FormCreate(Sender: TObject);
begin
AbrirTabelas;
CarregarBancos;
Novo;
Editar;
end;

procedure Tfrm_NewContaCorrentes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_NewContaCorrentes.btnCancelarClick(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_NewContaCorrentes.FecharTabelas;
begin
tbl_ContasCorrentes.Active := false;
tbl_Contas.Active := false;
tbl_Movimentacao.Active := false;
end;

procedure Tfrm_NewContaCorrentes.AbrirTabelas;
begin
tbl_ContasCorrentes.Active := true;
tbl_Contas.Active := true;
tbl_Movimentacao.Active := true;
end;

procedure Tfrm_NewContaCorrentes.CarregarBancos;
begin
  With tbl_Contas do
  begin
  tbl_Contas.Active := false;
  tbl_Contas.Active := true;

    if not isEmpty then
      begin
      While not Eof do
      begin
        cbBanco.Items.Add(FieldByName('Descricao_Conta').AsString);
        Next;
      end;
    end

  end;
end;

procedure Tfrm_NewContaCorrentes.SpeedButton1Click(Sender: TObject);
begin
frm_ConsultaBancos := Tfrm_ConsultaBancos.Create(Self);
frm_ConsultaBancos.ShowModal;
try
finally
frm_ConsultaBancos.Free;
frm_ConsultaBancos := nil;
end;
end;

procedure Tfrm_NewContaCorrentes.editSaldoExit(Sender: TObject);
var
saldo : Real;
begin
editSaldo.Color := clWhite;
if (editSaldo.Text <> '')and(editSaldo.Text <>'R$ 0,00') then
begin
saldo := StrToFloat(editSaldo.Text);
end;
editSaldo.Text := FormatFloat('R$ ,,,,0.00',saldo);

end;

procedure Tfrm_NewContaCorrentes.editSaldoClick(Sender: TObject);
begin
editSaldo.Clear;
end;

procedure Tfrm_NewContaCorrentes.editAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in['0'..'9',#8,'-','.'])then
Key := #0;
end;

procedure Tfrm_NewContaCorrentes.editContaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in['0'..'9',#8,'-','.'])then
Key := #0;
end;

procedure Tfrm_NewContaCorrentes.btnGravarClick(Sender: TObject);
begin
if (editSaldo.Text = '')or(editSaldo.Text = 'R$ 0,00') then
begin
MessageDlg('Coloque um valor inicial para saldo da nova conta!',MtWarning,[mbok],0);
exit;
end;

if (cbBanco.Text = '')or(editDescricao.Text = '') then
begin
MessageDlg('Campos vázios, por favor verífique!',MtWarning,[mbok],0);
exit;
end;



FiltrarConta;
Gravar;

if edit = 2 then
begin
tbl_Movimentacao.Edit;
AdicionarSaldo;
end;

if edit <> 2 then
begin
tbl_Movimentacao.Insert;
AdicionarSaldo;
end;

tbl_Movimentacao.Post;

MessageDlg('Registro Salvo com Sucesso!',MtInformation,[mbok],0);

Self.Close;
frm_ContaCorrentes.tbl_ContasCorrentes.Refresh;
end;

procedure Tfrm_NewContaCorrentes.editAgenciaEnter(Sender: TObject);
begin
editAgencia.Color := clSkyBlue;
end;

procedure Tfrm_NewContaCorrentes.editContaEnter(Sender: TObject);
begin
editConta.Color := clSkyBlue;
end;

procedure Tfrm_NewContaCorrentes.editDescricaoEnter(Sender: TObject);
begin
editDescricao.Color := clSkyBlue;
end;

procedure Tfrm_NewContaCorrentes.cbBancoEnter(Sender: TObject);
begin
cbBanco.Color := clSkyBlue;
end;

procedure Tfrm_NewContaCorrentes.editSaldoEnter(Sender: TObject);
begin
editSaldo.Color := clSkyBlue;
end;

procedure Tfrm_NewContaCorrentes.editAgenciaExit(Sender: TObject);
begin
editAgencia.Color := clWhite;
end;

procedure Tfrm_NewContaCorrentes.editContaExit(Sender: TObject);
begin
editConta.Color := clWhite;
end;

procedure Tfrm_NewContaCorrentes.editDescricaoExit(Sender: TObject);
begin
editDescricao.Color := clWhite;
end;

procedure Tfrm_NewContaCorrentes.cbBancoExit(Sender: TObject);
begin
cbBanco.Color := clWhite;
end;

procedure Tfrm_NewContaCorrentes.Gravar;
begin
tbl_ContasCorrentes.Edit;
tbl_ContasCorrentes.FieldByName('Descricao_ContaCorrente').Value := editDescricao.Text;
tbl_ContasCorrentes.FieldByName('Banco_ContaCorrente').Value := cbBanco.Text;
tbl_ContasCorrentes.FieldByName('Id_Conta').Value := tbl_Contas.FieldByName('Id_Conta').Value;
tbl_ContasCorrentes.FieldByName('Saldo_ContaCorrente').Value := editSaldo.Text;
tbl_ContasCorrentes.Post;
end;

procedure Tfrm_NewContaCorrentes.AdicionarSaldo;
begin
tbl_Movimentacao.FieldByName('Id_Movimentacao').Value := tbl_ContasCorrentes.FieldByName('Cod_ContaCorrente').Value;
tbl_Movimentacao.FieldByName('Data_Movimentacao').Value := now;
tbl_Movimentacao.FieldByName('Historico_Movimentacao').Value := 'Saldo Inicial';
tbl_Movimentacao.FieldByName('Credito_Movimentacao').Value := editSaldo.Text;
end;

procedure Tfrm_NewContaCorrentes.Novo;
begin
if edit = 1 then
begin
tbl_ContasCorrentes.Insert;
end;
end;

procedure Tfrm_NewContaCorrentes.FiltrarConta;
var
nome, banco : String;
begin

banco := cbBanco.Text;

tbl_Contas.Filtered := false;
tbl_Contas.Filter := 'Descricao_Conta = '+Quotedstr(banco+'*');
tbl_Contas.Filtered := true;

nome := tbl_Contas.FieldByName('Descricao_Conta').AsString;

if nome = '' then
begin
MessageDlg('Conta / Banco inexistente, crie um antes de criar uma conta corrente!',MtWarning,[mbok],0);
end;

end;

procedure Tfrm_NewContaCorrentes.Button1Click(Sender: TObject);
begin
FiltrarConta;
end;

procedure Tfrm_NewContaCorrentes.Editar;
var
codigo : Integer;
begin
if edit = 2 then
begin
codigo := frm_ContaCorrentes.tbl_ContasCorrentes.FieldByName('Cod_ContaCorrente').AsInteger;

tbl_ContasCorrentes.Edit;
tbl_ContasCorrentes.Locate('Cod_ContaCorrente',codigo,[]);
cbBanco.Text := tbl_ContasCorrentes.FieldByName('Banco_ContaCorrente').Value;
editDescricao.Text := tbl_ContasCorrentes.FieldByName('Descricao_ContaCorrente').Value;
editSaldo.Text := FormatFloat('R$ ,,,,0.00',tbl_ContasCorrentes.FieldByName('Saldo_ContaCorrente').Value);
end;
end;

procedure Tfrm_NewContaCorrentes.FormShow(Sender: TObject);
begin
  GroupBox1.Color := cor;
  GroupBox2.Color := cor - 30;
end;

end.
