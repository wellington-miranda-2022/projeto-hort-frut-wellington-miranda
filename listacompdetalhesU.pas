unit listacompdetalhesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons,
  ComCtrls, ExtCtrls, DateUtils;

type
  Tfrm_ListaCompDetalhes = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Bevel1: TBevel;
    Label1: TLabel;
    lblFiltro: TLabel;
    btnSair: TBitBtn;
    editData: TDateTimePicker;
    editConsulta: TEdit;
    RBTudo: TRadioButton;
    tbl_CompTotal: TTable;
    tbl_Compras: TTable;
    ds_CompTotal: TDataSource;
    ds_Compras: TDataSource;
    tbl_Produtos: TTable;
    tbl_ProdutosCod_Produto: TIntegerField;
    tbl_ProdutosDescricao_Produto: TStringField;
    tbl_ProdutosTipo_Produto: TStringField;
    tbl_ProdutosFornecedores_Produto: TStringField;
    tbl_CompTotalCod_CompTotal: TIntegerField;
    tbl_CompTotalFornecedor_CompTotal: TStringField;
    tbl_CompTotalLote_CompTotal: TStringField;
    tbl_CompTotalData_CompTotal: TDateField;
    tbl_CompTotalTotal_CompTotal: TCurrencyField;
    tbl_CompTotalFormPag_CompTotal: TStringField;
    tbl_CompTotalUsuario_CompTotal: TStringField;
    tbl_CompTotalDataVenc_CompTotal: TDateField;
    tbl_CompTotalPrazo_CompTotal: TIntegerField;
    tbl_CompTotalFrete_CompTotal: TCurrencyField;
    tbl_CompTotalSituacao_CompTotal: TStringField;
    tbl_ComprasCod_Compra: TIntegerField;
    tbl_ComprasCod_CompTotal: TIntegerField;
    tbl_ComprasUnid_Compra: TStringField;
    tbl_ComprasValor_Compra: TCurrencyField;
    tbl_ComprasTotal_Compra: TCurrencyField;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    DBCompTotal: TDBGrid;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    lblqtd: TLabel;
    lblTotalItens: TLabel;
    editSituacao: TDBEdit;
    DBCompras: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    SpeedButton2: TSpeedButton;
    Label14: TLabel;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    Data: TDateTimePicker;
    editFrete: TDBEdit;
    btnAdicionar: TBitBtn;
    cbFormPag: TComboBox;
    cbFornecedores: TComboBox;
    tbl_Fornecedores: TTable;
    tbl_FornecedoresCod_Fornecedores: TIntegerField;
    tbl_FornecedoresNome_Fornecedores: TStringField;
    tbl_FornecedoresCNPJ_Fornecedores: TStringField;
    tbl_FornecedoresTelefone_Fornecedores: TStringField;
    tbl_FornecedoresBairro_Fornecedores: TStringField;
    tbl_FornecedoresEndereco_Fornecedores: TStringField;
    tbl_FornecedoresMunicipio_Fornecedores: TStringField;
    tbl_FornecedoresCep_Fornecedores: TStringField;
    editLote: TEdit;
    editPrazo: TEdit;
    Image2: TImage;
    Bevel2: TBevel;
    tbl_ComprasProduto_Compra: TStringField;
    tbl_ComprasId_Pedido: TIntegerField;
    Label4: TLabel;
    lblTotal: TLabel;
    Button1: TButton;
    tbl_ComprasQuantidade_Compra: TFloatField;
    tbl_ProdutosQtd_Produto: TFloatField;
    tbl_ContasPagar: TTable;
    tbl_ContasPagarCod_ContasPagar: TIntegerField;
    tbl_ContasPagarDocumentos_ContasPagar: TStringField;
    tbl_ContasPagarFornecedor_ContasPagar: TStringField;
    tbl_ContasPagarDescricao_ContasPagar: TStringField;
    tbl_ContasPagarValor_ContasPagar: TCurrencyField;
    tbl_ContasPagarData_ContasPagar: TDateField;
    tbl_ContasPagarData_VencContasPagar: TDateField;
    tbl_ContasPagarQtd_ParcelasContasPagar: TIntegerField;
    tbl_ContasPagarPago_ContasPagar: TStringField;
    tbl_ContasPagarTipo_ContasPagar: TStringField;
    tbl_ContasPagarId_Compra: TIntegerField;
    Query1: TQuery;
    tbl_PlanoContas: TTable;
    tbl_PlanoContasCod_PlanoContas: TIntegerField;
    tbl_PlanoContasDescricao_PlanoContas: TStringField;
    tbl_PlanoContasSequencia_PlanoContas: TStringField;
    tbl_PlanoContasTipo_PlanoContas: TStringField;
    tbl_PlanoContasCategoria_PlanoContas: TStringField;
    tbl_PlanoContasAtivo_PlanoContas: TStringField;
    tbl_PlanoContasValorTotal_PlanoContas: TCurrencyField;
    tbl_ContasDetalhes: TTable;
    tbl_ContasDetalhesCod_ContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_ParcContasDetalhes: TIntegerField;
    tbl_ContasDetalhesValor_ParcContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesValor_RestContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesData_VencContasDetalhes: TDateField;
    tbl_ContasDetalhesData_PagContasDetalhes: TDateField;
    tbl_ContasDetalhesStatus_ContasDetalhes: TStringField;
    tbl_ContasDetalhesId_ContasPagar: TIntegerField;
    tbl_ContasDetalhesNum_DocContasDetalhes: TStringField;
    tbl_ContasDetalhesFornecedor_ContasDetalhes: TStringField;
    tbl_ContaCorrente: TTable;
    tbl_ContaCorrenteCod_ContaCorrente: TAutoIncField;
    tbl_ContaCorrenteDescricao_ContaCorrente: TStringField;
    tbl_ContaCorrenteAgencia_ContaCorrente: TStringField;
    tbl_ContaCorrenteBanco_ContaCorrente: TStringField;
    tbl_ContaCorrenteAtivo_ContaCorrente: TStringField;
    tbl_ContaCorrenteId_Conta: TIntegerField;
    tbl_ContaCorrenteConta_ContaCorrente: TStringField;
    tbl_ContaCorrenteSaldo_ContaCorrente: TCurrencyField;
    tbl_Movimentacao: TTable;
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
    tbl_Plano: TTable;
    tbl_PlanoCod_Planos: TAutoIncField;
    tbl_PlanoDescricao_Planos: TStringField;
    tbl_PlanoDoc_Planos: TStringField;
    tbl_PlanoValor_Planos: TCurrencyField;
    tbl_PlanoData_Planos: TDateField;
    tbl_PlanoDataVenc_Planos: TDateField;
    tbl_PlanoTipo_Planos: TStringField;
    tbl_PlanoId_PlanoContas: TIntegerField;
    tbl_PlanoId_Movimentacao: TIntegerField;
    tbl_Planoid_ContaCorrente: TIntegerField;
    tbl_MovimentacaoId_Compra: TIntegerField;
    tbl_PlanoId_Compra: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure editPrazoExit(Sender: TObject);
    procedure editPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure DBCompTotalCellClick(Column: TColumn);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBComprasCellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
    procedure DBCompTotalColExit(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaEnter(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure RBTudoClick(Sender: TObject);
    procedure editDataChange(Sender: TObject);
    procedure DBComprasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBCompTotalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Image2Click(Sender: TObject);
    procedure cbFornecedoresExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tbl_CompTotalAfterPost(DataSet: TDataSet);
    procedure cbFornecedoresChange(Sender: TObject);
  private
    procedure CarregarFornecedores;
    procedure AtivarTabelas;
    procedure FecharTabelas;
    procedure LimparDetalhes;
    procedure FiltrarDetalhes;
    procedure SomarPedidos;
    procedure Atualizar;
    procedure CentralizarColuna;
    procedure AssociarCampos;
    procedure PintarSituacao;
    procedure AdicionarQuantidade;
    procedure CalcularPrazo;
    procedure CalcularDias;
    procedure CalcularSituacao;
    procedure Deletar;
    procedure CancelarCompra;
    procedure AtualizarCamposLimpos;
    procedure AtualizarEstoque;
    procedure EditarEstoque;
    procedure FiltrarData;
    procedure LimparFalhas;
    procedure ApagarFornecedor;
    procedure TotalCompra;
    procedure DeletarCompras;
    procedure FiltrarCompTotal;
    procedure ContasPagar;
    procedure Contas;
    procedure CriarPlanoCompra;
    procedure ContaCorrente;
    procedure AdicionarDias;
    procedure CalcularData;
    procedure DeletarContasPagar;
    procedure DeletarMovimentacaoPlanos;
    procedure SairSemSalvar;
    procedure AjustarTamanho;

    public
   totalpedido : Real;
   qtdcompra : Integer;
   PEDIDO, plano : String;
   dataEmissao, dataVencimento, dia : String;
    end;

var
  frm_ListaCompDetalhes: Tfrm_ListaCompDetalhes;
  inicio : Integer;

implementation

uses comprasU, insertqtdU, principalU, novopedU, cidadesU, buscarprodutoU,
  vendasU, listavenddetalhes, consultapedidosU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_ListaCompDetalhes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_ListaCompDetalhes.btnSairClick(Sender: TObject);
begin
totalprevfrete := 0;
SairSemSalvar;
Self.Close;
end;

procedure Tfrm_ListaCompDetalhes.btnAdicionarClick(Sender: TObject);
begin
begin
if inserirqtd = 5 then
begin
inicio := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger;
btnGravar.Enabled := true;
end else
produto := '';
edit := 1;
frm_Compras := Tfrm_Compras.Create(Self);
frm_Compras.ShowModal;
try
finally
frm_Compras.Free;
frm_Compras := nil;
end;
end;
end;

procedure Tfrm_ListaCompDetalhes.CarregarFornecedores;
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

procedure Tfrm_ListaCompDetalhes.FormCreate(Sender: TObject);
begin
editData.Date := now;
CarregarFornecedores;
AtivarTabelas;
Data.Date := Date;
editPrazo.Text := FloatToStr(prazo_dias);
LimparDetalhes;
SomarPedidos;
LimparFalhas;
TotalCompra;
FiltrarCompTotal;
TotalCompra;
edit := 1;
end;

procedure Tfrm_ListaCompDetalhes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_ListaCompDetalhes.AtivarTabelas;
begin
tbl_CompTotal.Active := true;
tbl_Compras.Active := true;
tbl_Produtos.Active := true;
tbl_Fornecedores.Active := true;
tbl_ContasPagar.Active := true;
tbl_PlanoContas.Active := true;
tbl_ContasDetalhes.Active := true;
tbl_ContaCorrente.Active := true;
tbl_Movimentacao.Active := true;
tbl_Plano.Active := true;
end;

procedure Tfrm_ListaCompDetalhes.FecharTabelas;
begin
tbl_Movimentacao.Active := false;
tbl_ContasDetalhes.Active := false;
tbl_ContaCorrente.Active := true;
tbl_CompTotal.Active := false;
tbl_Compras.Active := false;
tbl_Produtos.Active := false;
tbl_Fornecedores.Active := false;
tbl_ContasPagar.Active := false;
tbl_Plano.Active := false;
tbl_PlanoContas.Active := false;
end;

procedure Tfrm_ListaCompDetalhes.LimparDetalhes;
begin
tbl_Compras.Filtered := false;
tbl_Compras.Filter := 'Cod_CompTotal = 10000000';
tbl_Compras.Filtered := true;
end;

procedure Tfrm_ListaCompDetalhes.SomarPedidos;
var
cout : Integer;
somar : Real;
begin
inherited;
cout := tbl_Compras.RecordCount;
if tbl_Compras.RecordCount = 0 then
begin
lblQtd.Caption := '00';
lblTotalItens.Caption := 'R$ 00,00';
end else
somar := 0;
with tbl_Compras do
begin
    tbl_Compras.First;
while not tbl_Compras.Eof do
begin
somar := (somar + tbl_Compras.FieldByName('Total_Compra').AsFloat);
tbl_Compras.Next;
totalpedido := somar;
lblQtd.Caption := IntToStr(cout);
lblTotalItens.Caption := FormatFloat('R$ #,,,,0.00',somar);
end;
end;
end;

procedure Tfrm_ListaCompDetalhes.Atualizar;
begin

SomarPedidos;
tbl_Comptotal.Edit;
tbl_Comptotal.FieldByName('Total_CompTotal').Value := totalpedido;
tbl_Comptotal.Post;

end;

procedure Tfrm_ListaCompDetalhes.FormShow(Sender: TObject);
begin

 Panel1.Color := cor;
  Panel2.Color := cor - 30;
  Panel3.Color := cor - 30;

CentralizarColuna;

   editFrete.Text := FormatFloat('R$ #,,,,0.00',totalprevfrete);

if edit = 0 then
 begin
    FiltrarDetalhes;
    btnGravar.Enabled := true;
    lblQtd.Visible := true;
    label2.Visible := true;
    lblTotalItens.Visible := true;
    editSituacao.Text := '';
 end;
  if (edit = 2)then
 begin
    Atualizar;
    EditarEstoque;
    produto := '';
    btnEditar.Enabled := false;
 end;
 if inserirqtd = 5 then
 begin
   AtualizarCamposLimpos;
 end;
  SomarPedidos;
  //AjustarTamanho;
end;

procedure Tfrm_ListaCompDetalhes.CentralizarColuna;
begin
DBCompTotal.Columns[0].Title.alignment := taCenter;
DBCompTotal.Columns[1].Title.alignment := taCenter;
DBCompTotal.Columns[2].Title.alignment := taCenter;
DBCompTotal.Columns[3].Title.alignment := taCenter;
DBCompTotal.Columns[4].Title.alignment := taCenter;
DBCompTotal.Columns[5].Title.alignment := taCenter;
DBCompTotal.Columns[6].Title.alignment := taCenter;
DBCompTotal.Columns[7].Title.alignment := taCenter;
DBCompTotal.Columns[8].Title.alignment := taCenter;
DBCompTotal.Columns[9].Title.alignment := taCenter;
DBCompTotal.Columns[10].Title.alignment := taCenter;


DBCompras.Columns[0].Title.alignment := taCenter;
DBCompras.Columns[1].Title.alignment := taCenter;
DBCompras.Columns[2].Title.alignment := taCenter;
DBCompras.Columns[3].Title.alignment := taCenter;
DBCompras.Columns[4].Title.alignment := taCenter;
DBCompras.Columns[5].Title.alignment := taCenter;
DBCompras.Columns[6].Title.alignment := taCenter;

end;

procedure Tfrm_ListaCompDetalhes.FiltrarDetalhes;
var
codtotal : Integer;
begin
tbl_CompTotal.Last;
codtotal := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger + 1;

tbl_Compras.Filtered := false;
tbl_Compras.Filter := 'Cod_CompTotal = '+Quotedstr(IntToStr(codtotal));
tbl_Compras.Filtered := true;
SomarPedidos;

end;

procedure Tfrm_ListaCompDetalhes.btnGravarClick(Sender: TObject);
var
codigo, codtotal, cout, i : Integer;

begin
dataEmissao := DateToStr(editData.Date);
dataVencimento := DateToStr(data.Date);
codtotal := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger;
codigo := tbl_Compras.FieldByName('Cod_CompTotal').AsInteger;
cout := tbl_Compras.RecordCount;

if cbFornecedores.Text = 'ESCOLHA O FORNECEDOR' then
begin
MessageDlg('Escolha o fonecedor para anexar a compra!',MtWarning,[mbok],0);
exit;
end;

if cbFormPag.Text = 'FORMA DE P�GAMENTO' then
begin
MessageDlg('Escolha a forma de p�gamento!',MtWarning,[mbok],0);
exit;
end;


if inserirqtd = 5 then
begin
inserirqtd := 0;
edit := 1;
AtualizarEstoque;

exit;
end;
inserirqtd := 0;


Image2.Enabled := true;
btnGravar.Enabled := false;
cbFornecedores.Enabled := true;

MessageDlg('Compra efetuada com sucesso!',MtInformation,[mbok],0);

if codigo = codtotal then

begin
SomarPedidos;
tbl_CompTotal.Edit;
tbl_CompTotal.FieldByName('Total_CompTotal').Value := totalpedido;
tbl_CompTotal.Post;


end else

SomarPedidos;
listcliente := 'ESCOLHA O CLIENTE DESEJADO';
produto := '';
SomarPedidos;
AssociarCampos;
CriarPlanoCompra;
ContasPagar;
if editSituacao.Text = 'PAGO' then
begin
  ContaCorrente;
end;
PintarSituacao;
tbl_CompTotal.Post;
tbl_Compras.First;

ApagarFornecedor;
AdicionarQuantidade;
FiltrarCompTotal;
TotalCompra;
editPrazo.Text := FloatToStr(prazo_dias);
editLote.Text := '';
editPrazo.Text := FloatToStr(prazo_dias);
cbFornecedores.Text := 'ESCOLHA O FORNECEDOR';
editFrete.Text := FormatFloat('R$ #,,,,0.00',totalprevfrete);
totalprevfrete := 0;

FiltrarData;
TotalCompra;
RBTudo.Checked := false;

end;


procedure Tfrm_ListaCompDetalhes.AssociarCampos;
var
prox : Integer;
usuario, situacao : String;
begin
usuario := nome;
tbl_CompTotal.Filtered := false;
tbl_CompTotal.Last;
prox := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger + 1;
tbl_CompTotal.Append;
tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger := prox;
tbl_Compras.Filtered := true;
tbl_Compras.Last;
CalcularSituacao;
PintarSituacao;
situacao := editSituacao.Text;
tbl_CompTotal.FieldByName('Situacao_CompTotal').Value := situacao;
tbl_CompTotal.FieldByName('Fornecedor_CompTotal').Value := cbFornecedores.Text;
tbl_CompTotal.FieldByName('Usuario_CompTotal').Value := usuario;
tbl_CompTotal.FieldByName('Total_CompTotal').Value := totalpedido;
tbl_CompTotal.FieldByName('Data_CompTotal').Value := dataEmissao;
tbl_CompTotal.FieldByName('DataVenc_CompTotal').Value := dataVencimento;
tbl_CompTotal.FieldByName('Prazo_CompTotal').Value := StrToInt(editPrazo.Text);
tbl_CompTotal.FieldByName('FormPag_CompTotal').Value := cbFormPag.Text;
tbl_CompTotal.FieldByName('Frete_CompTotal').Value := editFrete.Text;
tbl_CompTotal.FieldByName('Lote_CompTotal').Value := editLote.Text;

cbFormPag.Text := 'Forma de p�gamento';


end;

procedure Tfrm_ListaCompDetalhes.PintarSituacao;
var
Situacao : String;
begin
Situacao := editSituacao.Text;

if Situacao = 'PAGO' then
begin
editSituacao.Font.Color := clGreen;
end
else
if Situacao = 'PENDENTE' then
begin
editSituacao.Font.Color := clBlack;
end
else
if Situacao = 'EM ATRASO' then
begin
editSituacao.Font.Color := clRed;

end;
end;

procedure Tfrm_ListaCompDetalhes.AdicionarQuantidade;
var
qtdestoque, qtdcomprada, total, i : Integer;
descricao, nomeproduto : String;
begin
tbl_Compras.First;
for i:=1 to tbl_Compras.RecordCount do
begin
descricao := Trim(tbl_Compras.FieldByName('Produto_Compra').Value);
qtdcomprada := tbl_Compras.FieldByName('Quantidade_Compra').Value;

tbl_Produtos.Locate('Descricao_Produto',descricao,[loPartialKey]);

if tbl_Produtos.RecordCount = 0 then
begin
ShowMessage('Ouve um problema com a descri��o do produto '+descricao+', por favor contate o suporte!');
end;

qtdestoque := tbl_Produtos.FieldByName('Qtd_Produto').AsInteger;
nomeproduto := tbl_Produtos.FieldByName('Descricao_Produto').AsString;
total := qtdestoque + qtdcomprada;
tbl_Produtos.Edit;
tbl_Produtos.FieldByName('Qtd_Produto').Value := total;
tbl_Produtos.Post;

//qtdestoque := tbl_Produtos.FieldByName('Qtd_Produto').Value;

tbl_Compras.Next;

end;
end;

procedure Tfrm_ListaCompDetalhes.CalcularPrazo;
var
dataprev, datapag : TDate;
atraso : Real;
inteiro : Integer;
begin
dataprev := Date;
datapag := Data.Date;
atraso := datapag - dataprev;
inteiro := Trunc(atraso);
editPrazo.Text := IntToStr(inteiro);
end;

procedure Tfrm_ListaCompDetalhes.DataChange(Sender: TObject);
begin
//CalcularPrazo;
end;

procedure Tfrm_ListaCompDetalhes.editPrazoExit(Sender: TObject);
begin
CalcularData;
//CalcularDias;
end;

procedure Tfrm_ListaCompDetalhes.editPrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
Key := #0;
end;

procedure Tfrm_ListaCompDetalhes.CalcularDias;
var

datax, dataprev, datapag, datahoje: TDate;
atraso : Real;
inteiro : Integer;
dias : Integer;

begin
if editPrazo.Text = '' then
begin
editPrazo.Text := '0';
exit;
end;

dias := StrToInt(editPrazo.Text);

if dias <> 0 then
begin

dataprev := Date;
datax := IncDay(dataprev, dias);
atraso := datax;
Data.Date := Trunc(atraso);
end;

if  editPrazo.Text = '0' then
begin
Data.Date;
end;
end;

procedure Tfrm_ListaCompDetalhes.DBCompTotalCellClick(Column: TColumn);
var
codtotal : Integer;
cout: Integer;
begin
edit := 4;
btnDeletar.Enabled := true;
if (inserirqtd <> 5) then
begin
inicio := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger;
end;
cout := tbl_Compras.FieldByName('Cod_CompTotal').AsInteger;
codtotal := tbl_CompTotal.FieldByName('Cod_Comptotal').AsInteger;

lblTotalItens.Visible := true;
lblQtd.Visible := true;
Label2.Visible := true;
btnDeletar.Enabled := true;
btnEditar.Enabled := false;
tbl_Compras.Filtered := false;
tbl_Compras.Filter := 'Cod_CompTotal = '+Quotedstr(IntToStr(codtotal));
tbl_Compras.Filtered := true;
PintarSituacao;
SomarPedidos;
CancelarCompra;




end;


procedure Tfrm_ListaCompDetalhes.CalcularSituacao;
var
prazo : Integer;
begin
prazo := StrToInt(editPrazo.Text);
if prazo < 0 then
begin
editSituacao.Text := 'EM ATRAZO';
end else begin
if prazo = 0 then
begin
editSituacao.Text := 'PAGO'
end else begin
if prazo > 0 then
begin
editSituacao.Text := 'PENDENTE';

end;
end;
end;
end;

procedure Tfrm_ListaCompDetalhes.btnDeletarClick(Sender: TObject);
begin
DeletarContasPagar;
DeletarMovimentacaoPlanos;
Deletar;
LimparDetalhes;
btnDeletar.Enabled := false;

TotalCompra;
end;

procedure Tfrm_ListaCompDetalhes.Deletar;
var
i : Integer;
codigo, codtotal : Integer;
cout: Integer;
begin

cout:= tbl_Compras.RecordCount;
codtotal := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger;
codigo := tbl_Compras.FieldByName('Cod_CompTotal').AsInteger;

if edit = 3 then
begin
if cout > 0 then
tbl_Compras.Delete;
SomarPedidos;
if tbl_CompTotal.RecordCount >0 then
begin
tbl_CompTotal.Edit;
tbl_CompTotal.FieldByName('Total_CompTotal').Value := totalpedido;
tbl_CompTotal.Post;
end;
end;

if cout = 0 then
begin
lblTotalItens.Caption := 'R$ 00';
MessageDlg('N�o tem nenhum registro a ser apagado, essa venda ser� deletada!',MtError,[mbok],0);
tbl_CompTotal.Delete;
frm_ListaCompDetalhes.Close;
frm_ListaCompDetalhes := Tfrm_ListaCompDetalhes.Create(Self);
frmPrincipal.Hide;
frmPrincipal.Show;
frm_ListaCompDetalhes.ShowModal;
end;

if edit = 4 then
begin
DeletarCompras;
end;

end;

procedure Tfrm_ListaCompDetalhes.DBComprasCellClick(Column: TColumn);
begin

btnEditar.Enabled := true;
btnDeletar.Enabled := true;
qtdcompra := tbl_Compras.FieldByName('Quantidade_Compra').AsInteger;
produto := tbl_Compras.FieldByName('Produto_Compra').Value;
if tbl_Compras.FieldByName('Cod_Compra').Value <> null then
begin
cod := tbl_Compras.FieldByName('Cod_Compra').Value;
end;
listqtd := tbl_Compras.FieldByname('Quantidade_Compra').Value;
edit := 3;
end;

procedure Tfrm_ListaCompDetalhes.btnEditarClick(Sender: TObject);
begin
edit := 2;
frm_Compras := Tfrm_Compras.Create(self);
frm_Compras.ShowModal;
try
finally
frm_Compras.Free;
frm_Compras := nil;
end;
end;

procedure Tfrm_ListaCompDetalhes.DBCompTotalColExit(Sender: TObject);
var
codigo,cod,codtotal : Integer;
begin

codigo := tbl_Compras.RecordCount;
codtotal := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger;
cod := tbl_Compras.FieldByName('Cod_CompTotal').AsInteger;

if (cod <> codtotal)and(btnGravar.Enabled = true) then
begin
MessageDlg('Clique em gravar para continuar, caso contrario o estoque n�o ser� atualizado!',MtInformation,[mbok],0);
end;

if (codigo = 0) and (lblQtd.Visible) = true then
begin
CancelarCompra;
end;
if (inserirqtd = 5)and(codigo > 0) then
begin
MessageDlg('Clique em gravar para continuar!',MtInformation,[mbok],0);
tbl_CompTotal.Locate('Cod_CompTotal',IntToStr(inicio),[])
end;

end;

procedure Tfrm_ListaCompDetalhes.CancelarCompra;
var
codigo: Integer;
begin
codigo :=   tbl_Compras.RecordCount;
if ((codigo = 0)and(tbl_Compras.Filtered = true)and(tbl_Compras.RecordCount >0))then
begin
if MessageDlg('Voc� ainda tem uma COMPRA em aberto. Deseja cancelar?',MtInformation,[mbyes,mbno],0)=mryes then
begin
inserirqtd := 0;
tbl_CompTotal.Locate('Cod_CompTotal',IntToStr(inicio),[]);
edit := 0;
frm_ListaCompDetalhes.Close;
frm_ListaCompDetalhes := Tfrm_ListaCompDetalhes.Create(Self);
frmPrincipal.Hide;
frmPrincipal.Show;
frm_ListaCompDetalhes.ShowModal;

end else
tbl_CompTotal.Locate('Cod_CompTotal',IntToStr(inicio),[]);
inserirqtd := 5;
produto := '';
SomarPedidos;
abort;
end;
end;

procedure Tfrm_ListaCompDetalhes.btnTesteClick(Sender: TObject);
var
codigo : Integer;
begin

codigo := inicio;

tbl_Compras.Filtered := false;
tbl_Compras.Filter := 'Cod_CompTotal = '+Quotedstr(IntToStr(codigo));
tbl_Compras.Filtered := true;
end;
procedure Tfrm_ListaCompDetalhes.AtualizarCamposLimpos;
var
codigo : Integer;
begin

codigo := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger;

tbl_Compras.Filtered := false;
tbl_Compras.Filter := 'Cod_CompTotal = '+Quotedstr(IntToStr(codigo));
tbl_Compras.Filtered := true;
SomarPedidos;
tbl_CompTotal.Edit;
tbl_CompTotal.FieldByName('Total_CompTotal').Value := totalpedido;
tbl_CompTotal.Post;

end;

procedure Tfrm_ListaCompDetalhes.AtualizarEstoque;
var
i : Integer;
cout : Integer;
begin
cout := tbl_Compras.RecordCount;

for i:= 1 to cout do
begin
AdicionarQuantidade;
end;
MessageDlg('As altera��es ao registro foram salvas com sucesso!',MtInformation,[mbok],0);
frm_ListaCompDetalhes.Close;
frm_ListaCompDetalhes := Tfrm_ListaCompDetalhes.Create(Self);
frmPrincipal.Hide;
frmPrincipal.Show;
frm_ListaCompDetalhes.ShowModal;

end;

procedure Tfrm_ListaCompDetalhes.SpeedButton2Click(Sender: TObject);
begin
inserirqtd := 6;
frm_Cidades := Tfrm_Cidades.Create(self);
frm_Cidades.ShowModal;
try
finally
frm_Cidades.Free;
frm_Cidades := nil;
end;
end;

procedure Tfrm_ListaCompDetalhes.EditarEstoque;
var
estoque, resultado : Integer;
produtoedit : String;
begin
tbl_Compras.Locate('Cod_Compra',IntToStr(cod),[]);
produtoedit := tbl_Compras.FieldByName('Produto_Compra').Value;
tbl_Produtos.Filtered := false;
tbl_Produtos.Filter := 'Descricao_Produto = '+Quotedstr(produtoedit);
tbl_Produtos.Filtered := true;

estoque := tbl_Produtos.FieldByName('Qtd_Produto').AsInteger;

resultado := estoque - qtdcompra;
resultado := resultado + StrToInt(listqtd);

tbl_Produtos.Edit;
tbl_Produtos.FieldByName('Qtd_Produto').Value := resultado;
tbl_Produtos.Post;

end;


procedure Tfrm_ListaCompDetalhes.editConsultaChange(Sender: TObject);
begin
begin
if Length(editConsulta.Text)= 0 then
begin
editConsulta.Text := 'DIGITE SUA PESQUISA';
tbl_CompTotal.Filtered := false;
editConsulta.SelectAll;
RBTudo.Checked := true;
end else
if editConsulta.Text <> '' then
begin
RBTudo.Checked := false;
tbl_CompTotal.Close;
tbl_CompTotal.Filter := 'Fornecedor_CompTotal = ' + Quotedstr(editConsulta.Text+'*');
tbl_CompTotal.Open;
tbl_CompTotal.Filtered := true;
listcliente :=  tbl_CompTotal.FieldByName('Fornecedor_CompTotal').AsString;
end;
end;
end;


procedure Tfrm_ListaCompDetalhes.editConsultaClick(Sender: TObject);
begin
editConsulta.SelectAll;
end;

procedure Tfrm_ListaCompDetalhes.editConsultaEnter(Sender: TObject);
begin
editConsulta.Color := clSkyblue;
end;

procedure Tfrm_ListaCompDetalhes.editConsultaExit(Sender: TObject);
begin
editConsulta.Color := clWhite;
end;

procedure Tfrm_ListaCompDetalhes.RBTudoClick(Sender: TObject);
begin
tbl_CompTotal.Filtered := false;
TotalCompra;
end;


procedure Tfrm_ListaCompDetalhes.editDataChange(Sender: TObject);
begin
dataEmissao := DateToStr(editData.Date);
FiltrarData;
TotalCompra;
RBTudo.Checked := false;
//AdicionarDias;
end;

procedure Tfrm_ListaCompDetalhes.FiltrarData;
var
date : String;
begin
date := DateToStr(editData.Date);
tbl_CompTotal.Filtered := false;
tbl_CompTotal.Filter := 'Data_CompTotal = '+Quotedstr(date);
tbl_CompTotal.Filtered := true;
end;

procedure Tfrm_ListaCompDetalhes.DBComprasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBCompras.DataSource.Dataset.RecNo)then
begin
DBCompras.Canvas.Brush.Color := $00E9E9E9;
end else
DBCompras.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBCompras.Canvas.Brush.Color := clHighlight;
DBCompras.Canvas.Font.Color := clWhite;
DBCompras.Canvas.Font.Style := [fsBold];
end;
DBCompras.Canvas.FillRect(Rect);
DBCompras.DefaultDrawColumnCell( Rect, DataCol, Column, State);

end;

procedure Tfrm_ListaCompDetalhes.DBCompTotalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBCompTotal.DataSource.Dataset.RecNo)then
begin
DBCompTotal.Canvas.Brush.Color := $00E9E9E9;
end else
DBCompTotal.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBCompTotal.Canvas.Brush.Color := clHighlight;
DBCompTotal.Canvas.Font.Color := clWhite;
DBCompTotal.Canvas.Font.Style := [fsBold];
end;
DBCompTotal.Canvas.FillRect(Rect);
DBCompTotal.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_ListaCompDetalhes.Image2Click(Sender: TObject);
begin
DBCompTotal.SelectedIndex;
if cbFornecedores.Text = 'ESCOLHA O FORNECEDOR' then
begin
MessageDlg('Escolha um fornecedor para importar o pedido de compra!',MtWarning,[mbok],0);
exit;
end;
frm_ConsultaPedidos := Tfrm_ConsultaPedidos.Create(Self);
frm_ConsultaPedidos.ShowModal;
try
finally
frm_ConsultaPedidos.Free;
frm_ConsultaPedidos := nil;
end;
end;

