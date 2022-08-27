unit consultapedidosU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_ConsultaPedidos = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCod_PedTotal: TIntegerField;
    tbl_ModeloTotal_PedTotal: TCurrencyField;
    tbl_ModeloCodVenda_PedTotal: TIntegerField;
    tbl_ModeloCliente_PedTotal: TStringField;
    tbl_ModeloUsuario_PedTotal: TStringField;
    tbl_ModeloData_PedTotal: TDateField;
    tbl_ModeloFrete_PedTotal: TCurrencyField;
    tbl_ModeloStatus_PedTotal: TStringField;
    tbl_Items: TTable;
    tbl_ItemsCod_PedTotal: TIntegerField;
    tbl_ItemsCod_Produto: TIntegerField;
    tbl_ItemsProduto_Pedido: TStringField;
    tbl_ItemsValor_Pedido: TCurrencyField;
    tbl_ItemsTotal_Pedido: TCurrencyField;
    tbl_ItemsCliente_Pedido: TStringField;
    tbl_ItemsData_Pedido: TDateField;
    tbl_ItemsUsuario_Pedido: TStringField;
    tbl_ItemsFornecedor_Pedido: TStringField;
    tbl_Fornecedores: TTable;
    tbl_Compras: TTable;
    tbl_ComprasCod_Compra: TIntegerField;
    tbl_ComprasCod_CompTotal: TIntegerField;
    tbl_ComprasProduto_Compra: TStringField;
    tbl_ComprasUnid_Compra: TStringField;
    tbl_ComprasValor_Compra: TCurrencyField;
    tbl_ComprasTotal_Compra: TCurrencyField;
    tbl_ComprasId_Pedido: TIntegerField;
    tbl_ItemsQuantidade_Pedido: TFloatField;
    tbl_ComprasQuantidade_Compra: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ChamarVenda;

    public
    forn : String;

    procedure Venda;
    procedure Aviso;
    procedure Compra;
    procedure FiltrarVendas;
    procedure InserirDadosVenda;
    procedure FiltrarPedidos;

  end;

var
  frm_ConsultaPedidos: Tfrm_ConsultaPedidos;

implementation

uses listacompdetalhesU, listavenddetalhes, principalU, chamarvendaU;

{$R *.dfm}

procedure Tfrm_ConsultaPedidos.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := false;
tablepadrao.Active := true;
tbl_Items.Active := true;
tbl_Fornecedores.Active := true;
tbl_Compras.Active := true;
// Aviso que não há pedidos cadastrados.
Aviso;
FiltrarPedidos;
end;

procedure Tfrm_ConsultaPedidos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
Compra;
ChamarVenda;
end;

procedure Tfrm_ConsultaPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
tbl_Items.Active := false;
tablepadrao.Active := false;
tbl_Fornecedores.Active := false;
tbl_Compras.Active := true;
end;




procedure Tfrm_ConsultaPedidos.Aviso;
begin
if tbl_Modelo.RecordCount = 0 then
begin
MessageDlg('Não há pedidos cadastrados no sistema!',MtInformation,[mbok],0);
end;
end;


procedure Tfrm_ConsultaPedidos.Compra;
var
cod, codigo, item, i : Integer;
begin
  inherited;
if frm_ListaCompDetalhes <> nil then
begin
forn := AnsiUpperCase(frm_ListaCompDetalhes.cbFornecedores.Text);
item := frm_ListaCompDetalhes.cbFornecedores.ItemIndex;
if tbl_Modelo.RecordCount >0 then
begin
cod := tbl_Modelo.FieldByName('Cod_PedTotal').Value;
end else
if tbl_Modelo.RecordCount = 0 then
begin
exit;
end;
with tbl_Items do
begin
Filtered := false;
Filter := 'Cod_PedTotal = '+Quotedstr(IntToStr(cod))+'and Fornecedor_Pedido = '+QuotedStr(forn);
Filtered := true;

