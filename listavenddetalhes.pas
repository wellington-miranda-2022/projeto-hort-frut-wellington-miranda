unit listavenddetalhes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls,
  Buttons, Mask, ComCtrls, DateUtils;

type
  Tfrm_ListaVendaDetalhes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBVendTotal: TDBGrid;
    tbl_VendTotal: TTable;
    tbl_Vendas: TTable;
    ds_VendTotal: TDataSource;
    ds_Vendas: TDataSource;
    tbl_VendasCod_Venda: TIntegerField;
    tbl_VendasCliente_Venda: TStringField;
    tbl_VendasProduto_Venda: TStringField;
    tbl_VendasValor_Venda: TFloatField;
    tbl_VendasTotal_Venda: TFloatField;
    tbl_VendasCod_VendTotal: TIntegerField;
    btnSair: TBitBtn;
    Bevel1: TBevel;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    editData: TDateTimePicker;
    Label1: TLabel;
    Label6: TLabel;
    Data: TDateTimePicker;
    Label7: TLabel;
    Label11: TLabel;
    SpeedButton2: TSpeedButton;
    cbFormPag: TComboBox;
    tbl_VendTotalCodVendTotal: TIntegerField;
    tbl_VendTotalCliente_VendTotal: TStringField;
    tbl_VendTotalUsuario_VendTotal: TStringField;
    tbl_VendTotalTotal_VendTotal: TCurrencyField;
    tbl_VendTotalData_VendTotal: TDateField;
    tbl_VendTotalDataVenc_VendTotal: TDateField;
    tbl_VendTotalPrazo_VendTotal: TIntegerField;
    tbl_VendTotalFormPag_VendTotal: TStringField;
    tbl_VendTotalSituacao_VendTotal: TStringField;
    tbl_VendTotalFrete_VendTotal: TCurrencyField;
    tbl_Produtos: TTable;
    tbl_ProdutosCod_Produto: TIntegerField;
    tbl_ProdutosDescricao_Produto: TStringField;
    tbl_ProdutosTipo_Produto: TStringField;
    tbl_ProdutosFornecedores_Produto: TStringField;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    lblqtd: TLabel;
    lblTotalItens: TLabel;
    editSituacao: TDBEdit;
    DBVendas: TDBGrid;
    editConsulta: TEdit;
    lblFiltro: TLabel;
    RBTudo: TRadioButton;
    editPrazo: TEdit;
    btnAdicionar: TBitBtn;
    Image2: TImage;
    tbl_VendasId_Compra: TIntegerField;
    Button1: TButton;
    tbl_Ajustes: TTable;
    tbl_VendasQtd_Venda: TFloatField;
    tbl_ProdutosQtd_Produto: TFloatField;
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
    Query1: TQuery;
    tbl_ContasReceberId_Venda: TIntegerField;
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
    tbl_ContaCorrente: TTable;
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
    tbl_MovimentacaoId_Compra: TIntegerField;
    tbl_MovimentacaoId_Venda: TIntegerField;
    tbl_PlanoContas: TTable;
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
    tbl_PlanoId_Compra: TIntegerField;
    tbl_PlanoId_Venda: TIntegerField;
    tbl_PlanoContasCod_PlanoContas: TIntegerField;
    tbl_PlanoContasDescricao_PlanoContas: TStringField;
    tbl_PlanoContasSequencia_PlanoContas: TStringField;
    tbl_PlanoContasTipo_PlanoContas: TStringField;
    tbl_PlanoContasCategoria_PlanoContas: TStringField;
    tbl_PlanoContasAtivo_PlanoContas: TStringField;
    tbl_PlanoContasValorTotal_PlanoContas: TCurrencyField;
    EditFrete: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure DBVendTotalCellClick(Column: TColumn);
    procedure DBVendasCellClick(Column: TColumn);
    procedure btnGravarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure DBVendTotalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBVendasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure DBVendTotalColExit(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaEnter(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure RBTudoClick(Sender: TObject);
    procedure editPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure editPrazoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBVendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBVendTotalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Image2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure editDataChange(Sender: TObject);
    procedure cbFormPagChange(Sender: TObject);
    procedure editFreteExit(Sender: TObject);
    

  private
    procedure AssociarCampos;
    procedure Situacao;
    procedure LimparDetalhes;
    procedure PintarSituacao;
    procedure Atualizar;
    procedure CancelarVenda;
    procedure SubtrairQuantidade;
    procedure CalcularDias;
    procedure EditarEstoque;
    procedure Anexar;
    procedure FecharTabelas;
    procedure AbrirTabelas;
    procedure ContasReceber;
    procedure DeletarContasReceber;
    procedure ContaCorrente;
    procedure DeletarMovimentacao;
    procedure SairSemSalvar;
    procedure DeletarPlano;
    procedure CriarPlanoVendas;
    procedure AjustarTamanho;


    public
    totalpedido : Real;
    inicio : Integer;
    qtdcompra : Integer;
    procedure SomarPedidos;
    procedure FiltrarVendTotal;
    procedure FiltrarDetalhes;
  end;

var
  frm_ListaVendaDetalhes: Tfrm_ListaVendaDetalhes;

implementation

uses vendasU, principalU, cidadesU, novopedU, buscarprodutoU, consultapedidosU,
  ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_ListaVendaDetalhes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_ListaVendaDetalhes.btnSairClick(Sender: TObject);
begin
SairSemSalvar;
inserirqtd := 0;
totalprevfrete := 0;
Self.Close;
end;

procedure Tfrm_ListaVendaDetalhes.DataChange(Sender: TObject);
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

procedure Tfrm_ListaVendaDetalhes.FormCreate(Sender: TObject);
begin
editData.Date := now;
LimparDetalhes;
Data.Date := Date;
editPrazo.Text := '0';
AbrirTabelas;
LimparDetalhes;
SomarPedidos;
FiltrarVendTotal;
edit := 1;
end;



procedure Tfrm_ListaVendaDetalhes.btnAdicionarClick(Sender: TObject);
begin
if inserirqtd = 5 then
begin
btnGravar.Enabled := true;
listcliente := tbl_VendTotal.FieldByName('Cliente_VendTotal').AsString;
end else
produto := '';
listcliente := 'ESCOLHA O CLIENTE DESEJADO';
edit := 1;
frm_Vendas := Tfrm_Vendas.Create(self);
frm_Vendas.ShowModal;
try
finally
frm_Vendas.Free;
frm_Vendas := nil;
end;
end;

procedure Tfrm_ListaVendaDetalhes.FiltrarDetalhes;
var
codtotal : Integer;
begin
tbl_VendTotal.Last;
codtotal := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger + 1;

tbl_Vendas.Filtered := false;
tbl_Vendas.Filter := 'Cod_VendTotal = '+Quotedstr(IntToStr(codtotal));
tbl_Vendas.Filtered := true;
SomarPedidos;

end;

procedure Tfrm_ListaVendaDetalhes.DBVendTotalCellClick(Column: TColumn);
var
codtotal : Integer;
cout: Integer;
begin
if (inserirqtd <> 5) then
begin
inicio := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger;
end;
cout := tbl_Vendas.FieldByName('Cod_Venda').AsInteger;
codtotal := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger;

lblTotalItens.Visible := true;
lblQtd.Visible := true;
Label2.Visible := true;
btnDeletar.Enabled := true;
btnEditar.Enabled := false;
edit := 4;
tbl_Vendas.Filtered := false;
tbl_Vendas.Filter := 'Cod_VendTotal = '+Quotedstr(IntToStr(codtotal));
tbl_Vendas.Filtered := true;
PintarSituacao;
SomarPedidos;
CancelarVenda;




end;

procedure Tfrm_ListaVendaDetalhes.DBVendasCellClick(Column: TColumn);
begin
btnEditar.Enabled := true;
btnDeletar.Enabled := true;
if tbl_Vendas.RecordCount>0 then
begin
qtdcompra := tbl_Vendas.FieldByName('Qtd_Venda').AsInteger;
produto := tbl_Vendas.FieldByName('Produto_Venda').Value;
cod := tbl_Vendas.FieldByName('Cod_Venda').Value;
listcliente := tbl_Vendas.FieldByName('Cliente_Venda').Value;
end;
edit := 3;
end;

procedure Tfrm_ListaVendaDetalhes.SomarPedidos;
var
cout : Integer;
somar : Real;
begin
inherited;
if tbl_Vendas.RecordCount = 0 then
begin
lblQtd.Caption := '00';
lblTotalItens.Caption := '00';
end;
cout := tbl_Vendas.RecordCount;
somar := 0;
with tbl_Vendas do
begin
    tbl_Vendas.First;
while not tbl_Vendas.Eof do
begin
somar := (somar + tbl_Vendas.FieldByName('Total_Venda').AsFloat);
tbl_Vendas.Next;
totalpedido := somar;
lblQtd.Visible := true;
lblTotalItens.Visible := true;
lblQtd.Caption := IntToStr(cout);
lblTotalItens.Caption := FormatFloat('R$ #,,,,0.00',somar);
end;
end;
end;

procedure Tfrm_ListaVendaDetalhes.AssociarCampos;
var
prox : Integer;
usuario, situacao : String;
begin
usuario := nome;
tbl_VendTotal.Filtered := false;
tbl_Vendtotal.Last;
prox := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger + 1;
tbl_VendTotal.Append;
tbl_VendTotal.FieldByName('CodVendTotal').AsInteger := prox;
tbl_Vendas.Filtered := true;
tbl_Vendas.Last;
situacao := editSituacao.Text;
tbl_VendTotal.FieldByName('Situacao_VendTotal').Value := situacao;
tbl_VendTotal.FieldByName('Cliente_VendTotal').Value := tbl_Vendas.FieldByName('Cliente_Venda').Value;
tbl_VendTotal.FieldByName('Usuario_VendTotal').Value := usuario;
tbl_VendTotal.FieldByName('Total_VendTotal').Value := totalpedido;
tbl_VendTotal.FieldByName('Data_VendTotal').Value := editData.Date;
tbl_VendTotal.FieldByName('DataVenc_VendTotal').Value := DateToStr(Data.Date);
tbl_VendTotal.FieldByName('Prazo_VendTotal').Value := StrToInt(editPrazo.Text);
tbl_VendTotal.FieldByName('FormPag_VendTotal').Value := cbFormPag.Text;
if editFrete.Text = '' then
begin
editFrete.Text := '0';
end;
tbl_VendTotal.FieldByName('Frete_VendTotal').Value := StrToFloat(editFrete.Text);
cbFormPag.Text := 'Forma de p�gamento';

end;

procedure Tfrm_ListaVendaDetalhes.Situacao;
var
situacao : Integer;
begin
situacao := StrToInt(editPrazo.Text);
if situacao = 0 then
begin
  editSituacao.Text := 'PAGO';
  end
else
if situacao > 0 then
begin
  editSituacao.Text := 'PENDENTE';
 end
else
if situacao < 0 then
  editSituacao.Text := 'EM ATRASO';
 end;

procedure Tfrm_ListaVendaDetalhes.btnGravarClick(Sender: TObject);
var
codigo, codtotal, cout, i : Integer;
begin
codtotal := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger;
codigo := tbl_Vendas.FieldByName('Cod_VendTotal').AsInteger;
inserirqtd := 0;
cout := tbl_Vendas.RecordCount;



  if cbFormPag.Text = 'FORMA DE P�GAMENTO' then
  begin
    MessageDlg('Escolha a forma de p�gamento!',MtWarning,[mbok],0);
  exit;
  end;

  if (tbl_Vendas.RecordCount = 0)and(btnGravar.Enabled = true) then
  begin
    MessageDlg('Coloque items no pedido para continuar!',MtWarning,[mbok],0);
  exit;
  end;

Anexar;

btnGravar.Enabled := false;
MessageDlg('Venda efetuada com sucesso!',MtInformation,[mbok],0);

  if codigo = codtotal then
  begin

    SomarPedidos;
    tbl_VendTotal.Edit;
    tbl_VendTotal.FieldByName('Data_VendTotal').Value := editData.Date;
    tbl_VendTotal.FieldByName('Total_VendTotal').Value := totalpedido;
    tbl_VendTotal.Post;

   end else

      listcliente := 'ESCOLHA O CLIENTE DESEJADO';
      produto := '';
      SomarPedidos;
      AssociarCampos;
      CriarPlanoVendas;
      Situacao;
      ContasReceber;

      if editSituacao.Text = 'PAGO' then
      begin
        ContaCorrente;
      end;

tbl_VendTotal.Post;
tbl_Vendas.First;

      for i:= 1 to cout do
      begin
        SubtrairQuantidade;
      end;

        editFrete.Text :='0,00';
        totalprevfrete := 0;
        Data.Date := date;
        editPrazo.Text := '0';
        FiltrarVendTotal;

end;

procedure Tfrm_ListaVendaDetalhes.SpeedButton2Click(Sender: TObject);
begin
inserirqtd := 4;
frm_Cidades := Tfrm_Cidades.Create(self);
frm_Cidades.ShowModal;
try
finally
frm_Cidades.Free;
frm_Cidades := nil;
end;
end;

procedure Tfrm_ListaVendaDetalhes.btnDeletarClick(Sender: TObject);
var
i : Integer;
codigo, codtotal : Integer;
cout: Integer;
begin
cout:= tbl_Vendas.RecordCount;
codtotal := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger;
codigo := tbl_Vendas.FieldByName('Cod_VendTotal').AsInteger;
begin

if edit = 3 then
begin
if tbl_Vendas.RecordCount = 0 then
begin
MessageDlg('N�o a registros a serem deletados',MtWarning,[mbok],0);
exit;
end;
tbl_Vendas.Delete;
if codigo = codtotal then
begin
SomarPedidos;
tbl_VendTotal.Edit;
tbl_VendTotal.FieldByName('Total_VendTotal').Value := totalpedido;
tbl_VendTotal.Post;
end;
exit;
end;
if edit = 4 then
begin
if tbl_VendTotal.RecordCount = 0 then
begin
MessageDlg('N�o a vendas a serem apagadas!',MtWarning,[mbok],0);
exit;
end;
DeletarContasReceber;
DeletarMovimentacao;
DeletarPlano;
tbl_VendTotal.Delete;
for i:= 1 to cout do
begin
tbl_Vendas.Delete;
end;
edit := 6;
end;
MessageDlg('Registro deletado com Sucesso!',MtInformation,[mbok],0);
end;
end;


procedure Tfrm_ListaVendaDetalhes.btnEditarClick(Sender: TObject);
begin
edit := 2;
if btnEditar.Enabled = true then
begin
listcliente := tbl_Vendas.FieldByName('Cliente_Venda').Value;
end;
frm_Vendas := Tfrm_Vendas.Create(self);
frm_Vendas.ShowModal;
try
finally
frm_Vendas.Free;
frm_Vendas := nil;
end;
end;

procedure Tfrm_ListaVendaDetalhes.LimparDetalhes;
begin
tbl_Vendas.Filtered := false;
tbl_Vendas.Filter := 'Cod_VendTotal = 10000000';
tbl_Vendas.Filtered := true;
end;

procedure Tfrm_ListaVendaDetalhes.DBVendTotalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
 pt: TGridcoord;
begin
 pt := DBVendTotal.MouseCoord (x, y);
 if pt.y = 0 then
 begin
 DBVendTotal.Cursor := crHandPoint
 end else
 DBVendTotal.Cursor := crDefault;
end;

procedure Tfrm_ListaVendaDetalhes.DBVendasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
 pt: TGridcoord; 
begin
 pt := DBVendas.MouseCoord (x, y);
 if pt.y = 0 then
 begin
 DBVendas.Cursor := crHandPoint
 end else
 DBVendas.Cursor := crDefault;
end;


procedure Tfrm_ListaVendaDetalhes.PintarSituacao;
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
editSituacao.Font.Color := clMaroon;

end;
end;

procedure Tfrm_ListaVendaDetalhes.Atualizar;
var
codigo : Integer;
begin

codigo := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger;

tbl_Vendas.Filtered := false;
tbl_Vendas.Filter := 'Cod_VendTotal = '+Quotedstr(IntToStr(codigo));
tbl_Vendas.Filtered := true;
SomarPedidos;

end;

procedure Tfrm_ListaVendaDetalhes.FormShow(Sender: TObject);
begin

   Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 30;

DBVendTotal.Columns[0].Title.alignment := taCenter;
DBVendTotal.Columns[1].Title.alignment := taCenter;
DBVendTotal.Columns[2].Title.alignment := taCenter;
DBVendTotal.Columns[3].Title.alignment := taCenter;
DBVendTotal.Columns[4].Title.alignment := taCenter;
DBVendTotal.Columns[5].Title.alignment := taCenter;
DBVendTotal.Columns[6].Title.alignment := taCenter;
DBVendTotal.Columns[7].Title.alignment := taCenter;
DBVendTotal.Columns[8].Title.alignment := taCenter;
DBVendTotal.Columns[9].Title.alignment := taCenter;

DBVendas.Columns[0].Title.alignment := taCenter;
DBVendas.Columns[1].Title.alignment := taCenter;
DBVendas.Columns[2].Title.alignment := taCenter;
DBVendas.Columns[3].Title.alignment := taCenter;
DBVendas.Columns[4].Title.alignment := taCenter;

  inserirqtd := 0;
  if btnGravar.Enabled <> false then
  begin
   editFrete.Text := FormatFloat('R$ #,,,,0.00',totalprevfrete);
  end;

if edit = 0 then
 begin
    FiltrarDetalhes;
    btnGravar.Enabled := true;
    lblQtd.Visible := true;
    label2.Visible := true;
    lblTotalItens.Visible := true;
    editSituacao.Text := '';
 end;
  
if (edit = 2)or(inserirqtd = 5) then
 begin
    Atualizar;
    //EditarEstoque;
    btnEditar.Enabled := false;    
 end;

 AjustarTamanho;

end;

procedure Tfrm_ListaVendaDetalhes.CancelarVenda;
var
codigo: Integer;
begin

codigo :=   tbl_Vendas.RecordCount;
if (codigo = 0)and(tbl_Vendas.Filtered = true)and(edit < 6)and(tbl_Vendas.RecordCount>0)then
begin
if MessageDlg('Voc� ainda tem uma venda em aberto. Deseja cancelar?',MtInformation,[mbyes,mbno],0)=mryes then
begin
inserirqtd := 0;
tbl_VendTotal.Locate('CodVendTotal',IntToStr(inicio),[]);
tbl_VendTotal.Delete;
edit := 0;
frm_ListaVendaDetalhes.Close;
frm_ListaVendaDetalhes := Tfrm_ListaVendaDetalhes.Create(Self);
frmPrincipal.Hide;
frmPrincipal.Show;
frm_ListaVendaDetalhes.ShowModal;



end else
tbl_VendTotal.Locate('CodVendTotal',IntToStr(inicio),[]);
inserirqtd := 5;
abort;
end;
end;

procedure Tfrm_ListaVendaDetalhes.DBVendTotalColExit(Sender: TObject);
var
codigo,cod,codtotal : Integer;
begin

codigo := tbl_Vendas.RecordCount;
codtotal := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger;
cod := tbl_Vendas.FieldByName('Cod_VendTotal').AsInteger;

if (cod <> codtotal)and(btnGravar.Enabled = true) then
begin
MessageDlg('Clique em gravar para continuar!',MtInformation,[mbok],0);
end;

if (codigo = 0) and (lblQtd.Visible) = true then
begin
CancelarVenda;
end;
if (inserirqtd = 5)and(codigo > 0) then
begin
MessageDlg('Clique em gravar para continuar!',MtInformation,[mbok],0);
tbl_VendTotal.Locate('CodVendTotal',IntToStr(inicio),[])
end;

end;

procedure Tfrm_ListaVendaDetalhes.SubtrairQuantidade;

var
qtdestoque, qtdvenda, total : Integer;
descricao, nome : String;
begin

tbl_Vendas.First;
descricao := Trim(tbl_Vendas.FieldByName('Produto_Venda').AsString);
qtdvenda := tbl_Vendas.FieldByName('Qtd_Venda').AsInteger;

tbl_Produtos.Locate('Descricao_Produto',descricao,[loPartialKey]);

qtdestoque := tbl_Produtos.FieldByName('Qtd_Produto').Value;
nome := tbl_Produtos.FieldByName('Descricao_Produto').Value;

if tbl_Produtos.RecordCount = 0 then
begin
ShowMessage('Ouve um problema com a descri��o do produto '+descricao+', por favor contate o suporte!');
end;


total := qtdestoque - qtdvenda;
tbl_Produtos.Edit;
tbl_Produtos.FieldByName('Qtd_Produto').Value := total;
tbl_Produtos.Post;


qtdestoque := tbl_Produtos.FieldByName('Qtd_Produto').Value;

tbl_Vendas.Next;


end;

procedure Tfrm_ListaVendaDetalhes.editConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text)= 0 then
begin
editConsulta.Text := 'DIGITE SUA PESQUISA';
tbl_VendTotal.Filtered := false;
editConsulta.SelectAll;
RBTudo.Checked := true;
end else
if editConsulta.Text <> '' then
begin
RBTudo.Checked := false;
tbl_VendTotal.Close;
tbl_VendTotal.Filter := 'Cliente_VendTotal = ' + Quotedstr(editConsulta.Text+'*');
tbl_VendTotal.Open;
tbl_VendTotal.Filtered := true;
listcliente :=  tbl_VendTotal.FieldByName('Cliente_VendTotal').AsString;
end;
end;

procedure Tfrm_ListaVendaDetalhes.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure Tfrm_ListaVendaDetalhes.editConsultaEnter(Sender: TObject);
begin
editConsulta.Color := clSkyblue;
end;

procedure Tfrm_ListaVendaDetalhes.editConsultaExit(Sender: TObject);
begin
editConsulta.Color := clWhite;
end;

procedure Tfrm_ListaVendaDetalhes.RBTudoClick(Sender: TObject);
begin
if rbTudo.Checked = true then
begin
tbl_VendTotal.Filtered := false;
end else
FiltrarVendTotal;
end;

procedure Tfrm_ListaVendaDetalhes.editPrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
Key := #0;
end;

procedure Tfrm_ListaVendaDetalhes.editPrazoExit(Sender: TObject);
begin
CalcularDias;
end;

procedure Tfrm_ListaVendaDetalhes.CalcularDias;
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

procedure Tfrm_ListaVendaDetalhes.EditarEstoque;
var
resultado : Integer;
produtoedit : String;
novavenda : Integer;

begin
tbl_Vendas.Locate('Cod_Venda',IntToStr(cod),[]);
produtoedit := tbl_Vendas.FieldByName('Produto_Venda').Value;
novavenda := tbl_Vendas.FieldByName('Qtd_Venda').Value;
tbl_Produtos.Filtered := false;
tbl_Produtos.Filter := 'Descricao_Produto = '+Quotedstr(produtoedit);
tbl_Produtos.Filtered := true;


resultado := tbl_Produtos.FieldByName('Qtd_Produto').AsInteger + qtdcompra;
resultado := resultado - novavenda;

tbl_Produtos.Edit;
tbl_Produtos.FieldByName('Qtd_Produto').Value := resultado;
tbl_Produtos.Post;

ShowMessage('o nome do produto � '+produtoedit);
ShowMessage('a quantidade antiga � '+IntToStr(novavenda));
ShowMessage('agora � '+IntToStr(resultado));

end;


procedure Tfrm_ListaVendaDetalhes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_ESCAPE then
self.Close;
end;

procedure Tfrm_ListaVendaDetalhes.Anexar;
begin
if MessageDlg('Deseja anexar essa venda a um pedido?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
frm_NovoPed := Tfrm_NovoPed.Create(Self);
frm_NovoPed.ShowModal;
try
finally
frm_NovoPed.Free;
frm_NovoPed := nil;
end;
end;
end;

procedure Tfrm_ListaVendaDetalhes.DBVendasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBVendas.DataSource.Dataset.RecNo)then
begin
DBVendas.Canvas.Brush.Color := $00E9E9E9;
end else
DBVendas.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBVendas.Canvas.Brush.Color := clHighlight;
DBVendas.Canvas.Font.Color := clWhite;
DBVendas.Canvas.Font.Style := [fsBold];
end;
DBVendas.Canvas.FillRect(Rect);
DBVendas.DefaultDrawColumnCell( Rect, DataCol, Column, State);

end;

procedure Tfrm_ListaVendaDetalhes.DBVendTotalDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBVendTotal.DataSource.Dataset.RecNo)then
begin
DBVendTotal.Canvas.Brush.Color := $00E9E9E9;
end else
DBVendTotal.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBVendTotal.Canvas.Brush.Color := clHighlight;
DBVendTotal.Canvas.Font.Color := clWhite;
DBVendTotal.Canvas.Font.Style := [fsBold];
end;
DBVendTotal.Canvas.FillRect(Rect);
DBVendTotal.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_ListaVendaDetalhes.Image2Click(Sender: TObject);
begin
frm_ConsultaPedidos := Tfrm_ConsultaPedidos.Create(Self);
frm_ConsultaPedidos.Show;
Atualizar;