procedure Tfrm_ListaCompDetalhes.LimparFalhas;
begin
if (tbl_CompTotal.FieldByName('Cod_CompTotal').Value = null)and(tbl_CompTotal.RecordCount>0) then
begin
tbl_CompTotal.Delete;
end;
if tbl_CompTotal.FieldByName('Total_CompTotal').Value = 0 then
begin
tbl_CompTotal.Delete;
end;
end;

procedure Tfrm_ListaCompDetalhes.cbFornecedoresExit(Sender: TObject);
begin
if cbFornecedores.Text = '' then
begin
cbFornecedores.Text := 'ESCOLHA FORNECEDOR';
end;
end;

procedure Tfrm_ListaCompDetalhes.ApagarFornecedor;
var
item : Integer;
begin
if PEDIDO = 'PEDIDO' then
begin
item := cbFornecedores.ItemIndex;
cbFornecedores.Items.Delete(item);
end;
PEDIDO := '';
end;

procedure Tfrm_ListaCompDetalhes.TotalCompra;
var
soma : Real;
i : Integer;
begin
soma := 0;

with tbl_CompTotal do
begin
tbl_CompTotal.First;
While not tbl_CompTotal.Eof do
begin
for i:=1 to tbl_CompTotal.RecordCount do
begin
soma := soma + tbl_CompTotal.FieldByName('Total_CompTotal').Value;
tbl_CompTotal.Next;
end;
end;
end;
lblTotal.Caption := FormatFloat('R$ ,,,,0.00',soma);

