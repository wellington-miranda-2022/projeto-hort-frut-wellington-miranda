unit baixareceberU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Buttons, DB, DBTables,
  Grids, DBGrids, Mask;

type
  Tfrm_BaixaReceber = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    btnGravar: TBitBtn;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    editDocumento: TLabeledEdit;
    Label1: TLabel;
    cbTipoPag: TComboBox;
    Label2: TLabel;
    editContaCorrente: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    editSaldo: TEdit;
    editJuros: TEdit;
    editVariacao: TEdit;
    EditDesconto: TEdit;
    editRecebimento: TEdit;
    EditValor: TEdit;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    cbData: TDateTimePicker;
    tbl_Baixa: TTable;
    tbl_BaixaCod_Baixa: TIntegerField;
    tbl_BaixaDoc_Baixa: TStringField;
    tbl_BaixaTipo_PagBaixa: TStringField;
    tbl_BaixaConta_CorrenteBaixa: TStringField;
    tbl_BaixaJuros_Baixa: TCurrencyField;
    tbl_BaixaVariacao_Baixa: TCurrencyField;
    tbl_BaixaDesconto_Baixa: TCurrencyField;
    tbl_BaixaValor_Baixa: TCurrencyField;
    tbl_BaixaRecebimento_Baixa: TCurrencyField;
    tbl_BaixaObs_Baixa: TStringField;
    tbl_BaixaSaldo_Baixo: TCurrencyField;
    tbl_BaixaId_ContasReceber: TIntegerField;
    tbl_BaixaData_Baixa: TDateField;
    tbl_ContasReceber: TTable;
    Bevel3: TBevel;
    DBGrid1: TDBGrid;
    ds_Baixa: TDataSource;
    tbl_ContasReceberCod_ContasReceber: TIntegerField;
    tbl_ContasReceberCliente_ContasReceber: TStringField;
    tbl_ContasReceberNum_DocContasReceber: TStringField;
    tbl_ContasReceberQtd_ParcContasReceber: TIntegerField;
    tbl_ContasReceberValor_ContasReceber: TCurrencyField;
    tbl_ContasReceberData_ContasReceber: TDateField;
    tbl_ContasReceberData_VencContasReceber: TDateField;
    tbl_ContasReceberTipo_ReceitaContasReceber: TStringField;
    tbl_ContasReceberQuitado_ContasReceber: TDateField;
    tbl_ContasReceberFalta_ContasReceber: TCurrencyField;
    tbl_ContasReceberRecebido_ContasReceber: TCurrencyField;
    tbl_ContasReceberObs_ContasReceber: TStringField;
    tbl_Filtro: TTable;
    tbl_FiltroCod_Baixa: TIntegerField;
    tbl_FiltroDoc_Baixa: TStringField;
    tbl_FiltroTipo_PagBaixa: TStringField;
    tbl_FiltroConta_CorrenteBaixa: TStringField;
    tbl_FiltroJuros_Baixa: TCurrencyField;
    tbl_FiltroVariacao_Baixa: TCurrencyField;
    tbl_FiltroDesconto_Baixa: TCurrencyField;
    tbl_FiltroValor_Baixa: TCurrencyField;
    tbl_FiltroRecebimento_Baixa: TCurrencyField;
    tbl_FiltroObs_Baixa: TStringField;
    tbl_FiltroSaldo_Baixo: TCurrencyField;
    tbl_FiltroId_ContasReceber: TIntegerField;
    tbl_FiltroData_Baixa: TDateField;
    ds_Filtro: TDataSource;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    editTotalBaixa: TMaskEdit;
    BitBtn1: TBitBtn;
    GroupBox4: TGroupBox;
    Memo2: TMemo;
    Label11: TLabel;
    lblNome: TLabel;
    SpeedButton2: TSpeedButton;
    lblAtraso: TLabel;
    tbl_Cliente: TTable;
    btnDeletar: TBitBtn;
    tbl_Movimentacao: TTable;
    tbl_PlanoConta: TTable;
    tbl_Planos: TTable;
    tbl_ContaCorrente: TTable;
    tbl_MovimentacaoCod_Movimentacao: TAutoIncField;
    tbl_MovimentacaoId_Movimentacao: TIntegerField;
    tbl_MovimentacaoData_Movimentacao: TDateField;
    tbl_MovimentacaoHistorico_Movimentacao: TStringField;
    tbl_MovimentacaoDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacaoConciliado_Movimentacao: TStringField;
    tbl_MovimentacaoData_FinalMovimentacao: TDateField;
    tbl_MovimentacaoExtrato_Movimentacao: TGraphicField;
    tbl_MovimentacaoDocumento_Movimentacao: TStringField;
    tbl_MovimentacaoPlanoConta_Movimentacao: TStringField;
    tbl_MovimentacaoFoto_Movimentacao: TStringField;
    tbl_MovimentacaoId_PlanoContas: TIntegerField;
    tbl_PlanoContaCod_PlanoContas: TIntegerField;
    tbl_PlanoContaDescricao_PlanoContas: TStringField;
    tbl_PlanoContaSequencia_PlanoContas: TStringField;
    tbl_PlanoContaTipo_PlanoContas: TStringField;
    tbl_PlanoContaCategoria_PlanoContas: TStringField;
    tbl_PlanoContaAtivo_PlanoContas: TStringField;
    tbl_PlanoContaValorTotal_PlanoContas: TCurrencyField;
    tbl_PlanosCod_Planos: TAutoIncField;
    tbl_PlanosDescricao_Planos: TStringField;
    tbl_PlanosDoc_Planos: TStringField;
    tbl_PlanosValor_Planos: TCurrencyField;
    tbl_PlanosData_Planos: TDateField;
    tbl_PlanosDataVenc_Planos: TDateField;
    tbl_PlanosTipo_Planos: TStringField;
    tbl_PlanosId_PlanoContas: TIntegerField;
    tbl_PlanosId_Movimentacao: TIntegerField;
    tbl_Planosid_ContaCorrente: TIntegerField;
    tbl_ContaCorrenteCod_ContaCorrente: TAutoIncField;
    tbl_ContaCorrenteDescricao_ContaCorrente: TStringField;
    tbl_ContaCorrenteAgencia_ContaCorrente: TStringField;
    tbl_ContaCorrenteBanco_ContaCorrente: TStringField;
    tbl_ContaCorrenteAtivo_ContaCorrente: TStringField;
    tbl_ContaCorrenteId_Conta: TIntegerField;
    tbl_ContaCorrenteConta_ContaCorrente: TStringField;
    tbl_ContaCorrenteSaldo_ContaCorrente: TCurrencyField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure editDocumentoEnter(Sender: TObject);
    procedure editContaCorrenteEnter(Sender: TObject);
    procedure cbTipoPagEnter(Sender: TObject);
    procedure editRecebimentoEnter(Sender: TObject);
    procedure editRecebimentoExit(Sender: TObject);
    procedure EditDescontoEnter(Sender: TObject);
    procedure editVariacaoEnter(Sender: TObject);
    procedure editJurosEnter(Sender: TObject);
    procedure editDocumentoExit(Sender: TObject);
    procedure editContaCorrenteExit(Sender: TObject);
    procedure cbTipoPagExit(Sender: TObject);
    procedure editJurosExit(Sender: TObject);
    procedure editVariacaoExit(Sender: TObject);
    procedure EditDescontoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure editRecebimentoClick(Sender: TObject);
    procedure editJurosClick(Sender: TObject);
    procedure editVariacaoClick(Sender: TObject);
    procedure EditDescontoClick(Sender: TObject);
    procedure editJurosKeyPress(Sender: TObject; var Key: Char);
    procedure editVariacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure editRecebimentoKeyPress(Sender: TObject; var Key: Char);
    procedure btnGravarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AtivarTabelas;
    procedure FecharTabelas;
    procedure PrepararData;
    procedure ReceberInformacoes;
    procedure Calcular;
    procedure Incrementar;
    procedure GravarDados;
    procedure SomarGrid;
    procedure FiltrarBaixa;
    procedure Sair;
    procedure VerificarAtraso;
    procedure DeletarLancamentos;
    procedure RecalcularSaldoRecebido;
    procedure LancarMovimentacao;
   public
    desconto, variacao, juros, saldo, valor, recebimento, somar : Real;
  end;