if (tbl_Items.RecordCount = 0)and(forn <> '') then
begin
MessageDlg('O fornecedor '+forn+' não está presente nesse pedido, será colocado outro!',MtWarning,[mbok],0);
tbl_Items.Filtered := false;
frm_ListaCompDetalhes.cbFornecedores.Items.Delete(item);
frm_ListaCompDetalhes.cbFornecedores.ItemIndex := 1;
DBGrid1DblClick(tbl_items);
if forn = '' then
begin
frm_ListaCompDetalhes.btnGravar.Enabled := false;
frm_ListaCompDetalhes.cbFornecedores.Enabled := true;
frm_ListaCompDetalhes.Hide;
frm_ListaCompDetalhes.Show;
frm_ListaCompDetalhes.editData.Date := StrToDate(frm_ListaCompDetalhes.dataEmissao);
end;
exit;


frm_ListaCompDetalhes.lblqtd.Caption := (IntToStr(RecordCount));
end;

tbl_Items.First;
frm_ListaCompDetalhes.tbl_CompTotal.Filtered := false;
frm_ListaCompDetalhes.tbl_CompTotal.Last;
frm_ListaCompDetalhes.tbl_Compras.Filtered := false;
frm_ListaCompDetalhes.tbl_Compras.Last;

if frm_ListaCompDetalhes.tbl_CompTotal.RecordCount = 0 then
begin
item := 1;
end else
begin
item := frm_ListaCompDetalhes.tbl_CompTotal.FieldByName('Cod_CompTotal').Value + 1;
end;

for i:=1 to tbl_Items.RecordCount do
begin
if frm_ListaCompDetalhes.tbl_Compras.RecordCount = 0 then
begin
codigo := 1;
end else
begin
codigo := frm_ListaCompDetalhes.tbl_Compras.FieldByName('Cod_Compra').Value;
end;
frm_ListaCompDetalhes.tbl_Compras.Insert;
frm_ListaCompDetalhes.tbl_Compras.FieldByName('Cod_Compra').Value := codigo + 1;
frm_ListaCompDetalhes.tbl_Compras.FieldByName('Cod_CompTotal').Value := item;
frm_ListaCompDetalhes.tbl_Compras.FieldByName('Produto_Compra').Value := AnsiUpperCase(tbl_Items.FieldByName('Produto_Pedido').Value);
frm_ListaCompDetalhes.tbl_Compras.FieldByName('Quantidade_Compra').Value := tbl_Items.FieldByName('Quantidade_Pedido').Value;
frm_ListaCompDetalhes.tbl_Compras.FieldByName('Valor_Compra').Value := tbl_Items.FieldByName('Valor_Pedido').Value;
frm_ListaCompDetalhes.tbl_Compras.FieldByName('Total_Compra').Value := tbl_Items.FieldByName('Total_Pedido').Value;
frm_ListaCompDetalhes.tbl_Compras.FieldByName('Id_Pedido').Value := tbl_Items.FieldByName('Cod_PedTotal').Value;
frm_ListaCompDetalhes.tbl_Compras.Post;
tbl_Items.Next;
end;
with frm_ListaCompDetalhes.tbl_Compras do
begin
Filtered := false;
Filter := 'Cod_CompTotal = '+Quotedstr(IntToStr(item));
Filtered := true;
ShowMessage('Forão encontrados '+IntToStr(item)+' itens no pedido.');
end;

frm_ListaCompDetalhes.btnGravar.Enabled := true;
frm_ListaCompDetalhes.Hide;
frm_ListaCompDetalhes.Show;
frm_ListaCompDetalhes.lblqtd.Visible := true;
frm_ListaCompDetalhes.lblTotalItens.Visible := true;
frm_ListaCompDetalhes.Label2.Visible := true;
frm_ListaCompDetalhes.PEDIDO := 'PEDIDO';
frm_ListaCompDetalhes.Image2.Enabled := false;
frm_ListaCompDetalhes.cbFornecedores.Enabled := false;
self.Close;
if forn = '' then
begin
frm_ListaCompDetalhes.cbFornecedores.Enabled := false;
frm_ListaCompDetalhes.btnGravar.Enabled := false;
end;
end;
end;
end;
procedure Tfrm_ConsultaPedidos.Venda;
begin
  if (tbl_Modelo.RecordCount >0)and(frm_ListaVendaDetalhes <> nil) then
  begin
  FiltrarVendas;
    if tbl_Compras.RecordCount = 0 then
    begin
      MessageDlg('Não a compras feitas para esse pedido!',MtWarning,[mbok],0);
      exit;
    end;
  InserirDadosVenda;



  end;