end;

procedure Tfrm_ListaCompDetalhes.Button1Click(Sender: TObject);
var
i : Integer;
begin
tbl_CompTotal.Filtered := false;
tbl_Compras.Filtered := false;
ShowMessage('tem '+IntToStr(tbl_Compras.RecordCount)+' de items cadastrados!');
with tbl_Compras do
begin
tbl_Compras.First;
while not tbl_Compras.Eof do
begin
for i:= 1 to tbl_Compras.RecordCount do
begin
tbl_Compras.Delete;
end;
end;
end;
ShowMessage('AGORA tem '+IntToStr(tbl_Compras.RecordCount)+' de items cadastrados!');
end;

procedure Tfrm_ListaCompDetalhes.tbl_CompTotalAfterPost(DataSet: TDataSet);
Begin
TotalCompra;
end;

procedure Tfrm_ListaCompDetalhes.DeletarCompras;
var
i : Integer;
begin
with tbl_Compras do
begin
tbl_Compras.First;
while not tbl_Compras.Eof do
begin
for i:= 1 to tbl_Compras.RecordCount do
begin
tbl_Compras.Delete;
end;
end;
end;
tbl_CompTotal.Delete;
end;

procedure Tfrm_ListaCompDetalhes.FiltrarCompTotal;
var
data : String;
begin