end;

procedure Tfrm_ListaVendaDetalhes.Button1Click(Sender: TObject);
begin
tbl_Vendas.Filtered := false;
tbl_VendTotal.Filtered := false;
ShowMessage(FloatToStr(perc_venda));
end;

procedure Tfrm_ListaVendaDetalhes.FiltrarVendTotal;
var
data : String;
begin

data := DateToStr(editData.Date);
with tbl_VendTotal do
begin
Filtered := false;
Filter := 'Data_VendTotal = '+QuotedStr(data);
Filtered := true;
end;
end;

procedure Tfrm_ListaVendaDetalhes.editDataChange(Sender: TObject);
begin
FiltrarVendTotal;
RBTudo.Checked := false;
end;

procedure Tfrm_ListaVendaDetalhes.cbFormPagChange(Sender: TObject);
begin

  if (cbFormPag.Text = 'TED')or(cbFormPag.Text = 'CHEQUE')then
  begin
    editPrazo.Text := '30';
  end;

  if cbFormPag.Text = 'DINHEIRO' then
  begin
    editPrazo.Text := '0';
  end;

CalcularDias;

end;

procedure Tfrm_ListaVendaDetalhes.FecharTabelas;
begin
tbl_Vendas.Active := false;
tbl_VendTotal.Active := false;
tbl_Produtos.Active := false;
tbl_Ajustes.Active := false;
tbl_ContasReceber.Active := false;
tbl_Baixa.Active := false;
tbl_ContaCorrente.Active := false;
tbl_Movimentacao.Active := false;
tbl_PlanoContas.Active := false;
tbl_Plano.Active := false;
end;

