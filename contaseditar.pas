unit contaseditar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB, DBTables,
  Buttons, ExtCtrls, ComCtrls;

type
  Tfrm_ContasEditar = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ds_ContasPagar: TDataSource;
    tbl_ContasPagar: TTable;
    tbl_ContasPagarCod_ContasPagar: TIntegerField;
    tbl_ContasPagarDescricao_ContasPagar: TStringField;
    tbl_ContasPagarValor_ContasPagar: TCurrencyField;
    tbl_ContasPagarData_ContasPagar: TDateField;
    tbl_ContasPagarData_VencContasPagar: TDateField;
    tbl_ContasPagarQtd_ParcelasContasPagar: TIntegerField;
    tbl_ContasDetalhes: TTable;
    ds_ContasDetalhes: TDataSource;
    Label1: TLabel;
    editDescricao: TDBEdit;
    Label2: TLabel;
    editValor: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    editQtd: TSpinEdit;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    tbl_ContasDetalhesCod_ContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_ParcContasDetalhes: TIntegerField;
    tbl_ContasDetalhesValor_ParcContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesValor_RestContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesData_VencContasDetalhes: TDateField;
    tbl_ContasDetalhesData_PagContasDetalhes: TDateField;
    tbl_ContasDetalhesStatus_ContasDetalhes: TStringField;
    tbl_ContasPagarFornecedor_ContasPagar: TStringField;
    Label6: TLabel;
    tbl_Fornecedores: TTable;
    cbFornecedores: TComboBox;
    editData: TDateTimePicker;
    editDataVenc: TDateTimePicker;
    DBDetalhes: TDBGrid;
    Panel6: TPanel;
    btnGerarParcelas: TSpeedButton;
    tbl_ContasDetalhesId_ContasPagar: TIntegerField;
    tbl_ContasDetalhesNum_DocContasDetalhes: TStringField;
    tbl_ContasPagarDocumentos_ContasPagar: TStringField;
    tbl_Lancamentos: TTable;
    tbl_LancamentosCod_ContasLancamento: TIntegerField;
    tbl_LancamentosNum_ParcContasLancamento: TIntegerField;
    tbl_LancamentosJuros_ContasLancamento: TFloatField;
    tbl_LancamentosDesconto_ContasLancamento: TFloatField;
    tbl_LancamentosValor_PagContasLancamento: TCurrencyField;
    tbl_LancamentosData_PagContasLancamento: TDateField;
    tbl_LancamentosId_ParcContasLancamento: TIntegerField;
    tbl_LancamentosObs_ContasLancamento: TStringField;
    tbl_ContasPagarPago_ContasPagar: TStringField;
    tbl_ContasDetalhesFornecedor_ContasDetalhes: TStringField;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    cbPlano: TComboBox;
    Label8: TLabel;
    tbl_PlanoContas: TTable;
    tbl_PlanoContasCod_PlanoContas: TIntegerField;
    tbl_PlanoContasDescricao_PlanoContas: TStringField;
    tbl_PlanoContasSequencia_PlanoContas: TStringField;
    tbl_PlanoContasTipo_PlanoContas: TStringField;
    tbl_PlanoContasCategoria_PlanoContas: TStringField;
    tbl_PlanoContasAtivo_PlanoContas: TStringField;
    tbl_PlanoContasValorTotal_PlanoContas: TCurrencyField;
    tbl_ContasPagarTipo_ContasPagar: TStringField;
    btnAdicionar: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBDetalhesDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure editDescricaoEnter(Sender: TObject);
    procedure editValorEnter(Sender: TObject);
    procedure editQtdEnter(Sender: TObject);
    procedure cbFornecedoresEnter(Sender: TObject);
    procedure editDescricaoExit(Sender: TObject);
    procedure cbFornecedoresExit(Sender: TObject);
    procedure editValorExit(Sender: TObject);
    procedure editQtdExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBDetalhesDblClick(Sender: TObject);
    procedure cbPlanoEnter(Sender: TObject);
    procedure cbPlanoExit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AtivarTabelas;
    procedure CarregarFornecedores;
    procedure Incremento;
    procedure Tratabotoes;
    procedure DesabilitarCampos;
    procedure GerarParcelas;
    procedure FiltrarDetalhes;
    procedure StatusConta;
    procedure DesabilitarGerarParcelas;
    procedure DeletarParcelas;
    procedure AtualizarData;
    procedure IncrementoDetalhes;
    procedure PegarCodigoDetalhes;
    procedure VerificarLancamentos;
    procedure FecharTabelas;
    procedure VerificarPagamento;
    procedure AtualizarTotalPagar;
    procedure CarregarPlanoContas;
    procedure AtualizarValorTotal;
   
    public
    dataatual, coddetalhes : Integer;
  end;