var
  frm_BaixaReceber: Tfrm_BaixaReceber;

implementation

uses contasreceber, vendasU, insertqtdU, principalU, clientesU,
  contabancoU, contacorrenteU, loginU;

{$R *.dfm}

procedure Tfrm_BaixaReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_BaixaReceber.btnSairClick(Sender: TObject);
begin
Self.Close;
tbl_ContasReceber.Cancel;
tbl_Baixa.Cancel;
end;

procedure Tfrm_BaixaReceber.Memo1Enter(Sender: TObject);
begin
Memo1.Color := $00AEFFFF;
end;

procedure Tfrm_BaixaReceber.Memo1Exit(Sender: TObject);
begin
Memo1.Color := clSkyBlue;
end;

procedure Tfrm_BaixaReceber.editDocumentoEnter(Sender: TObject);
begin
editDocumento.Color := $00AEFFFF;
end;

procedure Tfrm_BaixaReceber.editContaCorrenteEnter(Sender: TObject);
begin
editContaCorrente.Color := $00AEFFFF;
end;

procedure Tfrm_BaixaReceber.cbTipoPagEnter(Sender: TObject);
begin
cbTipoPag.Color := $00AEFFFF;
end;

procedure Tfrm_BaixaReceber.editRecebimentoEnter(Sender: TObject);
begin
editRecebimento.Color := clSkyBlue;
end;

