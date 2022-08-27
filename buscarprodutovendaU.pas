unit buscarprodutovendaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrm_BuscarProdutoVenda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    editProduto: TEdit;
    DBProdutos: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    ds_BuscarProduto: TDataSource;
    tbl_BuscarProduto: TTable;
    tbl_BuscarProdutoDescricao_Produto: TStringField;
    editConsulta: TEdit;
    tbl_BuscarProdutoQtd_Produto: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBProdutosDblClick(Sender: TObject);
    procedure editConsultaEnter(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure DBProdutosCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BuscarProdutoVenda: Tfrm_BuscarProdutoVenda;

implementation

uses vendasU, novopedU, buscarprodutoU, listapedU, principalU, ajustesU,
  loginU;

{$R *.dfm}

procedure Tfrm_BuscarProdutoVenda.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_BuscarProdutoVenda.Edit1Change(Sender: TObject);
begin
if Length(editConsulta.Text)= 0 then
begin
editConsulta.Text := 'DIGITE PRODUTO DESEJADO';
tbl_BuscarProduto.Filtered := false;
editConsulta.SelectAll;
end else
if editConsulta.Text <> '' then
begin
tbl_BuscarProduto.Close;
tbl_BuscarProduto.Filter := 'Descricao_Produto = ' + Quotedstr(editConsulta.Text+'*');
tbl_BuscarProduto.Open;
tbl_BuscarProduto.Filtered := true;
produto :=  tbl_BuscarProduto.FieldByName('Descricao_Produto').AsString;
editProduto.Text := produto;
end;
end;

procedure Tfrm_BuscarProdutoVenda.DBProdutosDblClick(Sender: TObject);
begin
produto := editProduto.Text;
listqtd := IntToStr(tbl_BuscarProduto.FieldByName('Qtd_Produto').AsInteger);
close;
frm_Vendas.Hide;
frm_Vendas.Show;
end;

procedure Tfrm_BuscarProdutoVenda.editConsultaEnter(Sender: TObject);
begin
editConsulta.SelectAll;
end;

procedure Tfrm_BuscarProdutoVenda.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure Tfrm_BuscarProdutoVenda.DBProdutosCellClick(Column: TColumn);
begin
editProduto.Text := tbl_BuscarProduto.FieldByName('Descricao_Produto').AsString;
end;

procedure Tfrm_BuscarProdutoVenda.FormShow(Sender: TObject);
begin
editConsulta.SetFocus;
Panel1.Color := cor;
  Panel2.Color := cor - 30;
end;

end.