var
  frm_ContasEditar: Tfrm_ContasEditar;

implementation

uses contasapagarU, vendasU, lancamentopagU, principalU, planodecontasU,
  ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_ContasEditar.btnSairClick(Sender: TObject);
begin
if (tbl_ContasDetalhes.RecordCount >0)and(edit = 1) then
begin
MessageDlg('Clique em Gravar para salvar as altera��es!',MtInformation,[mbok],0);
exit;
end;
edit := 0;
Self.Close;
//frm_ContasPagar.Hide;
//frm_ContasPagar.Show;
end;

procedure Tfrm_ContasEditar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
self.Close;
end;

procedure Tfrm_ContasEditar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_ContasEditar.AtivarTabelas;
begin
tbl_ContasPagar.Active := true;
tbl_ContasDetalhes.Active := true;
tbl_Lancamentos.Active := true;
tbl_PlanoContas.Active := true;
end;

procedure Tfrm_ContasEditar.FormCreate(Sender: TObject);
begin
Tratabotoes;
AtivarTabelas;
PegarCodigoDetalhes;
CarregarPlanoContas;
if edit = 1 then
begin
Incremento;
AtualizarData;
end;
if edit = 2 then
begin
tbl_ContasPagar.Locate('Cod_ContasPagar',IntToStr(cod),[]);
editData.Date := tbl_ContasPagar.FieldByName('Data_ContasPagar').Value;
editDataVenc.Date := tbl_ContasPagar.FieldByName('Data_VencContasPagar').Value;
tbl_ContasPagar.Edit;
cbFornecedores.Text := tbl_ContasPagar.FieldByName('Fornecedor_ContasPagar').AsString;
editQtd.Text := tbl_ContasPagar.FieldByName('Qtd_ParcelasContasPagar').Value;
if tbl_ContasPagar.FieldByName('Tipo_ContasPagar').Value <> null then
begin
cbPlano.Text := tbl_ContasPagar.FieldByName('Tipo_ContasPagar').AsString;
end;
FiltrarDetalhes;
if tbl_ContasDetalhes.RecordCount > 0 then
begin
editValor.Enabled := false;
editQtd.Enabled := false;
end;
end;
CarregarFornecedores;
FiltrarDetalhes;
DesabilitarGerarParcelas;
end;

procedure Tfrm_ContasEditar.CarregarFornecedores;
begin
With tbl_Fornecedores do
  begin

    Active := False;
    Active := True;

    if not isEmpty then
      while not Eof do
        begin
          cbFornecedores.Items.Add(FieldByName('Nome_Fornecedores').AsString);
          Next;
        end;
  end;
end;

procedure Tfrm_ContasEditar.Incremento;
var
prox : Integer;
begin
tbl_ContasPagar.Last;
prox := tbl_ContasPagar.FieldByName('Cod_ContasPagar').AsInteger + 1;
tbl_ContasPagar.Append;
tbl_ContasPagar.FieldByName('Cod_ContasPagar').AsInteger := prox;

end;