procedure Tfrm_BaixaReceber.editRecebimentoExit(Sender: TObject);
var
dinheiro : Real;
begin
if editRecebimento.Text <> ''then
begin
dinheiro := StrToFloat(editRecebimento.Text);
dinheiro := (dinheiro+juros+variacao)-desconto;
editRecebimento.Color := clWhite;
editRecebimento.Text := FormatFloat('R$ ,,,,.00',dinheiro);
end else
Calcular;


end;

procedure Tfrm_BaixaReceber.EditDescontoEnter(Sender: TObject);
begin
editDesconto.Color := $00AEFFFF;
end;

procedure Tfrm_BaixaReceber.editVariacaoEnter(Sender: TObject);
begin
editVariacao.Color := $00AEFFFF;
end;

procedure Tfrm_BaixaReceber.editJurosEnter(Sender: TObject);
begin
editJuros.Color := $00AEFFFF;
end;

procedure Tfrm_BaixaReceber.editDocumentoExit(Sender: TObject);
begin
editDocumento.Color := clWhite;
end;

procedure Tfrm_BaixaReceber.editContaCorrenteExit(Sender: TObject);
begin
editContaCorrente.Color := clWhite;
end;

procedure Tfrm_BaixaReceber.cbTipoPagExit(Sender: TObject);
begin
cbTipoPag.Color := clWhite;
end;

procedure Tfrm_BaixaReceber.editJurosExit(Sender: TObject);
var
num : Real;
begin
editJuros.Color := clWhite;
if (Length(editJuros.Text)=0) then
begin
editJuros.Text := '0,00';
end else
num := StrToFloat(editJuros.Text);
editJuros.Text := FormatFloat(',,,,0.00',num);
Calcular;
end;

procedure Tfrm_BaixaReceber.editVariacaoExit(Sender: TObject);
var
num : Real;
begin
editVariacao.Color := clWhite;
if Length(editVariacao.Text)=0 then
begin
editVariacao.Text := '0,00';
end else
num := StrToFloat(editVariacao.Text);
editVariacao.Text := FormatFloat(',,,,0.00',num);
Calcular;

end;

procedure Tfrm_BaixaReceber.EditDescontoExit(Sender: TObject);
var
num : Real;
begin
editDesconto.Color := clWhite;
if Length(editDesconto.Text)=0 then
begin
editDesconto.Text := '0,00';
end else
num := StrToFloat(editDesconto.Text);
editDesconto.Text := FormatFloat(',,,,0.00',num);
Calcular;
end;

