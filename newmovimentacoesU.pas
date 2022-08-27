unit newmovimentacoesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, DBTables, Grids,
  DBGrids;

type
  Tfrm_NewMovimentacao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    editData: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    editDocumento: TEdit;
    editHistorico: TEdit;
    rbDebito: TRadioButton;
    rbCredito: TRadioButton;
    EditValor: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    btnAdicionar: TSpeedButton;
    cbPlanoContas: TComboBox;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    StatusBar1: TStatusBar;
    TabSheet2: TTabSheet;
    editMovimento: TDateTimePicker;
    tbl_Plano: TTable;
    tbl_PlanoCod_PlanoContas: TIntegerField;
    tbl_PlanoDescricao_PlanoContas: TStringField;
    tbl_PlanoSequencia_PlanoContas: TStringField;
    tbl_PlanoTipo_PlanoContas: TStringField;
    tbl_PlanoCategoria_PlanoContas: TStringField;
    tbl_PlanoAtivo_PlanoContas: TStringField;
    tbl_Movimentacoes: TTable;
    tbl_MovimentacoesCod_Movimentacao: TAutoIncField;
    tbl_MovimentacoesId_Movimentacao: TIntegerField;
    tbl_MovimentacoesData_Movimentacao: TDateField;
    tbl_MovimentacoesHistorico_Movimentacao: TStringField;
    tbl_MovimentacoesDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesConciliado_Movimentacao: TStringField;
    tbl_MovimentacoesData_FinalMovimentacao: TDateField;
    tbl_MovimentacoesExtrato_Movimentacao: TGraphicField;
    tbl_MovimentacoesDocumento_Movimentacao: TStringField;
    tbl_MovimentacoesPlanoConta_Movimentacao: TStringField;
    Label7: TLabel;
    editDataMov: TDateTimePicker;
    Label8: TLabel;
    editDocumentacao: TEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    editContaSaida: TEdit;
    editContaEntrada: TEdit;
    btnadcEntrada: TSpeedButton;
    StatusBar2: TStatusBar;
    btnSalvar2: TSpeedButton;
    btnCancelar2: TSpeedButton;
    Label10: TLabel;
    editValorMov: TEdit;
    tbl_Transferencia: TTable;
    tbl_ContasCorrentes: TTable;
    tbl_TransferenciaCod_Transferencia: TAutoIncField;
    tbl_TransferenciaData_Transferencia: TDateField;
    tbl_TransferenciaValor_Transferencia: TCurrencyField;
    tbl_TransferenciaDest_Transferencia: TStringField;
    tbl_TransferenciaReceb_Transferencia: TStringField;
    tbl_TransferenciaDocumento_Transferencia: TStringField;
    tbl_Planos: TTable;
    tbl_PlanosCod_Planos: TAutoIncField;
    tbl_PlanosDescricao_Planos: TStringField;
    tbl_PlanosDoc_Planos: TStringField;
    tbl_PlanosValor_Planos: TCurrencyField;
    tbl_PlanosData_Planos: TDateField;
    tbl_PlanosTipo_Planos: TStringField;
    tbl_PlanosId_PlanoContas: TIntegerField;
    tbl_PlanoValorTotal_PlanoContas: TCurrencyField;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    tbl_PlanosId_Movimentacao: TIntegerField;
    tbl_MovimentacoesId_PlanoContas: TIntegerField;
    tbl_Planosid_ContaCorrente: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure rbDebitoClick(Sender: TObject);
    procedure rbCreditoClick(Sender: TObject);
    procedure editMovimentoEnter(Sender: TObject);
    procedure editDataEnter(Sender: TObject);
    procedure editDocumentoEnter(Sender: TObject);
    procedure editHistoricoEnter(Sender: TObject);
    procedure EditValorEnter(Sender: TObject);
    procedure cbPlanoContasEnter(Sender: TObject);
    procedure editMovimentoExit(Sender: TObject);
    procedure editDataExit(Sender: TObject);
    procedure editDocumentoExit(Sender: TObject);
    procedure editHistoricoExit(Sender: TObject);
    procedure EditValorExit(Sender: TObject);
    procedure cbPlanoContasExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditValorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure editValorMovClick(Sender: TObject);
    procedure editValorMovEnter(Sender: TObject);
    procedure editValorMovExit(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnSalvar2Click(Sender: TObject);
    procedure btnadcSaidaClick(Sender: TObject);
    procedure btnadcEntradaClick(Sender: TObject);
    procedure editDocumentacaoEnter(Sender: TObject);
    procedure editContaSaidaEnter(Sender: TObject);
    procedure editContaEntradaEnter(Sender: TObject);
    procedure editDocumentacaoExit(Sender: TObject);
    procedure editContaSaidaExit(Sender: TObject);
    procedure editContaEntradaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
  private
    procedure AtualizarData;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure CarregarPlanos;
    procedure Gravar;
    procedure Inserir;
    procedure EditarEntrada;
    procedure SaidaMov;
    procedure EntradaMov;
    procedure Transferencia;
    procedure SalvarPlanoContas;
  public
    id : String;
    valor : Real;
    id_mov : Integer;
  end;

var
  frm_NewMovimentacao: Tfrm_NewMovimentacao;

implementation

uses planodecontasU, movimentacoesU, vendasU, contacorrenteU, ajustesU,
  loginU;

{$R *.dfm}

procedure Tfrm_NewMovimentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_NewMovimentacao.btnCancelarClick(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_NewMovimentacao.rbDebitoClick(Sender: TObject);
begin
rbCredito.Checked := false;
end;

procedure Tfrm_NewMovimentacao.rbCreditoClick(Sender: TObject);
begin
rbDebito.Checked := false;
end;

procedure Tfrm_NewMovimentacao.editMovimentoEnter(Sender: TObject);
begin
editMovimento.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editDataEnter(Sender: TObject);
begin
editData.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editDocumentoEnter(Sender: TObject);
begin
editDocumento.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editHistoricoEnter(Sender: TObject);
begin
editHistorico.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.EditValorEnter(Sender: TObject);
begin
editValor.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.cbPlanoContasEnter(Sender: TObject);
begin
cbPlanoContas.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editMovimentoExit(Sender: TObject);
begin
editMovimento.Color := clWhite;
end;

procedure Tfrm_NewMovimentacao.editDataExit(Sender: TObject);
begin
editData.Color := clWhite;
end;

procedure Tfrm_NewMovimentacao.editDocumentoExit(Sender: TObject);
begin
editDocumento.Color := clWhite;
end;

procedure Tfrm_NewMovimentacao.editHistoricoExit(Sender: TObject);
begin
editHistorico.Color := clWhite;
end;

procedure Tfrm_NewMovimentacao.EditValorExit(Sender: TObject);
begin
editValor.Color := clWhite;

if (editValor.Text <> 'R$ 0,00')and(editValor.Text <> '')then
begin
valor := StrToFloat(editValor.Text);
editValor.Text := FormatFloat('R$ ,,,,0.00',valor);
end else
if (editValor.Text = '')then
begin
editValor.Text := 'R$ 0,00';
end;

end;

procedure Tfrm_NewMovimentacao.cbPlanoContasExit(Sender: TObject);
var
descricao : String;
begin
cbPlanoContas.Color := clWhite;
if cbPlanoContas.Text <> '' then
descricao := Trim(cbPlanoContas.Text);
cbPlanoContas.Text := descricao;
end;

procedure Tfrm_NewMovimentacao.btnAdicionarClick(Sender: TObject);
begin
frm_PlanoContas := Tfrm_PlanoContas.Create(Self);
frm_PlanoContas.ShowModal;
try
finally
frm_PlanoContas.Free;
frm_PlanoContas := nil;
end;
end;

procedure Tfrm_NewMovimentacao.FormCreate(Sender: TObject);
begin
if edit = 3 then
begin
PageControl1.TabIndex := 1;
editContaSaida.Text := frm_Movimentacao.cbPesquisa.Text;
PageControl1.Pages[0].Enabled := false;
end else
if edit < 3 then
begin
PageControl1.TabIndex := 0;
PageControl1.Pages[1].Enabled := false;
end;
AtualizarData;
AbrirTabelas;
Inserir;
CarregarPlanos;
If edit = 2 then
begin
EditarEntrada;
end;


end;

procedure Tfrm_NewMovimentacao.AtualizarData;
begin
editData.Date := date;
editMovimento.Date := date;
editDataMov.Date := date;
end;

procedure Tfrm_NewMovimentacao.EditValorClick(Sender: TObject);
begin
editValor.Clear;
end;

procedure Tfrm_NewMovimentacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_NewMovimentacao.AbrirTabelas;
begin
tbl_Plano.Active := true;
tbl_Movimentacoes.Active := true;
tbl_Transferencia.Active := true;
tbl_ContasCorrentes.Active := true;
tbl_Planos.Active := true;
end;

procedure Tfrm_NewMovimentacao.FecharTabelas;
begin
tbl_Plano.Active := false;
tbl_Movimentacoes.Active := false;
tbl_Transferencia.Active := false;
tbl_Planos.Active := false;
tbl_ContasCorrentes.Active := false;
end;

procedure Tfrm_NewMovimentacao.CarregarPlanos;
begin
With tbl_Plano do
begin

tbl_Plano.Active := false;
tbl_Plano.Active := true;

if not isEmpty then
begin
  while not Eof do
  begin
  cbPlanoContas.Items.Add(FieldByName('Descricao_PlanoContas').AsString);
  Next;
  end;
end;
end;
end;

procedure Tfrm_NewMovimentacao.btnSalvarClick(Sender: TObject);
begin
if (rbDebito.Checked = false) and (rbCredito.Checked = false) then
begin
MessageDlg('Escolha uma op��o para D�bito ou Cr�dito antes de continuar',MtInformation,[mbok],0);
exit;
end;

Gravar;
tbl_Movimentacoes.Post;
id_mov := tbl_Movimentacoes.FieldByName('Cod_Movimentacao').Value;

SalvarPlanoContas;

self.Close;
frm_Movimentacao.tbl_Movimentacoes.Refresh;
frm_Movimentacao.btnAbrir.Click;
end;

procedure Tfrm_NewMovimentacao.Gravar;
var
idplan : Integer;
begin
with tbl_Plano do
begin
Filtered := false;
Filter := 'Descricao_PlanoContas = '+Quotedstr('       '+cbPlanoContas.Text+'*');
Filtered := true;
if RecordCount>0 then
begin
idplan := FieldByName('Cod_PlanoContas').Value;
end else
ShowMessage('Plano de Contas n�o encontrado!');
end;

tbl_Movimentacoes.FieldByName('Id_Movimentacao').Value := frm_Movimentacao.tbl_ContasCorrentes.FieldByName('Cod_ContaCorrente').Value;
tbl_Movimentacoes.FieldByName('Data_Movimentacao').Value := editMovimento.Date;
tbl_Movimentacoes.FieldByName('Data_FinalMovimentacao').Value := editData.Date;
tbl_Movimentacoes.FieldByName('Historico_Movimentacao').Value := editHistorico.Text;
tbl_Movimentacoes.FieldByName('Documento_Movimentacao').Value := editDocumento.Text;
tbl_Movimentacoes.FieldByName('PlanoConta_Movimentacao').Value := cbPlanoContas.Text;
tbl_Movimentacoes.FieldByName('Id_PlanoContas').Value := idplan;

if rbDebito.Checked = true then
begin
tbl_Movimentacoes.FieldByName('Debito_Movimentacao').Value := editValor.Text;
tbl_Movimentacoes.FieldByName('Credito_Movimentacao').Value := null;
end else
if rbCredito.Checked = true then
begin
tbl_Movimentacoes.FieldByName('Credito_Movimentacao').Value := editValor.Text;
tbl_Movimentacoes.FieldByName('Debito_Movimentacao').Value := null;
end;
tbl_Movimentacoes.FieldByName('Conciliado_Movimentacao').Value := 'N�O';
end;

procedure Tfrm_NewMovimentacao.Inserir;
begin
if edit = 1 then
begin
tbl_Movimentacoes.Insert;
end;
end;

procedure Tfrm_NewMovimentacao.EditarEntrada;
var
codigo : Integer;
debito, credito : String;
resultado : Real;
begin


   codigo := frm_Movimentacao.tbl_Movimentacoes.FieldByName('Cod_Movimentacao').AsInteger;

   tbl_Movimentacoes.Locate('Cod_Movimentacao',codigo,[]);

   debito := (tbl_Movimentacoes.FieldByName('Debito_Movimentacao').AsString);
   credito :=(tbl_Movimentacoes.FieldByName('Credito_Movimentacao').AsString);


   tbl_Movimentacoes.Edit;
   editMovimento.Date := tbl_Movimentacoes.FieldByName('Data_Movimentacao').Value;
   editData.Date := tbl_Movimentacoes.FieldByName('Data_FinalMovimentacao').Value;
   editDocumento.Text := tbl_Movimentacoes.FieldByName('Documento_Movimentacao').AsString;
   editHistorico.Text := tbl_Movimentacoes.FieldByName('Historico_Movimentacao').AsString;
   cbPlanoContas.Text := tbl_Movimentacoes.FieldByName('PlanoConta_Movimentacao').AsString;

   if debito <> '' then
   begin
   rbDebito.Checked := true;
   resultado := StrToFloat(debito);
   editValor.Text := FormatFloat('R$ ,,,,0.00',resultado);
   end else
   if credito <> '' then
   begin
   rbCredito.Checked := true;
   resultado := StrToFloat(credito);
   editValor.Text := FormatFloat('R$ ,,,,0.00',resultado);
   end;

  end;
procedure Tfrm_NewMovimentacao.editValorMovClick(Sender: TObject);
begin
editValorMov.Clear;
end;

procedure Tfrm_NewMovimentacao.editValorMovEnter(Sender: TObject);
begin
editValorMov.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editValorMovExit(Sender: TObject);
begin
editValorMov.Color := clWhite;

if (editValorMov.Text <> 'R$ 0,00')and(editValorMov.Text <> '')then
begin
valor := StrToFloat(editValorMov.Text);
editValorMov.Text := FormatFloat('R$ ,,,,0.00',valor);
end else
if (editValorMov.Text = '')then
begin
editValorMov.Text := 'R$ 0,00';
end;
end;

procedure Tfrm_NewMovimentacao.btnCancelar2Click(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_NewMovimentacao.btnSalvar2Click(Sender: TObject);
begin
if editValorMov.Text = 'R$ 0,00' then
begin
MessageDlg('Valor inv�lido!',MtWarning,[mbok],0);
exit;
end;
if editContaEntrada.Text = '' then
begin
MessageDlg('Campos v�zios, por favor verif�que!',MtWarning,[mbok],0);
exit;
end;

if MessageDlg('Deseja realmente fazer uma tr�nsferencia para a conta '+ editContaEntrada.Text+'?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
with tbl_Plano do
begin
Filtered := false;
Filter := 'Descricao_PlanoContas = '+Quotedstr('       TRANSFERENCIA');
Filtered := true;
end;

SaidaMov;
EntradaMov;
Transferencia;
MessageDlg('Transfer�ncia para conta '+editContaEntrada.Text+' realizada com sucesso!',MtInformation,[mbok],0);
frm_Movimentacao.tbl_Movimentacoes.Refresh;
frm_Movimentacao.btnAbrir.Click;
Self.Close;
end else
abort;
end;

procedure Tfrm_NewMovimentacao.btnadcSaidaClick(Sender: TObject);
begin
frm_ContaCorrentes := Tfrm_ContaCorrentes.Create(Self);
frm_ContaCorrentes.ShowModal;
try
finally
frm_ContaCorrentes.Free;
frm_ContaCorrentes := nil;
end;
end;

procedure Tfrm_NewMovimentacao.btnadcEntradaClick(Sender: TObject);
begin
frm_ContaCorrentes := Tfrm_ContaCorrentes.Create(Self);
frm_ContaCorrentes.ShowModal;
try
finally
frm_ContaCorrentes.Free;
frm_ContaCorrentes := nil;
end;
end;

procedure Tfrm_NewMovimentacao.editDocumentacaoEnter(Sender: TObject);
begin
editDocumentacao.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editContaSaidaEnter(Sender: TObject);
begin
editContaSaida.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editContaEntradaEnter(Sender: TObject);
begin
editContaEntrada.Color := clSkyBlue;
end;

procedure Tfrm_NewMovimentacao.editDocumentacaoExit(Sender: TObject);
begin
editDocumentacao.Color := clWhite;
end;

procedure Tfrm_NewMovimentacao.editContaSaidaExit(Sender: TObject);
begin
editContaSaida.Color := clWhite;
end;

procedure Tfrm_NewMovimentacao.editContaEntradaExit(Sender: TObject);
begin
editContaEntrada.Color := clWhite;
end;

procedure Tfrm_NewMovimentacao.SaidaMov;
var
id : Integer;
begin
tbl_Movimentacoes.Append;
tbl_Movimentacoes.FieldByName('Data_Movimentacao').Value := editDataMov.Date;
tbl_Movimentacoes.FieldByName('Documento_Movimentacao').Value := editDocumentacao.Text;
tbl_Movimentacoes.FieldByName('Historico_Movimentacao').Value := 'TRANSFER�NCIA PARA A CONTA '+editContaEntrada.Text;
tbl_Movimentacoes.FieldByName('Debito_Movimentacao').Value := editValorMov.Text;
tbl_Movimentacoes.FieldByName('PlanoConta_Movimentacao').Value := 'TRANSF�RENCIAS';
tbl_Movimentacoes.FieldByName('Data_FinalMovimentacao').Value := now;
tbl_Movimentacoes.FieldByName('Id_Movimentacao').Value := IntToStr(frm_Movimentacao.codigo);
tbl_Movimentacoes.Post;
end;


procedure Tfrm_NewMovimentacao.EntradaMov;
begin


tbl_Movimentacoes.Filtered := false;
tbl_Movimentacoes.Filter := 'id_Movimentacao = '+Quotedstr(id);
tbl_Movimentacoes.Filtered := true;

id := tbl_Movimentacoes.FieldByName('Id_Movimentacao').AsString;

tbl_Movimentacoes.Append;
tbl_Movimentacoes.FieldByName('Data_Movimentacao').Value := editDataMov.Date;
tbl_Movimentacoes.FieldByName('Documento_Movimentacao').Value := editDocumentacao.Text;
tbl_Movimentacoes.FieldByName('Historico_Movimentacao').Value := 'RECEBIMENTO DE CONTA / '+editContaSaida.Text;
tbl_Movimentacoes.FieldByName('Credito_Movimentacao').Value := editValorMov.Text;
tbl_Movimentacoes.FieldByName('PlanoConta_Movimentacao').Value := 'RECEBIMENTO TRANSF�RENCIAS';
tbl_Movimentacoes.FieldByName('Data_FinalMovimentacao').Value := now;
tbl_Movimentacoes.FieldByName('Id_Movimentacao').Value := StrToInt(id);
tbl_Movimentacoes.Post;



end;

procedure Tfrm_NewMovimentacao.BitBtn1Click(Sender: TObject);
begin
showmessage(FloatToStr(valor));
end;

procedure Tfrm_NewMovimentacao.Transferencia;
begin
tbl_Transferencia.Append;
tbl_Transferencia.FieldByName('Data_Transferencia').Value := editDataMov.Date;
tbl_Transferencia.FieldByName('Valor_Transferencia').Value := editValorMov.Text;
tbl_Transferencia.FieldByName('Dest_Transferencia').Value := editContaEntrada.Text;
tbl_Transferencia.FieldByName('Receb_Transferencia').Value := editContaSaida.Text;
tbl_Transferencia.FieldByName('Documento_Transferencia').Value := editDocumentacao.Text;
tbl_Transferencia.Post;
end;

procedure Tfrm_NewMovimentacao.PageControl1DrawTab(
  Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect;
  Active: Boolean);
begin
with PageControl1.Canvas.Font do
begin
if Active then
begin
Style :=[fsBold];
end else
Style:=[];
end;
Canvas.TextRect(Rect, Rect.Left +3, Rect.Top +3, PageControl1.Pages[TabIndex].Caption);
end;

procedure Tfrm_NewMovimentacao.SalvarPlanoContas;
var
id : Integer;
begin
with tbl_Plano do
begin
Filtered := false;
Filter := 'Descricao_PlanoContas = '+Quotedstr('       '+cbPlanoContas.Text+'*');
Filtered := true;
id := FieldByName('Cod_PlanoContas').Value;
end;

if edit = 1 then
begin

with tbl_Planos do
begin
Insert;
tbl_Plano.edit;
tbl_Plano.FieldByName('ValorTotal_PlanoContas').AsFloat := tbl_Plano.FieldByName('ValorTotal_PlanoContas').AsFloat + valor;
tbl_Plano.Post;
with tbl_Planos do
begin
edit;
FieldByName('Id_Movimentacao').Value := id_mov;
FieldByName('Descricao_Planos').AsString := cbPlanoContas.Text;
FieldByName('Doc_Planos').AsString := editDocumento.Text;
FieldByName('Data_Planos').Value := editData.Date;
FieldByName('Id_PlanoContas').Value := id;
FieldByName('Valor_Planos').Value := valor;
FieldByName('id_ContaCorrente').Value := frm_Movimentacao.tbl_ContasCorrentes.FieldByName('Cod_ContaCorrente').Value;
if rbDebito.Checked = true then
begin
FieldByName('Tipo_Planos').AsString := 'D';
end else
if rbCredito.Checked = true then
begin
FieldByname('Tipo_Planos').AsString := 'R';
end;

tbl_Planos.Post;
end;
end;
end else
if edit = 2 then
begin
with tbl_Planos do
begin
edit;
FieldByName('Descricao_Planos').AsString := editHistorico.Text;
FieldByName('Doc_Planos').AsString := editDocumento.Text;
FieldByName('Data_Planos').Value := editData.Date;
FieldByName('Id_PlanoContas').Value := id;
FieldByName('Valor_Planos').Value := valor;
if rbDebito.Checked = true then
begin
FieldByName('Tipo_Planos').AsString := 'D';
end else
if rbCredito.Checked = true then
begin
FieldByname('Tipo_Planos').AsString := 'R';
end;

tbl_Planos.Post;
end;
end;
end;

end.