procedure Tfrm_ContasEditar.Tratabotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnEditar.Enabled;
btnGravar.Enabled := not btnEditar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure Tfrm_ContasEditar.btnDeletarClick(Sender: TObject);
begin
if tbl_ContasPagar.RecordCount > 0 then
begin
if MessageDlg('Deseja deletar essa conta e suas respectivas parcelas?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_ContasPagar.Delete;
DeletarParcelas;
tratabotoes;
end;
if editDescricao.Enabled = false then
begin
DesabilitarCampos;
end;
exit;
end else
MessageDlg('N�o a registros a serem deletados',MtInformation,[mbok],0);
end;

procedure Tfrm_ContasEditar.btnGravarClick(Sender: TObject);
begin
if (Trim(editDescricao.Text) = '')or(Trim(cbFornecedores.Text) = '')or(Trim(editValor.Text) = '')then
begin
MessageDlg('Campos v�zios, verifique',MtWarning,[mbok],0);
exit;
end else
tbl_ContasPagar.Edit;
if edit = 1 then
begin
if tbl_ContasDetalhes.RecordCount = 0 then
begin
btnGerarParcelas.Click;
tbl_ContasPagar.Edit;
end;
tbl_ContasPagar.FieldByName('Documentos_ContasPagar').Value := InputBox('N�mero do documento','N�:','');
end;
tbl_ContasPagar.FieldByName('Fornecedor_ContasPagar').Value := cbFornecedores.Text;
tbl_ContasPagar.FieldByName('Tipo_ContasPagar').Value := Trim(cbPlano.Text);
tbl_ContasPagar.FieldByName('Qtd_ParcelasContasPagar').Value := editQtd.Text;
tbl_ContasPagar.FieldByName('Data_ContasPagar').Value := editData.Date;
tbl_ContasPagar.FieldByName('Data_VencContasPagar').Value :=  editDataVenc.Date;
VerificarPagamento;
tbl_ContasPagar.Post;
AtualizarTotalPagar;
MessageDlg('Registro salvo com sucesso!',MtInformation,[mbok],0);
Close;
edit := 0;
end;

procedure Tfrm_ContasEditar.btnCancelarClick(Sender: TObject);
begin
if tbl_ContasPagar.RecordCount > 0 then
begin
if MessageDlg('Deseja cancelar essa conta?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_ContasPagar.Cancel;
Tratabotoes;
DesabilitarCampos;
end;
end;
end;

procedure Tfrm_ContasEditar.btnEditarClick(Sender: TObject);
begin
if tbl_ContasPagar.RecordCount > 0 then
begin
if MessageDlg('Deseja editar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_ContasPagar.Edit;
cbFornecedores.Text := tbl_ContasPagar.FieldByName('Fornecedor_ContasPagar').Value;
Tratabotoes;
if editDescricao.Enabled = false then
begin
DesabilitarCampos;
end;
exit;
end else
MessageDlg('N�o a registros a serem editados!',MtInformation,[mbok],0);
end else
abort;
end;

procedure Tfrm_ContasEditar.btnNovoClick(Sender: TObject);
begin
Tratabotoes;
Incremento;
if editDescricao.Enabled = false then
begin
DesabilitarCampos;
end;
end;

procedure Tfrm_ContasEditar.DesabilitarCampos;
begin
editDescricao.Enabled := not editDescricao.Enabled;
editData.Enabled := not editData.Enabled;
editDataVenc.Enabled := not editDataVenc.Enabled;
cbFornecedores.Enabled  := not cbFornecedores.Enabled;
editQtd.Enabled := not editQtd.Enabled;
editValor.Enabled := not editValor.Enabled;
end;

procedure Tfrm_ContasEditar.GerarParcelas;
var
codigo, qtdparc : Integer;
valorparc, valortotal, divisor, valorrest : Double;
i : Integer;
datavenc : TDate;
begin


codigo := tbl_ContasPagar.FieldByName('Cod_ContasPagar').AsInteger;
qtdparc := 0;
divisor := StrToFloat(editQtd.Text);
for i := 1 to Trunc(divisor) do
begin
valortotal := StrToFloat(editValor.Text);
qtdparc := qtdparc + 1;
valorparc := valortotal / divisor;
datavenc := editDataVenc.Date;
dataatual := -1;

IncrementoDetalhes;

tbl_ContasDetalhes.FieldByName('Num_DocContasDetalhes').Value := InputBox('N�mero do documento','Documento parcela:'+IntToStr(qtdparc),'000'+IntToStr(qtdparc));
tbl_ContasDetalhes.FieldByName('Id_ContasPagar').AsInteger := codigo;
tbl_ContasDetalhes.FieldByName('Num_ParcContasDetalhes').Value := qtdparc;
tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value := valorparc;
tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value := valorparc;
tbl_ContasDetalhes.FieldByName('Fornecedor_ContasDetalhes').Value := cbFornecedores.Text;
if datavenc <> editDataVenc.Date then
begin
tbl_ContasDetalhes.FieldByName('Data_VencContasDetalhes').Value := datavenc;
end else
tbl_ContasDetalhes.FieldByName('Data_VencContasDetalhes').Value := IncMonth(datavenc,(qtdparc));

StatusConta;

end;

btnGerarParcelas.Enabled := false;

end;

procedure Tfrm_ContasEditar.FiltrarDetalhes;
var
codigo : Integer;
begin
codigo := tbl_ContasPagar.FieldByName('Cod_ContasPagar').AsInteger;

tbl_ContasDetalhes.Filtered := false;
tbl_ContasDetalhes.Filter := 'Id_ContasPagar = '+Quotedstr(IntToStr(codigo));
tbl_ContasDetalhes.Filtered := true;

AtualizarValorTotal;
end;

procedure Tfrm_ContasEditar.btnGerarParcelasClick(Sender: TObject);
begin
if (Trim(editDescricao.Text) = '')or(Trim(cbFornecedores.Text) = '')or(Trim(editValor.Text) = '')then
begin
MessageDlg('Campos v�zios, verifique',MtWarning,[mbok],0);
exit;
end else
tbl_ContasPagar.FieldByName('Qtd_ParcelasContasPagar').Value := editQtd.Text;
tbl_ContasPagar.Post;
GerarParcelas;
end;

procedure Tfrm_ContasEditar.StatusConta;
var
valorparc, valorrest, resultado : Real;
status : String;
begin
valorparc := tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value;
valorrest := tbl_ContasDetalhes.FieldByName('Valor_RestContasDetalhes').Value;
resultado := valorparc - valorrest;

if resultado = 0 then
begin
tbl_ContasDetalhes.FieldByName('Status_ContasDetalhes').Value := 'AGUARDANDO';
exit;
end;

if valorrest = 0 then
begin
tbl_ContasDetalhes.FieldByName('Status_ContasDetalhes').Value := 'PAGO';
exit;
end;

if resultado < valorparc then
begin
tbl_ContasDetalhes.FieldByName('Status_ContasDetalhes').Value := 'PARCIAL';
end;

end;

procedure Tfrm_ContasEditar.Button1Click(Sender: TObject);
begin
ShowMessage(IntToStr(coddetalhes));
end;

procedure Tfrm_ContasEditar.DesabilitarGerarParcelas;
begin
if tbl_ContasDetalhes.RecordCount > 0 then
begin
btnGerarParcelas.Enabled := false;
end else
btnGerarParcelas.Enabled := true;
end;

procedure Tfrm_ContasEditar.DeletarParcelas;
var
i, cout : Integer;
begin
tbl_ContasDetalhes.First;
cout := tbl_ContasDetalhes.RecordCount;
for i:= 1 to cout do
begin
tbl_ContasDetalhes.Delete;
end;
end;

procedure Tfrm_ContasEditar.DBDetalhesDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if not odd(tbl_ContasDetalhes.RecNo) then
    if not (gdSelected in State) then
      begin
      DBDetalhes.Canvas.Brush.Color := $00E9E9E9;
      DBDetalhes.Canvas.FillRect(Rect);
      DBDetalhes.DefaultDrawDataCell(rect, Field,state);

    end;
end;

procedure Tfrm_ContasEditar.AtualizarData;
begin
editData.Date := now;
editDataVenc.Date := now;
end;

procedure Tfrm_ContasEditar.editDescricaoEnter(Sender: TObject);
begin
editDescricao.Color := clSkyBlue;
end;

procedure Tfrm_ContasEditar.editValorEnter(Sender: TObject);
begin
editValor.Color := clSkyBlue;
end;

procedure Tfrm_ContasEditar.editQtdEnter(Sender: TObject);
begin
editQtd.Color := clSkyBlue;
end;

procedure Tfrm_ContasEditar.cbFornecedoresEnter(Sender: TObject);
begin
cbFornecedores.Color := clSkyBlue;
end;

procedure Tfrm_ContasEditar.editDescricaoExit(Sender: TObject);
begin
editDescricao.Color := clWhite;
end;

procedure Tfrm_ContasEditar.cbFornecedoresExit(Sender: TObject);
begin
cbFornecedores.Color := clWhite;
end;

procedure Tfrm_ContasEditar.editValorExit(Sender: TObject);
begin
editValor.Color := clWhite;
end;

procedure Tfrm_ContasEditar.editQtdExit(Sender: TObject);
begin
editQtd.Color := clWhite;
end;

procedure Tfrm_ContasEditar.SpeedButton1Click(Sender: TObject);
var
vencimento : TDateTime;
begin
vencimento := editDataVenc.Date;
if CheckBox1.Checked = false then
begin
editDataVenc.Date := (editDataVenc.Date - IncMonth(1))+2;
end;
if (Trim(editDescricao.Text) = '')or(Trim(cbFornecedores.Text) = '')or(Trim(editValor.Text) = '')then
begin
MessageDlg('Campos v�zios, verifique',MtWarning,[mbok],0);
exit;
end else
tbl_ContasPagar.FieldByName('Qtd_ParcelasContasPagar').Value := editQtd.Text;
tbl_ContasPagar.Post;
GerarParcelas;
tbl_ContasDetalhes.Post;
MessageDlg('Parcelas geradas com sucesso!',MtInformation,[mbok],0);
if CheckBox1.Checked = true then
begin
editDataVenc.Date := tbl_ContasDetalhes.FieldByName('Data_VencContasDetalhes').Value;
end else
if CheckBox1.Checked = false then
begin
editDataVenc.Date := vencimento;
end;
end;

procedure Tfrm_ContasEditar.IncrementoDetalhes;
begin
coddetalhes := coddetalhes + 1;
tbl_ContasDetalhes.Append;
tbl_ContasDetalhes.FieldByName('Cod_ContasDetalhes').AsInteger := coddetalhes;
end;

procedure Tfrm_ContasEditar.PegarCodigoDetalhes;
begin
tbl_ContasDetalhes.Last;
coddetalhes := tbl_ContasDetalhes.FieldByName('Cod_ContasDetalhes').AsInteger;
end;

procedure Tfrm_ContasEditar.Button2Click(Sender: TObject);
begin
tbl_ContasDetalhes.Delete;
end;

procedure Tfrm_ContasEditar.DBDetalhesDblClick(Sender: TObject);
begin
codfiltro := tbl_ContasDetalhes.FieldByName('Cod_ContasDetalhes').Value;
frm_LancamentosPag := Tfrm_LancamentosPag.Create(self);
VerificarLancamentos;
end;

procedure Tfrm_ContasEditar.VerificarLancamentos;
begin
tbl_Lancamentos.Filtered := false;
tbl_Lancamentos.Filter := 'Cod_ContasLancamento = '+Quotedstr(IntToStr(codfiltro));
tbl_Lancamentos.Filtered := true;

if tbl_Lancamentos.RecordCount = 0 then
begin
MessageDlg('N�o a lancamentos referentes a esse per�odo!',MtInformation,[mbok],0);
exit;
end;

frm_LancamentosPag.ShowModal;
try
finally
frm_LancamentosPag.Free;
frm_LancamentosPag := nil;
end;
end;

procedure Tfrm_ContasEditar.FecharTabelas;
begin
tbl_ContasPagar.Active := false;
tbl_ContasDetalhes.Active := false;
tbl_Fornecedores.Active := false;
tbl_Lancamentos.Active := false;
tbl_PlanoContas.Active := false;
end;

procedure Tfrm_ContasEditar.VerificarPagamento;
var
count, status : Integer;
begin

count := tbl_ContasDetalhes.RecordCount;

tbl_ContasDetalhes.Filtered := false;
tbl_ContasDetalhes.Filter := 'Id_ContasPagar = '+Quotedstr(IntToStr(cod))+'and Status_ContasDetalhes = '+Quotedstr('PAGO');
tbl_ContasDetalhes.Filtered := true;

status := tbl_ContasDetalhes.RecordCount;

if (count = status)and(editQtd.Text <> '1') then
begin
tbl_ContasPagar.FieldByName('Pago_ContasPagar').Value := 'SIM';
end else
tbl_ContasPagar.FieldByName('Pago_ContasPagar').Value := 'N�O';
end;

procedure Tfrm_ContasEditar.AtualizarTotalPagar;
begin
frm_ContasPagar.btnAtualizar.Visible := true;
frm_ContasPagar.btnAtualizar.Click;
frm_ContasPagar.btnAtualizar.Visible := false;
frm_ContasPagar.tbl_ContasPagar.Refresh;

end;

procedure Tfrm_ContasEditar.CarregarPlanoContas;
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


procedure Tfrm_ContasEditar.cbPlanoEnter(Sender: TObject);
begin
cbPlano.Color := clSkyBlue;
end;

procedure Tfrm_ContasEditar.cbPlanoExit(Sender: TObject);
begin
cbPlano.Color := clWhite;
end;

procedure Tfrm_ContasEditar.btnAdicionarClick(Sender: TObject);
begin
frm_PlanoContas := Tfrm_PlanoContas.Create(Self);
frm_PlanoContas.ShowModal;
try
finally
frm_PlanoContas.Free;
frm_PlanoContas := nil;
end;
end;

procedure Tfrm_ContasEditar.AtualizarValorTotal;
var
somatotal : Real;
begin
somatotal := 0;
  with tbl_ContasDetalhes do
  begin
    First;
    while not tbl_ContasDetalhes.Eof do
    begin

      somatotal := somatotal + tbl_ContasDetalhes.FieldByName('Valor_ParcContasDetalhes').Value;
      Next;
    end;
  end;

editValor.Text := FloatToStr(somatotal);
end;

procedure Tfrm_ContasEditar.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  Panel2.Color := cor - 30;
  GroupBox1.Color := cor - 30;
  GroupBox2.Color := cor;
end;

end.




