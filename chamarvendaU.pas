unit chamarvendaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Math;

type
  Tfrm_ChamarVenda = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SomarCompra;
  public
  forn : String;
  total, compra, venda : Real;
  percentual : Currency;
    
  end;

var
  frm_ChamarVenda: Tfrm_ChamarVenda;

implementation

uses consultapedidosU, listavenddetalhes, DB, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_ChamarVenda.Image1Click(Sender: TObject);
var
dados, id_compra : string;
cod_venda, cod_vendtotal : Integer;
x : Double;
begin
  venda := 0;
  dados := InputBox('Modificando','Novo Valor:',dados);
  if Trim(dados) = '' then
  begin
    exit;
  end;

  id_compra := frm_ConsultaPedidos.tbl_Modelo.FieldByName('Cod_PedTotal').AsString;
  venda := StrToFloat(dados);

  with frm_ConsultaPedidos.tbl_Compras do
  begin
    Filtered := false;
    Filter := 'Id_Pedido = '+Quotedstr(id_compra);
    Filtered := true;

    SomarCompra;

    total := venda - compra;

    percentual := total / compra;

    with frm_ListaVendaDetalhes.tbl_Vendas do
    begin
      Filtered := false;
      Last;
      frm_ListaVendaDetalhes.tbl_VendTotal.Last;
      cod_vendtotal :=  frm_ListaVendaDetalhes.tbl_VendTotal.FieldByName('CodVendTotal').AsInteger + 1;
      frm_ConsultaPedidos.tbl_Compras.First;
      while not frm_ConsultaPedidos.tbl_Compras.Eof do
      begin
        Filtered := false;
        Last;
        cod_venda := FieldByName('Cod_Venda').AsInteger;
        Append;
        FieldByName('Cod_Venda').Value := cod_venda + 1;
        FieldByName('Cod_VendTotal').Value := cod_vendtotal;
        FieldByName('Cliente_Venda').Value := frm_ConsultaPedidos.tbl_Modelo.FieldByName('Cliente_PedTotal').Value;
        FieldByName('Produto_Venda').Value := frm_ConsultaPedidos.tbl_Compras.FieldByName('Produto_Compra').Value;
        FieldByName('Qtd_Venda').Value := frm_ConsultaPedidos.tbl_Compras.FieldByName('Quantidade_Compra').Value;
        FieldByName('Valor_Venda').Value := frm_ConsultaPedidos.tbl_Compras.FieldByName('Valor_Compra').Value + (frm_ConsultaPedidos.tbl_Compras.FieldByName('Valor_Compra').Value * percentual);
        FieldByName('Total_Venda').Value := FieldByName('Qtd_Venda').Value * FieldByName('Valor_Venda').Value;
        Post;
        Next;
        frm_ConsultaPedidos.tbl_Compras.Next;
        Filtered := false;
        Filter := 'Cod_VendTotal = '+Quotedstr(IntToStr(cod_vendtotal));
        Filtered := true;

      end;
    end;

  end;
frm_ListaVendaDetalhes.SomarPedidos;
frm_ListaVendaDetalhes.lblqtd.Visible := true;
frm_ListaVendaDetalhes.lblTotalItens.Visible := true;
Self.Close;
frm_ConsultaPedidos.Close;
frm_ListaVendaDetalhes.btnGravar.Enabled := true;




end;

procedure Tfrm_ChamarVenda.Label3Click(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_ChamarVenda.Image2Click(Sender: TObject);
begin
frm_ConsultaPedidos.Venda;
Self.Close;
frm_ConsultaPedidos.Close;
end;

procedure Tfrm_ChamarVenda.SomarCompra;
begin
compra := 0;
  with frm_ConsultaPedidos.tbl_Compras do
  begin
    First;
    while not Eof do
    begin
      compra := compra + FieldByName('Total_Compra').AsFloat;
      Next;
    end;
  end;
end;

procedure Tfrm_ChamarVenda.FormShow(Sender: TObject);
begin
  frm_ChamarVenda.Color := cor - 30;
end;

end.