data := DateToStr(now);
with tbl_CompTotal do
begin
Filtered := false;
Filter := 'Data_CompTotal = '+QuotedStr(data);
Filtered := true;
end;
end;

procedure Tfrm_ListaCompDetalhes.ContasPagar;
begin
Contas;
//Parcelas;


end;

procedure Tfrm_ListaCompDetalhes.Contas;
var
id_cp, id_pc, id_detalhes : Integer;
begin
dia := DateToStr(editData.Date);
dia := formatdatetime('dd',strtodatetime(dia));
  with tbl_ContasPagar do
  begin
    Filtered := false;
    Last;
    if tbl_ContasPagar.RecordCount >0 then
    begin
    id_pc := FieldByName('Cod_ContasPagar').Value + 1;
    end else
    if tbl_ContasPagar.RecordCount = 0 then
    begin
    id_pc := 0;
    end;
    Append;
    Query1.Active := true;
    FieldByName('Cod_ContasPagar').Value  := id_pc;
    FieldByName('Documentos_ContasPagar').Value := editLote.Text;
    FieldByName('Descricao_ContasPagar').Value := 'COMPRA DO DIA '+dia+' FORNECEDOR '+cbFornecedores.Text;
    FieldByName('Valor_ContasPagar').Value := totalpedido;
    FieldByName('Data_ContasPagar').Value := editData.Date;
    FieldByName('Data_VencContasPagar').Value := Data.Date;
    FieldByName('Qtd_ParcelasContasPagar').Value := 1;
    FieldByName('Fornecedor_ContasPagar').Value := cbFornecedores.Text;
      if editSituacao.Text = 'PAGO' then
      begin
        FieldByName('Pago_ContasPagar').Value := 'SIM';
      end ELSE
      if editSituacao.Text <> 'PAGO' then
      begin
        FieldByName('Pago_ContasPagar').Value := 'N�O';
      end;
     FieldByName('Tipo_ContasPagar').Value := 'COMPRA';
     FieldByName('id_Compra').Value := Query1.RecordCount + 1;
     Query1.Close;
     Post;
  end;
    with tbl_ContasDetalhes do
  begin
    Filtered := false;
    Last;
    if tbl_ContasDetalhes.RecordCount >0 then
    begin
    id_detalhes := FieldByName('Cod_ContasDetalhes').Value + 1;
    end else
    if tbl_ContasDetalhes.RecordCount = 0 then
    begin
    id_detalhes := 0;
    end;
    Append;
    FieldByName('Cod_ContasDetalhes').Value := id_detalhes;
    FieldByName('Num_ParcContasDetalhes').Value := 1;
    FieldByName('Valor_ParcContasDetalhes').Value := totalpedido;
    FieldByName('Valor_RestContasDetalhes').Value := totalpedido;
    FieldByName('Data_VencContasDetalhes').Value := Data.Date;
    FieldByName('Status_ContasDetalhes').Value := 'AGUARDANDO';
    FieldByName('id_ContasPagar').Value := id_pc;
    FieldByName('Num_DocContasDetalhes').Value := '0001';
    FieldByName('Fornecedor_ContasDetalhes').Value := cbFornecedores.Text;
    if editSituacao.Text = 'PAGO' then
    begin
      FieldByName('Valor_RestContasDetalhes').Value := 0;
      FieldByName('Data_PagContasDetalhes').Value := editData.Date;
      FieldByName('Data_VencContasDetalhes').Value := Data.Date;
      FieldByName('Status_ContasDetalhes').Value := 'PAGO';
    end;
    Post;
  end;