procedure Tfrm_ListaVendaDetalhes.AbrirTabelas;
begin
tbl_Vendas.Active := true;
tbl_VendTotal.Active := true;
tbl_Produtos.Active := true;
tbl_Ajustes.Active := true;
tbl_ContasReceber.Active := true;
tbl_Baixa.Active := true;
tbl_ContaCorrente.Active := true;
tbl_Movimentacao.Active := true;
tbl_PlanoContas.Active := true;
tbl_Plano.Active := true;
end;

procedure Tfrm_ListaVendaDetalhes.ContasReceber;
var
dia, contacorrente, formpag : String;
prox, id_baixa : Integer;
begin
Query1.Active := true;
dia := DateToStr(editData.Date);
dia := formatdatetime('dd',strtodatetime(dia));

  with tbl_ContasReceber do
  begin
    Last;
    if tbl_ContasReceber.RecordCount =0 then
    begin
      prox := 1;
    end else
    if tbl_ContasReceber.RecordCount > 0 then
    begin
      prox := FieldByName('Cod_ContasReceber').Value + 1;
    end;

    Append;
    FieldByName('Cod_ContasReceber').Value := prox;
    FieldByName('Cliente_ContasReceber').Value := tbl_VendTotal.FieldByName('Cliente_VendTotal').Value;
    FieldByName('Num_DocContasReceber').Value := '00000'+inttostr(Query1.RecordCount + 1);
    FieldByName('Qtd_ParcContasReceber').Value := 1;
    FieldByName('Valor_ContasReceber').Value := totalpedido;
    FieldByName('Data_ContasReceber').Value := editData.Date;
    FieldByName('Tipo_ReceitaContasReceber').Value := 'Venda';
    FieldByName('Valor_ContasReceber').Value := totalpedido;
    FieldByName('Obs_ContasReceber').Value := 'Venda do dia '+dia+' cliente '+tbl_Vendas.FieldByName('Cliente_Venda').Value+' ira pagar 1x de '+FormatFloat('R$ #,,,,0.00',totalpedido);
    FieldByName('Id_Venda').Value := Query1.RecordCount + 1;
    FieldByName('Data_VencContasReceber').Value := Data.Date;

    if editSituacao.Text = 'PAGO' then
    begin
      FieldByName('Recebido_ContasReceber').Value := totalpedido;
      FieldByName('Falta_ContasReceber').Value := 0;
      FieldByName('Quitado_ContasReceber').Value := editData.Date;
    end else
    begin
      FieldByName('Recebido_ContasReceber').Value := 0;
      FieldByName('Falta_ContasReceber').Value := totalpedido;
    end;


    Post;
  end;

  with tbl_ContaCorrente do
  begin
    Filtered := false;
    Filter := 'Cod_ContaCorrente = '+QuotedStr(FloatToStr(cc_credito));
    Filtered := true;
    if tbl_ContaCorrente.RecordCount >0 then
    begin
      contacorrente := FieldByName('Descricao_ContaCorrente').Value;
    end;
  end;


  if editSituacao.Text = 'PAGO' then
  begin
    with tbl_Baixa do
    begin
        Filtered := false;
        Last;
          if tbl_Baixa.RecordCount >0 then
          begin
            id_Baixa := FieldByName('Cod_Baixa').Value + 1;
          end else
          if tbl_Baixa.RecordCount = 0 then
          begin
            id_Baixa := 1;
          end;


        Insert;
        formpag := cbFormPag.Text;
        FieldByName('Cod_Baixa').Value := id_Baixa;
        FieldByName('Doc_Baixa').Value := '00000'+inttostr(Query1.RecordCount + 1);
        FieldByName('Tipo_PagBaixa').Value := formpag;
        FieldByName('Conta_CorrenteBaixa').Value := contacorrente;
        FieldByName('Juros_Baixa').Value := 0;
        FieldByName('Variacao_Baixa').Value := 0;
        FieldByName('Desconto_Baixa').Value := 0;
        FieldByName('Valor_Baixa').Value := totalpedido;
        FieldByName('Recebimento_Baixa').Value := totalpedido;
        FieldByName('Valor_Baixa').Value := totalpedido;
        FieldByName('Id_ContasReceber').Value := prox;
        FieldByName('Data_Baixa').Value := editData.Date;
        Post;
      end;
    end;
