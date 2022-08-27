unit listapedU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, DBCtrls, ExtCtrls,
  Buttons, XPMan;

type
  Tfrm_ListaPedido = class(TForm)
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    GBFiltro: TGroupBox;
    GBRegistros: TGroupBox;
    lblFiltro: TLabel;
    editConsulta: TEdit;
    ds_Pedidos: TDataSource;
    DBPedidos: TDBGrid;
    tbl_Pedidos: TTable;
    tbl_PedidosProduto_Pedido: TStringField;
    tbl_PedidosValor_Pedido: TFloatField;
    tbl_PedidosTotal_Pedido: TFloatField;
    tbl_PedidosQuantidade_Pedido: TIntegerField;
    tbl_PedidosCliente_Pedido: TStringField;
    tbl_PedidosData_Pedido: TDateField;
    tbl_PedidosUsuario_Pedido: TStringField;
    tbl_PedidosFrete_Pedido: TCurrencyField;
    btnSair: TBitBtn;
    Bevel1: TBevel;
    XPManifest1: TXPManifest;
    RadioGroup1: TRadioGroup;
    RBTudo: TRadioButton;
    RBDiaAtual: TRadioButton;
    tbl_PedidosStatus_Pedido: TStringField;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
    procedure editConsultaEnter(Sender: TObject);
    procedure editConsultaExit(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBPedidosDblClick(Sender: TObject);
    procedure RBDiaAtualClick(Sender: TObject);
    procedure RBTudoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure BuscarStatus;
    procedure BuscarHoje;
    public
    dadosfiltro : String;
  end;

var
  frm_ListaPedido: Tfrm_ListaPedido;

implementation

uses principalU, buscarprodutoU, novopedU, vendasU, comprasU;

{$R *.dfm}

procedure Tfrm_ListaPedido.btnSairClick(Sender: TObject);
begin
Self.Close;

end;
procedure Tfrm_ListaPedido.FormShow(Sender: TObject);
begin
DBPedidos.Columns[0].Title.alignment := taCenter;
DBPedidos.Columns[1].Title.alignment := taCenter;
DBPedidos.Columns[2].Title.alignment := taCenter;
DBPedidos.Columns[3].Title.alignment := taCenter;
DBPedidos.Columns[4].Title.alignment := taCenter;
DBPedidos.Columns[5].Title.alignment := taCenter;
DBPedidos.Columns[6].Title.alignment := taCenter;
DBPedidos.Columns[7].Title.alignment := taCenter;
editConsulta.SelectAll;
end;

procedure Tfrm_ListaPedido.editConsultaEnter(Sender: TObject);
begin
editConsulta.Color := clSkyblue;
RBDiaAtual.Checked := false;
RBTudo.Checked := false;
end;

procedure Tfrm_ListaPedido.editConsultaExit(Sender: TObject);
begin
editConsulta.Color := clWhite;
end;

procedure Tfrm_ListaPedido.editConsultaChange(Sender: TObject);
var
situacao : String;
begin
if Length(editConsulta.Text)= 0 then
begin
editConsulta.Text := 'DIGITE SUA PESQUISA';
BuscarStatus;
editConsulta.SelectAll;
end else
if editConsulta.Text <> '' then
begin
situacao := 'EM ANDAMENTO';
tbl_Pedidos.Close;
tbl_Pedidos.Filter := 'Cliente_Pedido = ' + Quotedstr(editConsulta.Text+'*')+'and Status_Pedido = ' + Quotedstr(situacao+'*');
tbl_Pedidos.Open;
tbl_Pedidos.Filtered := true;
listcliente :=  tbl_Pedidos.FieldByName('Cliente_Pedido').AsString;
end;
end;

procedure Tfrm_ListaPedido.BuscarStatus;
var pendencia : String;
begin
pendencia := 'EM ANDAMENTO';
tbl_Pedidos.Close;
tbl_Pedidos.Filter := 'Status_Pedido = ' + Quotedstr(pendencia+'*');
tbl_Pedidos.Open;
tbl_Pedidos.Filtered := true;
end;

procedure Tfrm_ListaPedido.editConsultaClick(Sender: TObject);
begin
editConsulta.SelectAll;
end;

procedure Tfrm_ListaPedido.FormCreate(Sender: TObject);
begin
BuscarStatus;
end;

procedure Tfrm_ListaPedido.DBPedidosDblClick(Sender: TObject);
begin
if inserirqtd = 1 then
begin
if MessageDlg('Deseja anexar esse pedido a uma venda?',MtConfirmation,[mbyes,mbno],0)=mryes then
  begin
listcliente := tbl_Pedidos.FieldByName('Cliente_Pedido').Value;
produto := tbl_Pedidos.FieldByName('Produto_Pedido').Value;
listvalor := tbl_Pedidos.FieldByName('Valor_Pedido').Value;
listtotal := tbl_Pedidos.FieldByName('Total_Pedido').Value;
listqtd := tbl_Pedidos.FieldByName('Quantidade_Pedido').Value;
totalprevfrete := tbl_Pedidos.FieldByName('Frete_Pedido').AsFloat;


frm_ListaPedido.Hide;

frm_Vendas := Tfrm_Vendas.Create(Self);
frm_Vendas.ShowModal;
try
finally
frm_Vendas.Free;
frm_Vendas := nil;
end;
end;
end;
if inserirqtd = 2 then
begin
if MessageDlg('Deseja anexar esse pedido a uma Compra?',MtConfirmation,[mbyes,mbno],0)=mryes then
  begin
listcliente := tbl_Pedidos.FieldByName('Cliente_Pedido').Value;
produto := tbl_Pedidos.FieldByName('Produto_Pedido').Value;
listqtd := tbl_Pedidos.FieldByName('Quantidade_Pedido').Value;
totalprevfrete := tbl_Pedidos.FieldByName('Frete_Pedido').AsFloat;


frm_ListaPedido.Close;
frm_Compras.Hide;
frm_Compras.Show;

end;
end;
end;
procedure Tfrm_ListaPedido.BuscarHoje;
var
data : String;
filtro : String;
situacao : String;
begin
filtro := tbl_Pedidos.FieldByName('Cliente_Pedido').AsString;
if (editConsulta.Text = '')or(editConsulta.Text = 'DIGITE SUA PESQUISA') then
begin
filtro := tbl_Pedidos.FieldByName('Cliente_Pedido').AsString;
situacao := 'EM ANDAMENTO';
tbl_Pedidos.Filtered := false;
tbl_Pedidos.Close;
data := DateToStr(Date);
tbl_Pedidos.Filter := 'Status_Pedido = ' + Quotedstr(situacao+'*')+'and Data_Pedido = '+Quotedstr(data);
tbl_Pedidos.Open;
tbl_Pedidos.Filtered := true;
end else
situacao := 'EM ANDAMENTO';
tbl_Pedidos.Filtered := false;
tbl_Pedidos.Close;
data := DateToStr(Date);
tbl_Pedidos.Filter := 'Status_Pedido = ' + Quotedstr(situacao+'*')+'and Data_Pedido = '+Quotedstr(data)+'and Cliente_Pedido = '+Quotedstr(filtro);
tbl_Pedidos.Open;
tbl_Pedidos.Filtered := true;
end;

procedure Tfrm_ListaPedido.RBDiaAtualClick(Sender: TObject);
begin
BuscarHoje;
end;

procedure Tfrm_ListaPedido.RBTudoClick(Sender: TObject);
begin
BuscarStatus;
end;



procedure Tfrm_ListaPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
tbl_Pedidos.Active := false;
end;

end.