end;

procedure Tfrm_ListaCompDetalhes.CriarPlanoCompra;
var
  id_pc : Integer;

begin
with tbl_PlanoContas do
begin
  plano := 'COMPRA';
  Filtered := false;
  Last;
  if tbl_PlanoContas.RecordCount >0 then
  begin
  id_pc := FieldByName('Cod_PlanoContas').Value + 1;
  end else
  if tbl_PlanoContas.RecordCount = 0 then
  begin
  id_pc := 1;
  end;
  Filter := 'Descricao_PlanoContas = '+QuotedStr('       '+plano);
  Filtered := true;

  if tbl_PlanoContas.RecordCount = 0 then
  begin
    Filtered := false;
    Append;
    FieldByName('Cod_PlanoContas').Value := id_pc;
    FieldByName('Descricao_PlanoContas').Value := '       '+plano;
    FieldByName('Sequencia_PlanoContas').Value := '0.0.0.0';
    FieldByName('Tipo_PlanoContas').Value := 'A';
    FieldByName('Categoria_PlanoContas').Value := 'DESPESA';
    FieldByName('Ativo_PlanoContas').Value := 'SIM';
    FieldByName('ValorTotal_PlanoContas').Value := 0;
    Post;
  end;
end;
end;



procedure Tfrm_ListaCompDetalhes.ContaCorrente;
var
debito : String;
id_cc, id_pc, id_mov : Integer;
begin
dia := DateToStr(editData.Date);
dia := formatdatetime('dd',strtodatetime(dia));
debito := FloatToStr(cc_debito);
  with tbl_ContaCorrente do
  begin
  Filtered := false;
  Filter := 'Cod_ContaCorrente = '+QuotedStr(debito);
  Filtered := true;

  id_cc := FieldByName('Cod_ContaCorrente').Value;
  end;
  with tbl_Movimentacao do
  begin
  Last;
  id_mov := tbl_Movimentacao.FieldByName('Cod_Movimentacao').Value + 1;
  Append;
  FieldByName('Id_Movimentacao').Value := id_cc;
  FieldByName('Data_Movimentacao').Value := now;
  FieldByName('Historico_Movimentacao').Value := 'COMPRA DO DIA '+dia+' FORNECEDOR '+cbFornecedores.Text;
  FieldByName('Debito_Movimentacao').Value := totalpedido;
  FieldByName('Data_Movimentacao').Value := editData.Date;
  FieldByName('Documento_Movimentacao').Value := editLote.Text;
  FieldByName('PlanoConta_Movimentacao').Value := 'COMPRA';
  Query1.Active := true;
  FieldByName('Id_Compra').Value := Query1.RecordCount + 1;
  plano := 'COMPRA';
  with tbl_PlanoContas do
  begin
    Filtered := false;
    Filter := 'Descricao_PlanoContas = '+QuotedStr('       '+plano);
    Filtered := true;
  id_pc := FieldByName('Cod_PlanoContas').Value;
  end;

  FieldByName('id_PlanoContas').Value := id_pc;
  Post;
  Last;
  id_mov := FieldByName('Cod_Movimentacao').Value;

  end;
  with tbl_Plano do
  begin
  Last;
  Append;
  FieldByName('Descricao_Planos').Value := 'COMPRA';
  FieldByName('Doc_Planos').Value := editLote.Text;
  FieldByName('Valor_Planos').Value := totalpedido;
  FieldByName('Data_Planos').Value := editData.Date;
  FieldByName('DataVenc_Planos').Value := Data.Date;
  FieldByName('Tipo_Planos').Value := 'D';
  FieldByName('id_PlanoContas').Value := id_pc;
  FieldByName('id_Movimentacao').Value := id_mov;
  FieldByName('id_ContaCorrente').Value := id_cc;
  Query1.Active := true;
  FieldByName('id_Compra').Value := Query1.RecordCount + 1;
  Post;
  end;
