unit editreceberU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons, DBCtrls, DB,
  DBTables;

type
  Tfrm_EditReceber = class(TForm)
    editDocumento: TLabeledEdit;
    editData: TLabeledEdit;
    editParc: TEdit;
    Label1: TLabel;
    EditVencimento: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    cbCliente: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cbPlano: TComboBox;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Label6: TLabel;
    Panel1: TPanel;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel2: TPanel;
    editValor: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tbl_Clientes: TTable;
    tbl_ClientesCod_Cliente: TIntegerField;
    tbl_ClientesNome_Cliente: TStringField;
    tbl_ClientesEndereco_Cliente: TStringField;
    tbl_ClientesBairro_Cliente: TStringField;
    tbl_ClientesCidade_Cliente: TStringField;
    tbl_ClientesUF_Cliente: TStringField;
    tbl_ClientesTelefone_Cliente: TStringField;
    tbl_ClientesCelular_Cliente: TStringField;
    tbl_ClientesEmpresa_Cliente: TStringField;
    tbl_ClientesRG_Cliente: TStringField;
    tbl_ClientesCPF_Cliente: TStringField;
    tbl_ClientesData_Cad: TDateField;
    tbl_ClientesPrivilegio_Cliente: TStringField;
    tbl_ContasReceber: TTable;
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
    DBNavigator1: TDBNavigator;
    ds_ContasReceber: TDataSource;
    tbl_PlanoContas: TTable;
    tbl_PlanoContasCod_PlanoContas: TIntegerField;
    tbl_PlanoContasDescricao_PlanoContas: TStringField;
    tbl_PlanoContasSequencia_PlanoContas: TStringField;
    tbl_PlanoContasTipo_PlanoContas: TStringField;
    tbl_PlanoContasCategoria_PlanoContas: TStringField;
    tbl_PlanoContasAtivo_PlanoContas: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure editValorKeyPress(Sender: TObject; var Key: Char);
    procedure editParcKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editValorClick(Sender: TObject);
    procedure editValorExit(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure editDocumentoEnter(Sender: TObject);
    procedure editDocumentoExit(Sender: TObject);
    procedure editParcEnter(Sender: TObject);
    procedure editParcExit(Sender: TObject);
    procedure cbClienteEnter(Sender: TObject);
    procedure cbClienteExit(Sender: TObject);
    procedure cbPlanoEnter(Sender: TObject);
    procedure cbPlanoExit(Sender: TObject);
    procedure editValorEnter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EditVencimentoChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    procedure AtualizarData;
    procedure CarregarClientes;
    procedure CarregarPlanoContas;
    procedure TratarBotoes;
    procedure FecharTabelas;
    procedure AbrirTabelas;
    procedure EditarRegistro;
    procedure DeletarRegistro;
    procedure NovoRegistro;
    procedure LimparCampos;
    procedure GravarRegistro;
    procedure FormularParcela;
    procedure AjustarValor;
  public
    { Public declarations }
  end;

var
  frm_EditReceber: Tfrm_EditReceber;

implementation

uses clientesU, planodecontasU, contasreceber, vendasU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_EditReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_EditReceber.btnSairClick(Sender: TObject);
begin
tbl_ContasReceber.Cancel;
edit := 0;
Self.Close;
end;

procedure Tfrm_EditReceber.editValorKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then
key :=#0;
end;

procedure Tfrm_EditReceber.editParcKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8]) then
key :=#0;
end;

procedure Tfrm_EditReceber.SpeedButton1Click(Sender: TObject);
begin
frm_Clientes := Tfrm_Clientes.Create(Self);
frm_Clientes.ShowModal;
try
finally
frm_Clientes.Free;
frm_Clientes := nil;
end;
end;

procedure Tfrm_EditReceber.FormCreate(Sender: TObject);
begin
AtualizarData;
CarregarClientes;
CarregarPlanoContas;
TratarBotoes;
AbrirTabelas;

if edit = 0 then
begin
NovoRegistro;
end;

if edit = 1 then
begin
EditarRegistro;
tbl_ContasReceber.Locate('Cod_ContasReceber', IntToStr(frm_ContasReceber.tbl_ContasReceber.FieldByName('Cod_ContasReceber').AsInteger),[]);
EditarRegistro;
end;
end;

procedure Tfrm_EditReceber.AtualizarData;
begin
editData.Text := DateToStr(date);
editVencimento.Date := date;
end;

procedure Tfrm_EditReceber.CarregarClientes;
begin
with tbl_Clientes do
begin
  Active := false;
  Active := true;

  if not isEmpty then
while not Eof do
    begin
      cbCliente.Items.Add(tbl_Clientes.FieldByName('Nome_Cliente').AsString);
      Next;
    end;
  end;
end;

procedure Tfrm_EditReceber.TratarBotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure Tfrm_EditReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_EditReceber.FecharTabelas;
begin
tbl_Clientes.Active := false;
tbl_ContasReceber.Active := false;
tbl_PlanoContas.Active := false;
end;