end;

procedure Tfrm_ConsultaPedidos.FiltrarVendas;
var
id_pedido : Integer;
begin

id_pedido := tbl_Modelo.FieldByName('Cod_PedTotal').Value;

With tbl_Compras do
begin
  Filtered := false;
  Filter := 'Id_Pedido = '+Quotedstr(IntToStr(id_pedido));
  Filtered := true;
  First;
end;

end;

procedure Tfrm_ConsultaPedidos.InserirDadosVenda;
var
i, id_vendtotal, id_venda : Integer;
v_venda, qtd_venda, v_total : Real;
begin

with frm_ListaVendaDetalhes.tbl_Vendas do
begin
First;
for i:=1 to tbl_Compras.RecordCount do
begin

Filtered := false;
Append;
id_venda := frm_ListaVendaDetalhes.tbl_Vendas.RecordCount;
frm_ListaVendaDetalhes.tbl_VendTotal.Filtered := false;
id_vendtotal := frm_ListaVendaDetalhes.tbl_VendTotal.RecordCount;
FieldByName('id_Compra').Value := tbl_Compras.FieldByName('Id_Pedido').Value;
FieldByName('Cod_Venda').Value := id_venda+1;
FieldByName('Cod_VendTotal').Value := id_vendtotal + 1;
FieldByName('Cliente_Venda').Value := tbl_Modelo.FieldByName('Cliente_PedTotal').Value;
FieldByName('Produto_Venda').Value := Trim(tbl_Compras.FieldByName('Produto_Compra').Value);

qtd_venda := tbl_Compras.FieldByName('Quantidade_Compra').Value;
v_venda := tbl_Compras.FieldByName('Valor_Compra').Value + (tbl_Compras.FieldByName('Valor_Compra').Value * perc_venda / 100);
v_total := v_venda * qtd_venda;


FieldByName('Qtd_Venda').Value :=  qtd_venda;
FieldByName('Valor_Venda').Value := v_venda;
FieldByName('Total_Venda').Value := v_total;
Post;
Next;
tbl_Compras.Next;
end;
end;
with frm_ListaVendaDetalhes.tbl_Vendas do
begin
id_vendtotal := frm_ListaVendaDetalhes.tbl_VendTotal.RecordCount;
Filtered := false;
Filter := 'Cod_VendTotal = '+Quotedstr(IntToStr(id_vendtotal + 1));
Filtered := true;
ShowMessage('Forão encontrados '+IntToStr(tbl_Compras.RecordCount)+' itens no pedido.');
frm_ListaVendaDetalhes.btnGravar.Enabled := true;
frm_ListaVendaDetalhes.SomarPedidos;
frm_ListaVendaDetalhes.Label2.Visible := true;

frm_ConsultaPedidos.Close;
end;
end;

procedure Tfrm_ConsultaPedidos.FiltrarPedidos;
var
status : String;
begin

status := 'FINALIZADO';

if (frm_ListaVendaDetalhes <> nil)or(frm_ListaCompDetalhes <> nil) then
begin

with tbl_Modelo do
begin
Filtered := true;
Filter := 'Status_PedTotal <> '+QuotedStr(status);
Filtered := true;

if tbl_Modelo.RecordCount = 0 then
begin
MessageDlg('Não a pedidos em ANDAMENTO!',MtInformation,[mbok],0);
Self.Close;
end;

end;
end;
end;

procedure Tfrm_ConsultaPedidos.ChamarVenda;
begin
  if frm_ListaVendaDetalhes <> nil then
  begin
    frm_ChamarVenda := Tfrm_ChamarVenda.Create(self);
    frm_ChamarVenda.ShowModal;
  end;
end;

end.