end;

procedure Tfrm_ListaCompDetalhes.AdicionarDias;
begin
Data.Date := editData.Date + 30;
CalcularPrazo;

end;

procedure Tfrm_ListaCompDetalhes.CalcularData;
begin
if editPrazo.Text <> '' then
begin
Data.Date := editData.Date + strtoint(editPrazo.Text);
end;
end;

procedure Tfrm_ListaCompDetalhes.cbFornecedoresChange(Sender: TObject);
begin
if (cbFornecedores.Text <> 'AVISTA')or(cbFornecedores.Text <> 'DMD')then
begin
editPrazo.Text := FloatToStr(prazo_dias);
cbFormPag.Text := 'TED';
end;
if (cbFornecedores.Text = 'AVISTA')or(cbFornecedores.Text = 'DMD')then
begin
editPrazo.Text := '0';
cbFormPag.Text := 'DINHEIRO';
end;
end;

procedure Tfrm_ListaCompDetalhes.DeletarContasPagar;
Var
id_compra, id_conta : Integer;
begin
id_compra := tbl_CompTotal.FieldByName('Cod_CompTotal').Value;
  with tbl_ContasPagar do
  begin
    Filtered := false;
    Filter := 'Id_Compra = '+QuotedStr(IntToStr(id_compra));
    Filtered := true;
    if tbl_ContasPagar.RecordCount >0 then
    begin
    id_Conta := FieldByName('Cod_ContasPagar').Value;
    end;

  with tbl_ContasDetalhes do
  begin
    Filtered := false;
    Filter := 'Id_ContasPagar = '+QuotedStr(IntToStr(id_Conta));
    Filtered := true;
  end;
   if tbl_ContasPagar.RecordCount >0 then
    begin
    tbl_ContasPagar.Delete;
    end;
     if tbl_ContasDetalhes.RecordCount >0 then
    begin
    tbl_ContasDetalhes.Delete;
    end;