procedure Tfrm_EditReceber.AbrirTabelas;
begin
tbl_Clientes.Active := true;
tbl_ContasReceber.Active := true;
tbl_PlanoContas.Active := true;
end;

procedure Tfrm_EditReceber.editValorClick(Sender: TObject);
begin
editValor.Clear;
end;

procedure Tfrm_EditReceber.editValorExit(Sender: TObject);
begin
if editValor.Text = '' then
begin
editValor.Text := '0,00';
end;
editValor.Color := clWhite;

FormularParcela;
end;

procedure Tfrm_EditReceber.Memo1Enter(Sender: TObject);
begin
Memo1.Color := clSkyBlue;
end;

procedure Tfrm_EditReceber.Memo1Exit(Sender: TObject);
begin
Memo1.Color := $00AEFFFF;
end;

procedure Tfrm_EditReceber.editDocumentoEnter(Sender: TObject);
begin
editDocumento.Color := clSkyBlue;
end;

procedure Tfrm_EditReceber.editDocumentoExit(Sender: TObject);
begin
editDocumento.Color := clWhite;
end;

procedure Tfrm_EditReceber.editParcEnter(Sender: TObject);
begin
editParc.Color := clSkyBlue;
end;

procedure Tfrm_EditReceber.editParcExit(Sender: TObject);
begin
editParc.Color := clWhite;
FormularParcela;
end;

procedure Tfrm_EditReceber.cbClienteEnter(Sender: TObject);
begin
cbCliente.Color := clSkyBlue;
end;

procedure Tfrm_EditReceber.cbClienteExit(Sender: TObject);
begin
cbCliente.Color := clWhite;
end;

procedure Tfrm_EditReceber.cbPlanoEnter(Sender: TObject);
begin
cbPlano.Color := clSkyBlue;
end;

procedure Tfrm_EditReceber.cbPlanoExit(Sender: TObject);
begin
cbPlano.Color := clWhite;
end;

procedure Tfrm_EditReceber.editValorEnter(Sender: TObject);
begin
editValor.Color := clSkyBlue;
end;

procedure Tfrm_EditReceber.SpeedButton2Click(Sender: TObject);
begin
frm_PlanoContas := Tfrm_PlanoContas.Create(Self);
frm_PlanoContas.ShowModal;
try
finally
frm_PlanoContas.Free;
frm_PlanoContas := nil;
end;
end;

procedure Tfrm_EditReceber.EditVencimentoChange(Sender: TObject);
begin
if editVencimento.Date <> date then
begin
editVencimento.Font.Color := clBlue;
editVencimento.Font.Style := [fsBold];
end
end;