procedure Tfrm_BaixaReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_BaixaReceber.AtivarTabelas;
begin
tbl_Baixa.Active := true;
tbl_ContasReceber.Active := true;
tbl_Filtro.Active := true;
tbl_Cliente.Active := true;
tbl_Movimentacao.Active := true;
tbl_PlanoConta.Active := true;
tbl_Planos.Active := true;
tbl_ContaCorrente.Active := true;
end;

procedure Tfrm_BaixaReceber.FormCreate(Sender: TObject);
begin
AtivarTabelas;
if tbl_ContasReceber.RecordCount >0 then
begin
PrepararData;
tbl_ContasReceber.Locate('Cod_ContasReceber', IntToStr(inserirqtd),[]);

SomarGrid;


Incrementar;
Calcular;
VerificarAtraso;
end;
end;

procedure Tfrm_BaixaReceber.FecharTabelas;
begin
tbl_Baixa.Active := false;
tbl_ContasReceber.Active := false;
tbl_Filtro.Active := false;
tbl_Cliente.Active := false;

tbl_Movimentacao.Active := false;
tbl_PlanoConta.Active := false;
tbl_Planos.Active := false;
tbl_ContaCorrente.Active := false;
end;

procedure Tfrm_BaixaReceber.PrepararData;
begin

end;

procedure Tfrm_BaixaReceber.ReceberInformacoes;
begin
lblNome.Caption := tbl_ContasReceber.FieldByName('Cliente_ContasReceber').Value;
saldo := tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value;
valor := tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value;
recebimento := tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value;

editSaldo.Text := FormatFloat('R$ ,,,,0.00',saldo);
editValor.Text := FormatFloat('R$ ,,,,0.00',valor);
editRecebimento.Text := FormatFloat('R$ ,,,,0.00',recebimento);
end;

procedure Tfrm_BaixaReceber.editRecebimentoClick(Sender: TObject);
begin
editRecebimento.Clear;
end;

procedure Tfrm_BaixaReceber.editJurosClick(Sender: TObject);
begin
if editJuros.Text = '0,00' then
begin
editJuros.Clear;
end;
end;

procedure Tfrm_BaixaReceber.editVariacaoClick(Sender: TObject);
begin
if editVariacao.Text = '0,00' then
begin
editVariacao.Clear;
end;
end;

procedure Tfrm_BaixaReceber.EditDescontoClick(Sender: TObject);
begin
if editDesconto.Text = '0,00' then
begin
editDesconto.Clear;
end;
end;

procedure Tfrm_BaixaReceber.Calcular;
begin
if (editJuros.text <>'')or(editVariacao.Text <> '')or(editDesconto.Text <> '') then
begin
receberInformacoes;
juros := StrToFloat(editJuros.Text);
variacao := StrToFloat(editVariacao.Text);
desconto := StrtoFloat(editDesconto.Text);
valor := saldo;
valor := (valor + variacao + juros) - desconto;
editValor.Text := FormatFloat('R$ ,,,,0.00',valor);
editRecebimento.Text := FormatFloat('R$ ,,,,.00',valor);
end;
end;

procedure Tfrm_BaixaReceber.editJurosKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_BaixaReceber.editVariacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_BaixaReceber.EditDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_BaixaReceber.editRecebimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_BaixaReceber.Incrementar;
var
prox : Integer;
begin
if ((tbl_Baixa.FieldByName('id_ContasReceber').Value <> tbl_ContasReceber.FieldByName('Cod_ContasReceber').Value))and((tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value = tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value)) then
begin
tbl_Filtro.Last;
prox := tbl_Filtro.FieldByName('Cod_Baixa').AsInteger + 1;
tbl_Filtro.Append;
tbl_Filtro.FieldByName('Cod_Baixa').AsInteger := prox;
PageControl1.TabIndex := 0;
cbdata.Date := date;
ReceberInformacoes;

end else

if tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value = 0 then
begin
PageControl1.TabIndex := 1;
btnGravar.Visible := false;
end;
editDocumento.Text := tbl_Baixa.FieldByName('Doc_Baixa').AsString;
editContaCorrente.Text := tbl_Baixa.FieldByName('Conta_CorrenteBaixa').AsString;
cbTipoPag.Text := tbl_Baixa.FieldByName('Tipo_PagBaixa').AsString;
editSaldo.Text := FormatFloat('R$ ,,,,.00',tbl_ContasReceber.FieldByName('Falta_ContasReceber').AsFloat);
editJuros.Text := FormatFloat(',,,,0.00',tbl_Baixa.FieldByName('Juros_Baixa').AsFloat);
editVariacao.Text := '0,00';
editDesconto.Text := '0,00';
editValor.Text := '0,00';
editRecebimento.Text := FormatFloat(',,,,.00',tbl_ContasReceber.FieldByName('Falta_ContasReceber').AsFloat);
Memo2.Text := tbl_Baixa.FieldByName('Obs_Baixa').AsString;
if (tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value > 0)and(tbl_ContasReceber.FieldByName('Recebido_ContasReceber').Value > 0) then
begin
tbl_Filtro.Last;
prox := tbl_Filtro.FieldByName('Cod_Baixa').AsInteger + 1;
tbl_Filtro.Append;
tbl_Filtro.FieldByName('Cod_Baixa').AsInteger := prox;
cbdata.Date := date;
PageControl1.TabIndex := 0;
end;
end;

procedure Tfrm_BaixaReceber.btnGravarClick(Sender: TObject);
begin
GravarDados;
LancarMovimentacao;
//LancarPlanoConta;
Sair;
end;

procedure Tfrm_BaixaReceber.GravarDados;
var
total, abate : Real;
begin
if (editDocumento.Text = '')or(editContaCorrente.Text = '')or(cbTipoPag.Text = '') then
begin
MessageDlg('Campos vázios, por favor verifíque!',MtWarning,[mbok],0);
abort;
exit;
end;

if tbl_Filtro.FieldByName('id_ContasReceber').Value <> tbl_ContasReceber.FieldByName('Cod_ContasReceber').Value then
begin
valor := tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value;
tbl_Filtro.FieldByName('Data_Baixa').Value := cbData.Date;
tbl_Filtro.FieldByName('Doc_Baixa').AsString := editDocumento.Text;
tbl_Filtro.FieldByName('Conta_CorrenteBaixa').Value := editContaCorrente.Text;
tbl_Filtro.FieldByName('Tipo_PagBaixa').Value := cbTipoPag.Text;
tbl_Filtro.FieldByName('Saldo_Baixo').Value := saldo;
tbl_Filtro.FieldByName('Juros_Baixa').Value := juros;
tbl_Filtro.FieldByName('Desconto_Baixa').Value := Desconto;
tbl_Filtro.FieldByName('Valor_Baixa').Value := valor;
tbl_Filtro.FieldByName('Recebimento_Baixa').Value := editRecebimento.Text;
tbl_Filtro.FieldByName('Obs_Baixa').Value := Memo1.Text;
tbl_Filtro.FieldByName('Id_ContasReceber').Value := tbl_ContasReceber.FieldByName('Cod_ContasReceber').Value;
tbl_Filtro.FieldByName('Variacao_Baixa').Value := variacao;
tbl_Filtro.Post;
tbl_ContasReceber.Edit;

SomarGrid;

tbl_ContasReceber.FieldByName('Recebido_ContasReceber').Value := somar;
total := tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value - somar;

abate:= StrToFloat(editDesconto.Text);

if total <=0 then
begin
tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value := 0;

end else

if total >0 then
begin
tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value := total-abate;
end;

if (somar >= tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value)then
begin
tbl_ContasReceber.FieldByName('Quitado_ContasReceber').Value := cbData.Date;
end;

tbl_ContasReceber.Post;

tbl_ContasReceber.Edit;
if (tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value = 0)then
begin
tbl_ContasReceber.FieldByName('Quitado_ContasReceber').Value := cbData.Date;
end;
tbl_ContasReceber.Post;
MessageDlg('Conta recebida com sucesso!',MtInformation,[mbok],0);
end
end;