end;
end;

procedure Tfrm_ListaCompDetalhes.DeletarMovimentacaoPlanos;
var
id_compra : Integer;
begin
id_compra := tbl_CompTotal.FieldByName('Cod_CompTotal').Value;
  with tbl_Movimentacao do
  begin
    Filtered := false;
    Filter := 'Id_Compra = '+QuotedStr(IntTostr(id_compra));
    Filtered := true;
  end;

  with tbl_Plano do
  begin
   Filtered := false;
    Filter := 'Id_Compra = '+QuotedStr(IntTostr(id_compra));
    Filtered := true;
  end;
  if (tbl_Movimentacao.RecordCount >0)and(tbl_Plano.RecordCount >0) then
  begin
    tbl_Movimentacao.Delete;
    tbl_Plano.Delete;
  end;
end;

procedure Tfrm_ListaCompDetalhes.SairSemSalvar;
var
i : Integer;
begin
  if ((tbl_Compras.RecordCount >0)and(btnGravar.Enabled = true)) then
  begin
    if (MessageDlg('Deseja realmente sair sem salvar as altera��es?',mtConfirmation,[mbyes,mbno],0)=mryes)then
    begin
      for i:=1 to tbl_Compras.RecordCount do
       begin
        tbl_Compras.Delete;
       end;
    end else
      abort;
  end;
end;

procedure Tfrm_ListaCompDetalhes.AjustarTamanho;
begin
  frm_ListaCompDetalhes.Width := 75;
  frm_ListaCompDetalhes.Height := 715;
end;

end.