procedure Tfrm_EditReceber.btnEditarClick(Sender: TObject);
begin
if MessageDlg('Deseja fazer a edição do registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
if tbl_ContasReceber.RecordCount > 0 then
begin
TratarBotoes;
EditarRegistro;
end else
MessageDlg('Não a registros a serem editados!',MtWarning,[mbok],0);
end else
abort;
end;

procedure Tfrm_EditReceber.EditarRegistro;
var
valor : real;
begin
if (tbl_ContasReceber.RecordCount >0) then
begin
tbl_ContasReceber.Edit;
editDocumento.Text := tbl_ContasReceber.FieldByName('Num_DocContasReceber').Value;
editParc.Text := tbl_ContasReceber.FieldByName('Qtd_ParcContasReceber').Value;
editData.Text := tbl_ContasReceber.FieldByName('Data_ContasReceber').Value;
editVencimento.Date := tbl_ContasReceber.FieldByName('Data_VencContasReceber').Value;
cbCliente.Text := tbl_ContasReceber.FieldByName('Cliente_ContasReceber').Value;
cbPlano.Text := tbl_ContasReceber.FieldByName('Tipo_ReceitaContasReceber').Value;
valor := tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value;
editValor.Text := FormatFloat('R$ ,,,,0.00',valor);
Memo1.Text := tbl_ContasReceber.FieldByName('Obs_ContasReceber').AsString;
editDocumento.Enabled := false;
editParc.Enabled := false;
end;

end;

procedure Tfrm_EditReceber.btnCancelarClick(Sender: TObject);
begin
TratarBotoes;
tbl_ContasReceber.Cancel;
LimparCampos;
end;

procedure Tfrm_EditReceber.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
EditarRegistro;
end;

procedure Tfrm_EditReceber.btnDeletarClick(Sender: TObject);
begin
DeletarRegistro;
end;

procedure Tfrm_EditReceber.DeletarRegistro;
begin
if cbCliente.Text = '' then
begin
MessageDlg('Nenhum registro foi selecionado, por favor clique em editar!',MtInformation,[mbok],0);
exit;

end;
if MessageDlg('Deseja deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
if tbl_ContasReceber.RecordCount > 0 then
begin
TratarBotoes;
tbl_ContasReceber.Delete;
end else
MessageDlg('Não a registros a serem deletados!',MtWarning,[mbok],0);
end else
abort;
end;

procedure Tfrm_EditReceber.btnNovoClick(Sender: TObject);
begin
if MessageDlg('Deseja criar um novo registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
NovoRegistro;
LimparCampos;
TratarBotoes;
end else
abort;
end;

procedure Tfrm_EditReceber.NovoRegistro;
var
prox : Integer;
begin

tbl_ContasReceber.Last;
if tbl_ContasReceber.RecordCount = 0 then
begin
prox := 1;
end else
begin
prox := tbl_ContasReceber.FieldByName('Cod_ContasReceber').AsInteger + 1;
end;
tbl_ContasReceber.Append;
tbl_ContasReceber.FieldByName('Cod_ContasReceber').AsInteger := prox;

end;

procedure Tfrm_EditReceber.LimparCampos;
begin
editDocumento.Clear;
editParc.Clear;
editData.Text := DateToStr(date);
cbCliente.Text := '';
cbPlano.Text := '';
editValor.Text := '0,00';
Memo1.Clear;
editDocumento.SetFocus;
end;

procedure Tfrm_EditReceber.btnGravarClick(Sender: TObject);
begin
GravarRegistro;
frm_ContasReceber.Hide;
frm_ContasReceber.Show;
frm_ContasReceber.editConsulta.SetFocus;
end;

procedure Tfrm_EditReceber.GravarRegistro;
var
parcela, documento, nota : String;
begin

if (editValor.Text = '0,00')or(editValor.Text = '')then
begin
MessageDlg('Valor R$ invalido, por favor verifíque!',MtWarning,[mbok],0);
exit;
end;


if (editDocumento.Text = '')or(editParc.Text = '')or(cbCliente.Text = '')or(cbPlano.Text = '')then
begin
MessageDlg('Campos vázios, por favor verifíque!',MtWarning,[mbok],0);
exit;
end;

parcela := editParc.Text;
documento := editDocumento.Text;
nota := documento+'/'+parcela;

if tbl_ContasReceber.FieldByName('Qtd_ParcContasReceber').Value = null then
begin
tbl_ContasReceber.FieldByName('Num_DocContasReceber').Value := nota;
end;
tbl_ContasReceber.FieldByName('Qtd_ParcContasReceber').Value := editParc.Text;
tbl_ContasReceber.FieldByName('Data_ContasReceber').Value := editData.Text;
tbl_ContasReceber.FieldByName('Data_VencContasReceber').Value := editVencimento.Date;
tbl_ContasReceber.FieldByName('Cliente_ContasReceber').Value := cbCliente.Text;
tbl_ContasReceber.FieldByName('Tipo_ReceitaContasReceber').Value := Trim(cbPlano.Text);
tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value := editValor.Text;
if tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value = null then
begin
tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value := editValor.Text;
end;
if tbl_ContasReceber.FieldByName('Recebido_ContasReceber').AsFloat = 0 then
begin
tbl_ContasReceber.FieldByName('Recebido_ContasReceber').AsFloat := 0;
end;
if Memo1.Text <> '' then
begin
tbl_ContasReceber.FieldByName('Obs_ContasReceber').Value := Memo1.Text;
end;
AjustarValor;
tbl_ContasReceber.Post;
MessageDlg('Registro salvo com sucesso!',MtInformation,[mbok],0);
Self.Close;
end;

procedure Tfrm_EditReceber.CarregarPlanoContas;
begin
with tbl_PlanoContas do
begin
  Active := false;
  Active := true;

  if not isEmpty then
while not Eof do
    begin
      cbPlano.Items.Add(tbl_PlanoContas.FieldByName('Descricao_PlanoContas').Value);
      Next;
    end;
  end;
end;



procedure Tfrm_EditReceber.FormularParcela;
var
parcela, valor : Real;
cliente, texto, pretexto : String;
begin

if (editParc.Text <> '')and(cbCliente.Text <> '')and(editValor.Text <> 'R$ 00,00')then
begin
parcela := StrToFloat(editParc.Text);
cliente := cbCliente.Text;
valor := StrToFloat(editValor.Text);
valor := valor / parcela;

pretexto := 'O Cliente '+cliente+' ira pagar '+FloatToStr(parcela)+'x de '+FormatFloat('R$ ,,,,0.00',valor);
Memo1.Lines.Delete(0);
texto := Memo1.Text;
Memo1.Clear;

Memo1.Lines.Add(pretexto);
Memo1.Lines.Add(texto);

end;
end;

procedure Tfrm_EditReceber.AjustarValor;
var
valor, falta, recebido : Real;
begin
valor := tbl_ContasReceber.FieldByName('Valor_ContasReceber').Value;
recebido := tbl_ContasReceber.FieldByName('Recebido_ContasReceber').Value;
falta := valor - recebido;

tbl_ContasReceber.FieldByName('Falta_ContasReceber').Value := falta;

end;

procedure Tfrm_EditReceber.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  Panel2.Color := cor - 30;
end;

end.