end;

procedure Tfrm_ListaVendaDetalhes.DeletarContasReceber;
var
id_venda, id_conta : Integer;
begin
id_venda := tbl_VendTotal.FieldByName('CodVendTotal').Value;
  with tbl_ContasReceber do
  begin
   Filtered := false;
   Filter := 'Id_Venda = '+QuotedStr(IntToStr(id_venda));
   Filtered := true;
   if tbl_ContasReceber.RecordCount >0 then
   begin
    id_conta := FieldByName('Cod_ContasReceber').Value;
    Delete;
   end;
  end;

  with tbl_Baixa do
  begin
   Filtered := false;
   Filter := 'Id_ContasReceber = '+QuotedStr(IntToStr(id_conta));
   Filtered := true;
   if tbl_Baixa.RecordCount >0 then
   begin
    Delete;
   end;

  end;
end;

procedure Tfrm_ListaVendaDetalhes.ContaCorrente;
var
credito, dia, plano : String;
id_cc, id_pc, id_mov : Integer;
begin
dia := DateToStr(editData.Date);
dia := formatdatetime('dd',strtodatetime(dia));
credito := FloatToStr(cc_credito);
  with tbl_ContaCorrente do
  begin
  Filtered := false;
  Filter := 'Cod_ContaCorrente = '+QuotedStr(credito);
  Filtered := true;

  id_cc := FieldByName('Cod_ContaCorrente').Value;
  end;
  with tbl_Movimentacao do
  begin
  Append;
  FieldByName('Id_Movimentacao').Value := id_cc;
  FieldByName('Historico_Movimentacao').Value := 'VENDA DO DIA '+dia+' FORNECEDOR '+tbl_vendas.FieldByName('Cliente_Venda').AsString;
  FieldByName('Credito_Movimentacao').Value := totalpedido;
  FieldByName('Data_Movimentacao').Value := editData.Date;
  FieldByName('Documento_Movimentacao').Value := '00000'+tbl_VendTotal.FieldByName('CodVendTotal').AsString;
  FieldByName('PlanoConta_Movimentacao').Value := 'VENDA';
    Query1.Active := true;
  FieldByName('Id_Venda').Value := Query1.RecordCount + 1;
  
  plano := 'VENDA';


  with tbl_PlanoContas do
  begin
    Filtered := false;
    Filter := 'Descricao_PlanoContas = '+QuotedStr('       '+plano);
    Filtered := true;

  end;
  if tbl_PlanoContas.RecordCount = 0 then
  begin
  //CriarPlanoConta;
  end;
  if tbl_PlanoContas.RecordCount >0 then
  begin
  id_pc := tbl_PlanoContas.FieldByname('Cod_PlanoContas').Value;
  FieldByName('id_PlanoContas').Value := id_pc;
  tbl_Movimentacao.Post;

  end;
  end;
  with tbl_Plano do
  begin
  if tbl_Plano.RecordCount >0 then
  begin
  id_mov := tbl_Movimentacao.FieldByName('Cod_Movimentacao').Value;
  end else
  if tbl_Plano.RecordCount = 0 then
  begin
  id_mov := 1;
  end;
  Last;
  Append;
  FieldByName('Descricao_Planos').Value := 'VENDA';
  FieldByName('Doc_Planos').Value := '00000'+tbl_VendTotal.FieldByName('CodVendTotal').AsString;
  FieldByName('Valor_Planos').Value := totalpedido;
  FieldByName('Data_Planos').Value := editData.Date;
  FieldByName('DataVenc_Planos').Value := Data.Date;
  FieldByName('Tipo_Planos').Value := 'R';
  FieldByName('id_PlanoContas').Value := id_pc;
  FieldByName('id_Movimentacao').Value := id_mov;
  FieldByName('id_ContaCorrente').Value := id_cc;
  Query1.Active := true;
  FieldByName('Id_Venda').Value := Query1.RecordCount + 1;
  Post;
  end;