procedure Tfrm_BaixaReceber.SomarGrid;
begin
FiltrarBaixa;
somar := 0;
with tbl_Baixa do
begin
tbl_Baixa.First;
while not tbl_Baixa.Eof do
begin
somar := (somar + tbl_Baixa.FieldByName('Recebimento_Baixa').AsFloat);
tbl_Baixa.Next;
end;
editTotalBaixa.Text := FormatFloat('R$ ,,,,.00',somar);
end;
end;

procedure Tfrm_BaixaReceber.FiltrarBaixa;
begin
if tbl_ContasReceber.RecordCount >0 then
begin
tbl_Baixa.Filtered := false;
tbl_Baixa.Filter := 'id_ContasReceber = '+Quotedstr(tbl_ContasReceber.FieldByName('Cod_ContasReceber').Value);
tbl_Baixa.Filtered := true;
end;
end;

procedure Tfrm_BaixaReceber.Button2Click(Sender: TObject);
begin
ShowMessage(tbl_Baixa.FieldByName('Cod_Baixa').Value);
end;

procedure Tfrm_BaixaReceber.Button3Click(Sender: TObject);
begin
ShowMessage(tbl_Filtro.FieldByName('Cod_Baixa').Value);
end;

procedure Tfrm_BaixaReceber.Sair;
begin
Self.Close;
frm_ContasReceber.Hide;
frm_ContasReceber.Show;
frm_ContasReceber.editConsulta.SetFocus;
end;

procedure Tfrm_BaixaReceber.DBGrid1CellClick(Column: TColumn);
begin
Memo2.Text := tbl_Baixa.FieldByName('Obs_Baixa').AsString;
end;

procedure Tfrm_BaixaReceber.Button1Click(Sender: TObject);
begin
showmessage(IntToStr(tbl_Baixa.RecordCount));
end;

procedure Tfrm_BaixaReceber.SpeedButton2Click(Sender: TObject);
var
cliente : String;
begin
cliente := lblNome.Caption;
tbl_Cliente.Filtered := false;
tbl_Cliente.Filter := 'Nome_Cliente ='+Quotedstr(cliente);
tbl_Cliente.Filtered := true;