end;


procedure Tfrm_ListaVendaDetalhes.DeletarMovimentacao;
var
id_venda : String;
begin
id_venda := tbl_VendTotal.FieldByName('CodVendTotal').AsString;
  with tbl_Movimentacao do
  begin
    Filtered := false;
    Filter := 'Id_Venda = '+QuotedStr(id_venda);
    Filtered := true;
  end;
   if tbl_Movimentacao.RecordCount >0 then
  begin
  tbl_Movimentacao.Delete;
  end;
end;

procedure Tfrm_ListaVendaDetalhes.editFreteExit(Sender: TObject);
begin
if Trim(editFrete.Text) = '' then
begin
editFrete.Text := 'R$ 00,00';
end;
end;

procedure Tfrm_ListaVendaDetalhes.SairSemSalvar;
var
i : Integer;
begin
if ((tbl_Vendas.RecordCount >0)and(btnGravar.Enabled = true)) then
begin
  if (MessageDlg('Deseja realmente sair sem salvar as altera��es?',mtConfirmation,[mbyes,mbno],0)=mryes)then
  begin
    for i:=1 to tbl_Vendas.RecordCount do
    begin
      tbl_Vendas.Delete;
    end;
  end else
    abort;
end;

end;


procedure Tfrm_ListaVendaDetalhes.DeletarPlano;
var
id_venda : String;
begin
id_venda := tbl_VendTotal.FieldByName('CodVendTotal').AsString;

  with tbl_Plano do
  begin
    Filtered := false;
    Filter := 'Id_Venda = '+Quotedstr(id_venda);
    Filtered := true;
  end;

  if tbl_Plano.RecordCount >0 then
  begin

    tbl_Plano.Delete;

  end;


end;

procedure Tfrm_ListaVendaDetalhes.CriarPlanoVendas;
var
  id_pc : Integer;
  plano : String;

begin
with tbl_PlanoContas do
begin
  plano := 'VENDA';
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
    FieldByName('Categoria_PlanoContas').Value := 'RECEITA';
    FieldByName('Ativo_PlanoContas').Value := 'SIM';
    FieldByName('ValorTotal_PlanoContas').Value := 0;
    Post;
  end;
end;
end;

procedure Tfrm_ListaVendaDetalhes.AjustarTamanho;
begin
frm_ListaVendaDetalhes.Width := 75;
frm_ListaVendaDetalhes.Height := 715;
end;

end.