if tbl_Cliente.FieldByName('Nome_Cliente').Value = null then
begin
if MessageDlg('Esse Cliente não está cadastrado, deseja cadastro-lo agora?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
frm_Clientes := Tfrm_Clientes.Create(Self);
frm_Clientes.ShowModal;
try
finally
frm_Clientes.Free;
frm_Clientes := nil;
end;
end else
abort;
end else
if tbl_Cliente.FieldByName('Nome_Cliente').Value <> null then
begin
frm_Clientes := Tfrm_Clientes.Create(Self);
frm_Clientes.ShowModal;
try
finally
frm_Clientes.Free;
frm_Clientes := nil;
end;
end;
end;

procedure Tfrm_BaixaReceber.SpeedButton1Click(Sender: TObject);
begin
frm_ContaCorrentes := Tfrm_ContaCorrentes.Create(Self);
frm_ContaCorrentes.ShowModal;
frm_ContaCorrentes.btnAdicionar.Visible := true;
frm_ContaCorrentes.btnAdicionar.Enabled := true;
try
finally
frm_ContaCorrentes.Free;
frm_ContaCorrentes := nil;
end;

end;

procedure Tfrm_BaixaReceber.VerificarAtraso;
var
hoje, vencimento : Tdate;
begin
hoje := date;
vencimento := tbl_ContasReceber.FieldByName('Data_VencContasReceber').Value;

if hoje > vencimento then
begin
lblAtraso.Visible := true;
end;
if tbl_ContasReceber.FieldByName('Recebido_ContasReceber').Value >= tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value then
begin
lblAtraso.Visible := false;
end;
end;

procedure Tfrm_BaixaReceber.PageControl1Change(Sender: TObject);
begin
if TabSheet2.PageControl.ActivePageIndex = 1 then
begin
btnDeletar.Visible := true;
if tbl_Baixa.RecordCount >0 then
begin
btnDeletar.Enabled := true;
end else
btnDeletar.Enabled := false;
end else
if TabSheet1.PageControl.ActivePageIndex = 0 then
begin
btnDeletar.Visible := false;
end;
end;

procedure Tfrm_BaixaReceber.btnDeletarClick(Sender: TObject);
begin
DeletarLancamentos;
end;

procedure Tfrm_BaixaReceber.DeletarLancamentos;
begin
if tbl_Baixa.RecordCount >0 then
begin
RecalcularSaldoRecebido;
tbl_Baixa.Delete;
frm_ContasReceber.tbl_ContasReceber.Refresh;
MessageDlg('Registro deletado com Sucesso!',MtConfirmation,[mbok],0);
end;
if tbl_Baixa.RecordCount = 0 then
begin
btnDeletar.Enabled := false;
end;

end;

procedure Tfrm_BaixaReceber.RecalcularSaldoRecebido;
begin
frm_ContasReceber.tbl_ContasReceber.edit;
frm_ContasReceber.tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value := frm_ContasReceber.tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value + tbl_Baixa.FieldByName('Recebimento_Baixa').Value;
frm_ContasReceber.tbl_ContasReceber.FieldByName('Recebido_ContasReceber').Value := frm_ContasReceber.tbl_ContasReceber.FieldByName('Recebido_ContasReceber').Value - tbl_Baixa.FieldByName('Recebimento_Baixa').Value;
frm_ContasReceber.tbl_ContasReceber.Post;

end;

procedure Tfrm_BaixaReceber.LancarMovimentacao;
var
id_cc, id_mov, id_pc : Integer;
planoconta : String;
begin
with tbl_ContaCorrente do
begin
Filtered := false;
Filter := 'Descricao_ContaCorrente = '+QuotedStr(editContaCorrente.Text);
Filtered := true;
if tbl_ContaCorrente.RecordCount >0 then
begin
id_cc := FieldByName('Cod_ContaCorrente').Value;
end;

  with tbl_PlanoConta do
  begin
  Filtered := false;
  Filter := 'Descricao_PlanoContas = '+QuotedStr('       '+frm_ContasReceber.tbl_ContasReceber.FieldByName('Tipo_ReceitaContasReceber').AsString);
  Filtered := true;
  if tbl_PlanoConta.RecordCount >0 then
  begin
  id_pc := FieldByName('Cod_PlanoContas').Value;
  planoconta := FieldByName('Descricao_PlanoContas').Value;
  end;

  with tbl_Movimentacao do
  begin
  insert;
  FieldByName('id_Movimentacao').Value := id_cc;
  FieldByName('Data_Movimentacao').Value := cbData.Date;
  FieldByName('Historico_Movimentacao').Value := 'RECEBIMENTO CLIENTE '+lblNome.Caption;
  FieldByName('Credito_Movimentacao').Value := editRecebimento.Text;
  FieldByName('Data_FinalMovimentacao').Value := now;
  FieldByName('Documento_Movimentacao').Value := editDocumento.Text;
  FieldByName('PlanoConta_Movimentacao').Value := trim(planoconta);
  FieldByName('id_PlanoContas').Value := id_pc;
  post;
  id_mov := FieldByName('Cod_Movimentacao').Value;
  end;
  with tbl_Planos do
  begin
  insert;
  FieldByName('Descricao_Planos').Value := Trim(planoconta);
  FieldByName('Doc_Planos').Value := editDocumento.Text;
  FieldByName('Valor_Planos').Value := editRecebimento.Text;
  FieldByName('Data_Planos').Value := cbData.Date;
  FieldByName('DataVenc_Planos').Value := tbl_ContasReceber.FieldByName('Data_VencContasReceber').Value;
  FieldByName('Tipo_Planos').Value := 'R';
  FieldByName('id_PlanoContas').Value := id_pc;
  FieldByName('id_Movimentacao').Value := id_mov;
  FieldByName('id_ContaCorrente').Value := id_cc;
  post;
  end;
  end;



end;

end;

procedure Tfrm_BaixaReceber.FormShow(Sender: TObject);
begin
Panel1.Color := cor;
  Panel2.Color := cor;
  GroupBox1.Color := cor - 30;
  GroupBox2.Color := cor;
  GroupBox3.Color := cor;
  GroupBox4.Color := cor - 30;
end;

end.
